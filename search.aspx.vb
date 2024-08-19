Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Private ReadOnly connectionString As String = "Data Source=.\SQLEXPRESS01;AttachDbFilename=C:\Users\HP\Desktop\gym-web\App_Data\Database.mdf;Integrated Security=True;User Instance=True"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Only bind the grid when the search button is clicked
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        BindGrid() ' Bind the grid when the search button is clicked
    End Sub

    Private Sub BindGrid()
        Using cn As New SqlConnection(connectionString)
            Dim query As String = "SELECT * FROM gtable WHERE username = @username AND mtype = @mtype"
            Using cmd As New SqlCommand(query, cn)
                cmd.Parameters.AddWithValue("@username", TextBox1.Text)
                cmd.Parameters.AddWithValue("@mtype", TextBox2.Text)

                Using da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet()
                    da.Fill(ds, "gtable")

                    ' Bind the result to the GridView
                    GridView1.DataSource = ds.Tables(0)
                    GridView1.DataBind()
                End Using
            End Using
        End Using
    End Sub

End Class
