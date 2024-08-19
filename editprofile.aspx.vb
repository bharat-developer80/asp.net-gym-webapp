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

        ' Connection string
        Dim connectionString As String = "Data Source=.\SQLEXPRESS01;AttachDbFilename=C:\Users\HP\Desktop\gym-web\App_Data\Database.mdf;Integrated Security=True;User Instance=True"

        Using cn As New SqlConnection(connectionString)
            ' Use parameterized queries to avoid SQL injection
            Dim query As String = "UPDATE gtable SET name = @name, address = @address, city = @city WHERE username = @username"
            Using cmd As New SqlCommand(query, cn)
                ' Add parameters safely
                cmd.Parameters.AddWithValue("@name", TextBox1.Text)
                cmd.Parameters.AddWithValue("@address", TextBox2.Text)
                cmd.Parameters.AddWithValue("@city", TextBox3.Text)
                cmd.Parameters.AddWithValue("@username", Session("un").ToString())

                Try
                    cn.Open()
                    Dim chk As Integer = cmd.ExecuteNonQuery()
                    If chk = 1 Then
                        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Your info was updated successfully.');", True)
                    Else
                        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Some error occurred. Please try again.');", True)
                    End If
                Catch ex As Exception
                    ' Handle any database errors here
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Database error: " & ex.Message & "');", True)
                Finally
                    cn.Close()
                End Try
            End Using
        End Using
    End Sub
End Class
