<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Changepassword.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.content-container {
    width: 50%;
    margin: 40px auto;
    padding: 20px;
    background-color: #fff; /* White background for the content */
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Subtle shadow */
}

h2 {
    text-align: center;
    color: #333; /* Dark text for the heading */
}

.form-section {
    margin-bottom: 20px;
}

.form-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn-primary {
    background-color: #FF9900; /* Button color */
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

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-container">
        <h2>Change Password</h2>
        
        <div class="form-section">
            <asp:Label ID="Label3" runat="server" Text="Old Password"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-section">
            <asp:Label ID="Label4" runat="server" Text="New Password"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-section">
            <asp:Label ID="Label5" runat="server" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-section">
            <asp:Button ID="Button1" runat="server" Text="Change" CssClass="btn-primary" />
        </div>
    </div>
</asp:Content>
