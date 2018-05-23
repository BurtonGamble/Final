<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("nav ul li:nth-of-type(5)").addClass("ActivePageMenuItem");
        });
    </script>
</asp:Content>
<asp:Content ID="ContentMain1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        Select a category:
        <asp:DropDownList runat="server" ID="CategoryDropDownList"></asp:DropDownList>
        <br />
        Select a class:
        <asp:DropDownList runat="server" ID="ClassDropDownList"></asp:DropDownList>
        <br />
        <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />
    </p>
</asp:Content>
<asp:Content ID="ContentMain2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="LogOutButton" runat="server" Text="Log Out" OnClick="LogOutButton_Click" />
    </p>
</asp:Content>
<asp:Content ID="ContentSide" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>