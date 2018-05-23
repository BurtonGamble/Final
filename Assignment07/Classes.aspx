<%@ Page Title="Classes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Classes.aspx.cs" Inherits="Classes" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("nav ul li:nth-of-type(2)").addClass("ActivePageMenuItem");
        });
    </script>
</asp:Content>
<asp:Content ID="ContentMain1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Table Title - Classes!</h1>
    <p>
        <img runat="server" src="~\images\table01.jpg" alt="Sample Image" class="tableimage" />
        <asp:ListView runat="server" ID="ListView1" DataSourceID="DataSource1">
        </asp:ListView>
        <asp:SqlDataSource ID="DataSource1" runat="server"></asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="ContentMain2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label" />
</asp:Content>
<asp:Content ID="ContentSide" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <h1>Name of selected Class
    </h1>
    Description of selected/highlighted class goes here.
</asp:Content>