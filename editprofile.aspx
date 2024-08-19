<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="editprofile.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .form-container {
        width: 50%;
        margin: 20px auto;
        padding: 20px;
        border: 1px solid #ddd;
        
        background-color: #f9f9f9;

    }
    .form-label {
        display: inline-block;
        width: 120px; /* Increased width for better alignment */
        font-weight: bold;
        margin-bottom: 8px;
        color: #333; /* Slightly darker color for better readability */
    }
    .form-input {
     
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
       
        font-size: 16px; /* Increased font size for readability */
        background-color: #fff; /* White background for input */
     
    }
    .form-input:focus {
        border-color: #4CAF50; /* Highlight border color on focus */
        outline: none; /* Remove default outline */
    }
    .form-button {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        
        cursor: pointer;
        font-size: 16px; /* Match font size with input fields */
        
    }
    .form-button:hover {
        background-color: #45a049;
    }
    .form-group {
        margin-bottom: 15px;
        display:inline-table;
       
    }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-container">
        <div class="form-group">
            <asp:Label ID="Label1" CssClass="form-label" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="TextBox1" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" CssClass="form-label" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="TextBox2" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" CssClass="form-label" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="TextBox3" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" CssClass="form-button" runat="server" Text="Edit" 
                Height="40px" Width="147px" />
        </div>
    </div>
</asp:Content>
