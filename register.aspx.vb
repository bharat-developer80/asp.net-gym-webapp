Imports System.Data
Imports System.Data.SqlClient

Partial Class register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Page load logic (if any)
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        ' Set the start and end dates based on the selected fee
        Dim selectedFee As Decimal
        If Decimal.TryParse(DropDownListFees.SelectedValue, selectedFee) Then
            SetDateRangeBasedOnFee(selectedFee)
        End If

        ' Connection string
        Dim connectionString As String = "Data Source=.\SQLEXPRESS01;AttachDbFilename=C:\Users\HP\Desktop\gym-web\App_Data\Database.mdf;Integrated Security=True;User Instance=True"
        Using cn As New SqlConnection(connectionString)
            ' Insert query with correctly aligned columns and values
            Dim query As String = "INSERT INTO gtable (username, password, name, address, city, mtype, goal, pmthd, sdate, edate) VALUES (@username, @password, @name, @address, @city, @mtype, @goal, @pmthd, @sdate, @edate)"
            Using cmd As New SqlCommand(query, cn)
                ' Add parameters safely
                cmd.Parameters.AddWithValue("@username", TextBox1.Text)
                cmd.Parameters.AddWithValue("@password", TextBox2.Text)
                cmd.Parameters.AddWithValue("@name", TextBox3.Text)
                cmd.Parameters.AddWithValue("@address", TextBox4.Text)
                cmd.Parameters.AddWithValue("@city", TextBox5.Text)
                cmd.Parameters.AddWithValue("@mtype", DropDownList1.SelectedValue) ' Corrected here
                cmd.Parameters.AddWithValue("@goal", TextBox7.Text)
                cmd.Parameters.AddWithValue("@pmthd", DropDownListPaymentMethod.SelectedValue) ' Corrected here
                cmd.Parameters.AddWithValue("@sdate", TextBox10.Text)
                cmd.Parameters.AddWithValue("@edate", TextBox11.Text)

                cn.Open()
                cmd.ExecuteNonQuery()
                MsgBox("Registration successful")
                Response.Redirect("~/login.aspx")
                cn.Close()
            End Using
        End Using
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect("~/Login.aspx")
    End Sub

    Private Sub SetDateRangeBasedOnFee(ByVal fee As Decimal)
        Dim startDate As DateTime = DateTime.Now ' Set the start date to today
        Dim endDate As DateTime

        Select Case fee
            Case 500
                ' 1 month
                endDate = startDate.AddMonths(1)
            Case 1800
                ' 3 months
                endDate = startDate.AddMonths(3)
            Case 3000
                ' 6 months
                endDate = startDate.AddMonths(6)
            Case 6000
                ' 1 year
                endDate = startDate.AddYears(1)
            Case Else
                ' If fee does not match known values, do not set date range
                endDate = startDate
        End Select

        ' Set the date values in TextBoxes
        TextBox10.Text = startDate.ToString("yyyy-MM-dd")
        TextBox11.Text = endDate.ToString("yyyy-MM-dd")
    End Sub
End Class
