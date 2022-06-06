<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="content_HR_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <asp:GridView ID="grid_app" runat="server" AutoGenerateColumns="False" EmptyDataText="No record found" onrowdatabound="grid_app_RowDataBound" CssClass="gvsh" AllowSorting="True"   ><%--onrowdatabound="grid_app_RowDataBound"--%>
        <Columns>
            <asp:BoundField DataField="id" ItemStyle-Font-Size="0" />
            <asp:TemplateField ItemStyle-Width="40px">
                <HeaderTemplate>
                    <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true"  />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkEmp" runat="server" onclick="CheckBoxCount();"></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="date_app" SortExpression="date_app" HeaderText="Date" dataformatstring="{0:MM/dd/yyyy}" />
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <ItemTemplate>
                    <a href="appldet?app_id=<%# Eval("id") %>" target="_blank"><%# Eval("name") %></a>
                    <asp:LinkButton ID="lnk_editStat"  ToolTip="Click to view."  runat="server" style="display:none; float:left; margin-right:5px; font-size:11px;" OnClick="click_view" Text='<%# Bind("name") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Position Desired" SortExpression="pos_desire">
                <ItemTemplate>
                    <asp:LinkButton ID="lnk_pd" runat="server" Text='<%# Bind("pos_desire") %>' ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Property" SortExpression="property">
                <ItemTemplate>
                    <asp:LinkButton ID="lb_pro" runat="server"  Text='<%# Bind("property") %>' ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:LinkButton ID="lnk_st" runat="server"  ForeColor="maroon"  style="  text-transform:none;" Text='<%# Bind("status") %>' ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="recommendation" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
            <asp:TemplateField>
                <ItemTemplate> 
                    <asp:LinkButton ID="lnk_con" ForeColor="DarkOrange" runat="server"   OnClientClick="ConfirmRem()" Text="Recommendation"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:LinkButton ID="lnk_note" style="color:#0074a2; float:right; margin-right:5px;  font-size:11px;"  runat="server" Text='remarks'><img src="style/img/icon/i-detail.PNG" width="18px" alt="delete" /></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
   <HeaderStyle CssClass="GridviewScrollHeader" /> 
    <RowStyle CssClass="GridviewScrollItem" /> 
    <PagerStyle CssClass="GridviewScrollPager" /> 
    </asp:GridView>

    </form>
</body>
</html>
