<%@ Page Title="Login Request" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginRequest.aspx.cs" Inherits="LoginRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("nav ul li:nth-of-type(3)").addClass("ActivePageMenuItem");
        });
    </script>
</asp:Content>

<asp:Content ID="ContentMain1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Please fill out the following form to gain login access</h1>
    <br />
    <div class="MyFormDiv">
        <div class="Table">
            <div class="TableRow">
                <div class="TableCell">Name:</div>
                <div class="TableCell">
                    <asp:TextBox runat="server" ID="tbName" Width="200px" placeholder="Ellen Ripley" />
                </div>
            </div>
            <div class="TableRow">
                <div class="TableCell">Email Address:</div>
                <div class="TableCell">
                    <asp:TextBox runat="server" ID="tbEmail" Width="200px" placeholder="thedoctor@tardis.edu" />
                </div>
            </div>
            <div class="TableRow">
                <div class="TableCell">Display Name:</div>
                <div class="TableCell">
                    <asp:TextBox runat="server" ID="tbHandle" Width="200px" placeholder="Rincewind" />
                </div>
            </div>
            <div class="TableRow">
                <div class="TableCell" style="vertical-align: top">Reason for access?</div>
                <div class="TableCell">
                    <asp:TextBox runat="server" ID="tbReasons" Width="400px" Rows="5" TextMode="MultiLine" />
                </div>
            </div>
            <div class="TableRow">
                <div class="TableCell" style="vertical-align: top">New Login?</div>
                <div class="TableCell">
                    <asp:RadioButton ID="RadioButtonNew" runat="server" Text="New Login"
                        CssClass="style2" Checked="True" GroupName="LoginType" />
                    &nbsp;<asp:RadioButton ID="RadioButtonReactivate" runat="server" Text="Reactivate Login"
                        CssClass="style1" GroupName="LoginType" />
                </div>
            </div>
            <div class="TableRow">
                <div class="TableCell" style="vertical-align: top">
                    Date access needed by:
                </div>
                <div class="TableCell">
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </div>
            </div>
            <div class="TableFoot">
                <asp:Button runat="server" ID="Button1" Text="Submit" OnClick="Button1_Click" CssClass="RoundedButton" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ContentMain2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="The Number of Databases is: " Style="font-size: large"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="ContentAside" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>