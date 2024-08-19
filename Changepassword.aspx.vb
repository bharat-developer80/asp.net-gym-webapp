Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        ' Check if session variable is set
        If Session("un") Is Nothing Then
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('User session is not set. Please log in again.');", True)
            Return
        End If

        Dim connectionString As String = "Data Source=.\SQLEXPRESS01;AttachDbFilename=C:\Users\HP\Desktop\gym-web\App_Data\Database.mdf;Integrated Security=True;User Instance=True"

        Using cn As New SqlConnection(connectionString)
            ' Check if the current password is correct
            Dim query As String = "SELECT COUNT(username) FROM gtable WHERE username = @username AND password = @password"
            Using cmd As New SqlCommand(query, cn)
                cmd.Parameters.AddWithValue("@username", Session("un").ToString())
                cmd.Parameters.AddWithValue("@password", TextBox1.Text)

                cn.Open()
                Dim userCount As Integer = Convert.ToInt32(cmd.ExecuteScalar())
                cn.Close()

                If userCount > 0 Then
                    ' Update the password if the current password is correct
                    Dim updateQuery As String = "UPDATE gtable SET password = @newPassword WHERE username = @username"
                    Using cmdx As New SqlCommand(updateQuery, cn)
                        cmdx.Parameters.AddWithValue("@newPassword", TextBox5.Text)
                        cmdx.Parameters.AddWithValue("@username", Session("un").ToString())

                        cn.Open()
                        cmdx.ExecuteNonQuery()
                        cn.Close()

                        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Password changed successfully.');", True)
                    End Using
                Else
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Current password is incorrect.');", True)
                End If
            End Using
        End Using
    End Sub
End Class
