<%@ Page Title="My Classes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyClasses.aspx.cs" Inherits="MyClasses" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("nav ul li:nth-of-type(6)").addClass("ActivePageMenuItem");
        });
    </script>
</asp:Content>
<asp:Content ID="ContentMain1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Table Title - My Classes!</h1>
    <p>
        <img runat="server" src="~\images\table01.jpg" alt="Sample Image" class="tableimage" />
    </p>
</asp:Content>
<asp:Content ID="ContentMain2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Log Out!" OnClick="Button1_Click" />
</asp:Content>
<asp:Content ID="ContentSide" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <h1>Name of selected Class</h1>
    Description of selected/highlighted class goes here.
</asp:Content>