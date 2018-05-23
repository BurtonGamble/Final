<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("nav ul li:nth-of-type(4)").addClass("ActivePageMenuItem");
        });
    </script>
</asp:Content>

<asp:Content ID="ContentMain1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Please enter your username and password</h1>
    <br />
    <div class="MyFormDiv">
        <div class="Table">
            <div class="TableRow">
                <div class="TableCell">User Name:</div>
                <div class="TableCell">
                    <asp:TextBox runat="server" ID="tbUserName" Width="200px" placeholder="Rincewind" />
                </div>
            </div>
            <div class="TableRow">
                <div class="TableCell">Password:</div>
                <div class="TableCell">
                    <asp:TextBox runat="server" ID="tbPassword" Width="200px" placeholder="•••••™" TextMode="Password" />
                </div>
            </div>
            <div class="TableFoot">
                <asp:Button runat="server" ID="Button1" Text="Log in" OnClientClick="ClientCodeButton_Click()" OnClick="Button1_Click" CssClass="RoundedButton" Width="75px" /><br />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ContentMain2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="ContentSide" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label 1"></asp:Label>
</asp:Content>