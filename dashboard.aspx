<%@ Page Title="Dashboard" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Dashboard - Members List</title>
    <style>
    .dashboard-container {
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* Header Style */
    .dashboard-container h2 {
        font-size: 24px;
        color: #333;
        border-bottom: 2px solid #007BFF;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }

    /* Button Style */
    .btn-add {
        background-color: #007BFF;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
        margin-bottom: 20px;
        text-decoration: none;
        display: inline-block;
    }

    .btn-add:hover {
        background-color: #0056b3;
    }

    /* GridView Table Style */
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    /* Table Header Style */
    .table thead {
        background-color: #007BFF;
        color: #fff;
    }

    .table thead th {
        padding: 10px;
        text-align: left;
    }

    /* Table Body Style */
    .table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .table tbody tr:hover {
        background-color: #ddd;
    }

    /* Table Cell Style */
    .table td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    /* Table Border Style */
    .table {
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="dashboard-container">
        <h2>Members List</h2>
        <a href="register.aspx" class="btn-add">Add Member</a>
        <asp:Button ID="btnUndo" runat="server" Text="Undo" CssClass="btn-add" OnClick="btnUndo_Click" />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="Username" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="address" HeaderText="Address" />
                <asp:BoundField DataField="city" HeaderText="City" />
                <asp:BoundField DataField="mtype" HeaderText="Member Type" />
                <asp:BoundField DataField="goal" HeaderText="Goal" />
                <asp:BoundField DataField="pmthd" HeaderText="Payment Method" />
                <asp:BoundField DataField="sdate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="edate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:ButtonField CommandName="Remove" Text="Remove" ButtonType="Button" HeaderText="Actions" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

