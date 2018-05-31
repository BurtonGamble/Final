<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="ASPDemoSites_ClassRegistrationSite_AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p style="font-size: large; font-weight: bold; color: #000000">
        Use the page to review the contents of the database:
    </p>

    <p>
        Classes Table
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
        DataKeyNames="ClassId" DataSourceID="SqlDataSourceClasses"
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
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceClasses" runat="server"
            ConnectionString="<%$ ConnectionStrings:AdvWebProjectConnectionString %>"
            ProviderName="<%$ ConnectionStrings:AdvWebProjectConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM [Classes]" DataSourceMode="DataReader"></asp:SqlDataSource>
    </p>

    <p>
        Class Students Table
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
        DataKeyNames="ClassId,StudentId" DataSourceID="SqlDataSourceClassStudents"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ClassId" HeaderText="ClassId" ReadOnly="True"
                SortExpression="ClassId" />
            <asp:BoundField DataField="StudentId" HeaderText="StudentId" ReadOnly="True"
                SortExpression="StudentId" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceClassStudents" runat="server"
            ConnectionString="<%$ ConnectionStrings:AdvWebProjectConnectionString %>"
            ProviderName="<%$ ConnectionStrings:AdvWebProjectConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM [ClassStudents]" DataSourceMode="DataReader"></asp:SqlDataSource>
    </p>

    <p>
        Students Table
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataKeyNames="StudentId" DataSourceID="SqlDataSourceStudents"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="StudentId" HeaderText="StudentId" ReadOnly="True"
                SortExpression="StudentId" />
            <asp:BoundField DataField="StudentName" HeaderText="StudentName"
                SortExpression="StudentName" />
            <asp:BoundField DataField="StudentEmail" HeaderText="StudentEmail"
                SortExpression="StudentEmail" />
            <asp:BoundField DataField="StudentLogin" HeaderText="StudentLogin"
                SortExpression="StudentLogin" />
            <asp:BoundField DataField="StudentPassword" HeaderText="StudentPassword"
                SortExpression="StudentPassword" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server"
            ConnectionString="<%$ ConnectionStrings:AdvWebProjectConnectionString %>"
            ProviderName="<%$ ConnectionStrings:AdvWebProjectConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM [Students]" DataSourceMode="DataReader"></asp:SqlDataSource>
    </p>

    <p>
        Login Request Table
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False"
        DataKeyNames="LoginId" DataSourceID="SqlDataSourceLoginRequest"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" EmptyDataText="No rows are currently in this table"
        ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="LoginId" HeaderText="LoginId" InsertVisible="False"
                ReadOnly="True" SortExpression="LoginId" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress"
                SortExpression="EmailAddress" />
            <asp:BoundField DataField="LoginName" HeaderText="LoginName"
                SortExpression="LoginName" />
            <asp:BoundField DataField="NewOrReactivate" HeaderText="NewOrReactivate"
                SortExpression="NewOrReactivate" />
            <asp:BoundField DataField="ReasonForAccess" HeaderText="ReasonForAccess"
                SortExpression="ReasonForAccess" />
            <asp:BoundField DataField="DateNeededBy" HeaderText="DateNeededBy"
                SortExpression="DateNeededBy" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceLoginRequest" runat="server"
            ConnectionString="<%$ ConnectionStrings:AdvWebProjectConnectionString %>"
            ProviderName="<%$ ConnectionStrings:AdvWebProjectConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM [LoginRequests]" DataSourceMode="DataReader"></asp:SqlDataSource>
    </p>

    <p>
        Stored Procedures and Views
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSprocesAndViews"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" EmptyDataText="No rows are currently in this table"
        ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    </p>
    <asp:SqlDataSource ID="SqlDataSourceSprocesAndViews" runat="server"
        ConnectionString="<%$ ConnectionStrings:AdvWebProjectConnectionString %>"
        ProviderName="<%$ ConnectionStrings:AdvWebProjectConnectionString.ProviderName %>"
        SelectCommand="Select Name  from SysObjects Where xType in ('p', 'v')
"
        DataSourceMode="DataReader"></asp:SqlDataSource>
</asp:Content>