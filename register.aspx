<%@ Page Language="VB" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Register</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; /* Light grey background for the whole page */
        }

        .register-container {
            width: 50%;
            margin: 50px auto; /* Center the container with space around */
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff; /* White background for the form */
            box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Adds a subtle shadow */
        }

        .register-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .register-header h1 {
            font-size: 2em;
            color: #FF9933;
            font-weight: bold;
            font-style: italic;
        }

        .form-label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333; /* Darker color for better readability */
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
</head>
<body>
   <form id="form1" runat="server">
    <div class="register-container">
        <div class="register-header">
            <h1>GYM Management Site</h1>
        </div>
        <div>
            <asp:Label ID="Label1" CssClass="form-label" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="TextBox1" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label6" CssClass="form-label" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="TextBox5" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label2" CssClass="form-label" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox2" CssClass="form-input" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label7" CssClass="form-label" runat="server" Text="Member Type"></asp:Label>
            <asp:DropDownList ID="DropDownList1" CssClass="form-input" runat="server">
                <asp:ListItem Value="Standard">Standard</asp:ListItem>
                <asp:ListItem Value="Premium">Premium</asp:ListItem>
                <asp:ListItem Value="VIP">VIP</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="Label4" CssClass="form-label" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="TextBox3" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label8" CssClass="form-label" runat="server" Text="Goal"></asp:Label>
            <asp:TextBox ID="TextBox7" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label5" CssClass="form-label" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="TextBox4" CssClass="form-input" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label10" CssClass="form-label" runat="server" Text="Payment Method"></asp:Label>
            <asp:DropDownList ID="DropDownListPaymentMethod" CssClass="form-input" runat="server">
                <asp:ListItem Value="Cash">Cash</asp:ListItem>
                <asp:ListItem Value="CreditCard">Credit Card</asp:ListItem>
                <asp:ListItem Value="BankTransfer">Bank Transfer</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="Label13" CssClass="form-label" runat="server" Text="Gym Fees"></asp:Label>
            <asp:DropDownList ID="DropDownListFees" CssClass="form-input" runat="server" AutoPostBack="False" OnChange="updateDates()">
    <asp:ListItem Value="500">500 Rupees - 1 Month</asp:ListItem>
    <asp:ListItem Value="1800">1800 Rupees - 3 Months</asp:ListItem>
    <asp:ListItem Value="3000">3000 Rupees - 6 Months</asp:ListItem>
    <asp:ListItem Value="6000">6000 Rupees - 1 Year</asp:ListItem>
</asp:DropDownList>

        </div>
        <div>
            <asp:Label ID="Label11" CssClass="form-label" runat="server" Text="Start Date"></asp:Label>
            <asp:TextBox ID="TextBox10" CssClass="form-input" runat="server" TextMode="Date"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label12" CssClass="form-label" runat="server" Text="End Date"></asp:Label>
            <asp:TextBox ID="TextBox11" CssClass="form-input" runat="server" TextMode="Date"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="Button1" CssClass="form-button" runat="server" Text="Register" OnClick="Button1_Click" />
        </div>
        <div>
            <asp:LinkButton ID="LinkButton1" CssClass="link-button" runat="server" Text="Existing User?" />
        </div>
    </div>
</form>


</body>
</html>
