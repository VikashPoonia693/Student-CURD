<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StudentCURD.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 250px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">StudentId</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">StudentName</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Subject</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" initialvalue="Select Subject" runat="server" Height="16px" Width="126px">
                            <asp:ListItem>Select Subject</asp:ListItem>
                            <asp:ListItem>Scince</asp:ListItem>
                            <asp:ListItem>Match</asp:ListItem>
                            <asp:ListItem>English</asp:ListItem>
                            <asp:ListItem>Computer</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Standerd</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" initialvalue="Select Standerd" runat="server" Height="16px" Width="126px">
                            <asp:ListItem>Select Standerd</asp:ListItem>
                            <asp:ListItem>1st</asp:ListItem>
                            <asp:ListItem>2ed</asp:ListItem>
                            <asp:ListItem>3ed</asp:ListItem>
                            <asp:ListItem>4th</asp:ListItem>
                            <asp:ListItem>5th</asp:ListItem>
                            <asp:ListItem>6th</asp:ListItem>
                            <asp:ListItem>7th</asp:ListItem>
                            <asp:ListItem>8th</asp:ListItem>
                            <asp:ListItem>9th</asp:ListItem>
                            <asp:ListItem>10th</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">StanderdId</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                        <asp:Button ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:TemplateField HeaderText="StudentId">
                    <ItemTemplate>
                        <asp:Label ID="LabelId" runat="server" Text='<%# Eval("StudentId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="StudentName">
                     <ItemTemplate>
                        <asp:Label ID="LabelName" runat="server" Text='<%# Eval("StudentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Subject">
                     <ItemTemplate>
                        <asp:Label ID="LabelSubject" runat="server" Text='<%# Eval("Subject") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Standerd">
                     <ItemTemplate>
                        <asp:Label ID="LabelStanderd" runat="server" Text='<%# Eval("Standerd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="StanderdId">
                     <ItemTemplate>
                        <asp:Label ID="LabelStanderdId" runat="server" Text='<%# Eval("StanderdId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs %>" SelectCommand="SELECT * FROM [Standerd]"></asp:SqlDataSource>
    </form>
</body>
</html>
