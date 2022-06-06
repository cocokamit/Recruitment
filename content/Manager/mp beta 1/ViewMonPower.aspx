<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewMonPower.aspx.cs" Inherits="content_Manager_ViewMonPower" MasterPageFile="~/content/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="content" runat="server" ID="view_mp">


<div class="round">
    <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
        <Columns>
            <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
            <asp:BoundField DataField="description" SortExpression="description" HeaderText="Description"/>
            <asp:BoundField DataField="ngalan" SortExpression="ngalan" HeaderText="Request By"/>
           <%-- <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" OnClick="view" Text = "edit"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="delete" ForeColor="Maroon" Text = "delete"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Width="70" />
            </asp:TemplateField>   --%>
        </Columns>
    </asp:GridView>
</div>

</asp:Content>


