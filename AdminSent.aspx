﻿<%@ Page Title="" Language="VB" MasterPageFile="~/AdminMaster.master" AutoEventWireup="false" CodeFile="AdminSent.aspx.vb" Inherits="AdminSent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

   
        .style4
        {
            width: 750px;
            color: #006666; 
            font-size: large; 
            background-color: #DBDBDB;
        }

   
        .style5
        {
            width: 100%;
        }
        .style7
        {
        }
        .style8
        {
            width: 157px;
        }

   
        .style9
        {
            width: 308px;
        }
        .style10
        {
            width: 112px;
        }

   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="style4">
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" BorderColor="#FF99FF" BorderStyle="Solid" 
                    BorderWidth="2px">
                    <table class="style5" cellspacing="5">
                        <tr>
                            <td colspan="3" style="background-color: #FFD5FF">
                                Sent<asp:Label ID="lblCount" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style10" align="center">
                                &nbsp;</td>
                            <td align="center" class="style7">
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style10">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" class="style10">
                                &nbsp;</td>
                            <td align="center">
                                <asp:GridView ID="gvSent" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                                    OnRowCommand="gvSent_RowCommand" 
                                    
                                    style="margin-left: 0px; margin-top: 15px; font-size: medium; color: #006666; background-color: #00B7B7;">
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="UserTo" HeaderText="To" />
                                        <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                        <asp:BoundField DataField="DateTime" HeaderText="Date &amp; Time" />
                                        <asp:TemplateField HeaderText="Mark">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbSelect0" runat="server" 
                                                    CommandArgument='<%#Eval("MailId")%>' CommandName="Select" Text="Select"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style10">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" class="style10">
                                <asp:Button ID="btnView" runat="server" BackColor="#CCCCCC" ForeColor="#333333" 
                                    style="font-family: Calibri; font-size: medium;" Text="View" Visible="False" />
                            </td>
                            <td align="right" class="style8">
                                <asp:Button ID="btnDelete" runat="server" BackColor="#CCCCCC" 
                                    ForeColor="#333333" style="font-size: medium; font-family: Calibri;" 
                                    Text="Delete" Visible="False" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style10">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Panel ID="Panel2" runat="server" BorderColor="#FF99FF" BorderStyle="Solid" 
                    BorderWidth="2px">
                    <table class="style5">
                        <tr>
                            <td align="right">
                                <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/AdminLogin.aspx">Log In</asp:HyperLink>
                                <asp:Label ID="lblUser" runat="server" ForeColor="#FF0066" 
                                    style="color: #006666"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="btnLogout" runat="server" BackColor="#CCCCCC" 
                                    ForeColor="#333333" Text="Log  Out" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    
</asp:Content>

