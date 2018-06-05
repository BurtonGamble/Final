<%@ Page Title="My Classes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyClasses.aspx.cs" Inherits="MyClasses" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("nav ul li:nth-of-type(6)").addClass("ActivePageMenuItem");
        });
    </script>
</asp:Content>
<asp:Content ID="ContentMain1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>My Classes</h1>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            DataKeyNames="ClassId"
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ClassId" HeaderText="ClassId" ReadOnly="True"
                    SortExpression="ClassId" />
                <asp:BoundField DataField="ClassName" HeaderText="ClassName"
                    SortExpression="ClassName" />
                <asp:BoundField DataField="ClassDate" HeaderText="ClassDate"
                    SortExpression="ClassDate" />
                <asp:BoundField DataField="ClassDescription" HeaderText="ClassDescription"
                    SortExpression="ClassDescription" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </p>
</asp:Content>
<asp:Content ID="ContentMain2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="ContentSide" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="LogOutButton" runat="server" Text="Log Out" OnClick="LogOutButton_Click" />
    </p>
</asp:Content>