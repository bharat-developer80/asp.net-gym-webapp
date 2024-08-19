<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Login.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
    .login-container {
        width: 30%;
        margin: 50px auto; /* Center align with space around */
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: #f9f9f9;
        box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Adds a subtle shadow */
    }
    .login-header {
        text-align: center;
        margin-bottom: 20px;
    }
    .login-header h1 {
        font-size: 2em;
        color: #FF9933;
        font-weight: bold;
        font-style: italic;
    }
    .form-label {
        display: block;
        font-weight: bold;
        margin-bottom: 8px;
        color: #333; /* Slightly darker color for better readability */
    }
    .form-input {
        width: calc(100% - 22px); /* Full width minus padding */
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px; /* Increased font size for readability */
        background-color: #fff; /* White background for input */
        box-sizing: border-box; /* Ensures padding is included in width */
    }
    .form-input:focus {
        border-color: #4CAF50; /* Highlight border color on focus */
        outline: none; /* Remove default outline */
    }
    .form-button {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px; /* Match font size with input fields */
        transition: background-color 0.3s; /* Smooth transition for hover effect */
    }
    .form-button:hover {
        background-color: #45a049;
    }
    .link-button {
        display: block;
        text-align: center;
        font-weight: bold;
        font-size: large;
        color: #FF9966;
        margin-top: 15px;
        text-decoration: none; /* Remove underline from links */
    }
    .link-button:hover {
        text-decoration: underline; /* Add underline on hover */
    }
</style>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="login-container">
        <div class="login-header">
            <h1>GYM Management Site</h1>
            <p>
                <asp:Image ID="Image1" runat="server" Height="153px" 
                    ImageUrl="~/images/logo.png" Width="285px" />
            </p>
        </div>
        <div>
            <asp:Label ID="Label1" CssClass="form-label" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="TextBox1" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label2" CssClass="form-label" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox2" CssClass="form-input" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="Button1" CssClass="form-button" runat="server" Text="Sign In" OnClick="Button1_Click" />
        </div>
        <div>
            <asp:LinkButton ID="LinkButton1" CssClass="link-button" runat="server" OnClick="LinkButton1_Click">New User?</asp:LinkButton>
        </div>
    </div>
</asp:Content>

