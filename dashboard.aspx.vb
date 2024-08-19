Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI

Partial Class Dashboard
    Inherits System.Web.UI.Page

    ' Session variable to store the last removed member
    Private Const SESSION_DELETED_MEMBER As String = "DeletedMember"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadMembersData()
        End If
    End Sub

    Private Sub LoadMembersData()
        Dim connectionString As String = "Data Source=.\SQLEXPRESS01;AttachDbFilename=C:\Users\HP\Desktop\gym-web\App_Data\Database.mdf;Integrated Security=True;User Instance=True"
        Using cn As New SqlConnection(connectionString)
            Dim query As String = "SELECT username, name, address, city, mtype, goal, pmthd, sdate, edate FROM gtable"
            Using cmd As New SqlCommand(query, cn)
                cn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                GridView1.DataSource = reader
                GridView1.DataBind()
                cn.Close()
            End Using
        End Using
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Remove" Then
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = GridView1.Rows(rowIndex)
            Dim username As String = row.Cells(0).Text

            ' Store the deleted member in session
            Session(SESSION_DELETED_MEMBER) = New With {
                Key .Username = username,
                Key .Row = row
            }

            RemoveUser(username)
        End If
    End Sub

    Private Sub RemoveUser(ByVal username As String)
        Dim connectionString As String = "Data Source=.\SQLEXPRESS01;AttachDbFilename=C:\Users\HP\Desktop\gym-web\App_Data\Database.mdf;Integrated Security=True;User Instance=True"
        Using cn As New SqlConnection(connectionString)
            Dim query As String = "DELETE FROM gtable WHERE username = @username"
            Using cmd As New SqlCommand(query, cn)
                cmd.Parameters.AddWithValue("@username", username)

                cn.Open()
                cmd.ExecuteNonQuery()
                cn.Close()
            End Using
        End Using

        ' Reload the data to reflect the changes
        LoadMembersData()
    End Sub

    Protected Sub btnUndo_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim deletedMember = CType(Session(SESSION_DELETED_MEMBER), Object)

        If deletedMember IsNot Nothing Then
            AddUser(deletedMember.Username, deletedMember.Row)
            Session(SESSION_DELETED_MEMBER) = Nothing
        End If
    End Sub

    Private Sub AddUser(ByVal username As String, ByVal row As GridViewRow)
        Dim connectionString As String = "Data Source=.\SQLEXPRESS01;AttachDbFilename=C:\Users\HP\Desktop\gym-web\App_Data\Database.mdf;Integrated Security=True;User Instance=True"
        Dim name = row.Cells(1).Text
        Dim address = row.Cells(2).Text
        Dim city = row.Cells(3).Text
        Dim mtype = row.Cells(4).Text
        Dim goal = row.Cells(5).Text
        Dim pmthd = row.Cells(6).Text
        Dim sdate = row.Cells(7).Text
        Dim edate = row.Cells(8).Text

        Using cn As New SqlConnection(connectionString)
            Dim query As String = "INSERT INTO gtable (username, name, address, city, mtype, goal, pmthd, sdate, edate) VALUES (@username, @name, @address, @city, @mtype, @goal, @pmthd, @sdate, @edate)"
            Using cmd As New SqlCommand(query, cn)
                cmd.Parameters.AddWithValue("@username", username)
                cmd.Parameters.AddWithValue("@name", name)
                cmd.Parameters.AddWithValue("@address", address)
                cmd.Parameters.AddWithValue("@city", city)
                cmd.Parameters.AddWithValue("@mtype", mtype)
                cmd.Parameters.AddWithValue("@goal", goal)
                cmd.Parameters.AddWithValue("@pmthd", pmthd)
                cmd.Parameters.AddWithValue("@sdate", sdate)
                cmd.Parameters.AddWithValue("@edate", edate)

                cn.Open()
                cmd.ExecuteNonQuery()
                cn.Close()
            End Using
        End Using

        ' Reload the data to reflect the changes
        LoadMembersData()
    End Sub
End Class
