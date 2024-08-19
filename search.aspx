<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="search.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.content-container {
    width: 80%;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff; /* White background for the content */
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Subtle shadow */
}

.form-section {
    margin-bottom: 15px;
}

.form-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn-primary {
    background-color: #FF9933; /* Button color */
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
}

.btn-primary:hover {
    background-color: #e68a00; /* Slightly darker shade for hover */
}

.grid-container {
    margin: 20px auto;
    width: 100%;
}

.grid-table {
    width: 100%;
    border-collapse: collapse;
}

.grid-table th, .grid-table td {
    border: 1px solid #ddd;
    padding: 8px;
}

.grid-table th {
    background-color: #f4f4f4;
}

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-container">
        <div class="form-section">
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-section">
            <asp:Label ID="Label3" runat="server" Text="Member Type"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-section">
            <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn-primary" />
            <br />
        </div>

        <div class="grid-container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CssClass="grid-table" AllowPaging="True" AllowSorting="True">
    <Columns>
        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
        <asp:BoundField DataField="mtype" HeaderText="mtype" SortExpression="mtype" />
        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
        <asp:BoundField DataField="goal" HeaderText="goal" SortExpression="goal" />
        <asp:BoundField DataField="pmthd" HeaderText="pmthd" SortExpression="pmthd" />
        <asp:BoundField DataField="sdate" HeaderText="sdate" SortExpression="sdate" />
        <asp:BoundField DataField="edate" HeaderText="edate" SortExpression="edate" />
    </Columns>
</asp:GridView>

            <!-- Remove this SqlDataSource control from markup -->
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" 
    SelectCommand="SELECT [username], [mtype], [name], [address], [city], [goal], [pmthd], [sdate], [edate] FROM [gtable]">
</asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
