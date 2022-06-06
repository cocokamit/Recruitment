<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewMonPower.aspx.cs" Inherits="content_Manager_ViewMonPower" MasterPageFile="~/content/MasterPage.master" %>


<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .PopUpPanel { top:30%; left:35%}
        .table { margin:0 0 5px 0}
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="content" runat="server" ID="view_mp">


<div class="round">
    <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
        <Columns>
            <asp:BoundField DataField="id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
            <asp:BoundField DataField="description" SortExpression="description" HeaderText="Description"/>
            <asp:BoundField DataField="ngalan" SortExpression="ngalan" HeaderText="Request By"/>
            <asp:BoundField DataField="job_type" SortExpression="job_type" HeaderText="Department"/>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnk_status" Text="Status" OnClick="view_status"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Width="70" />
            </asp:TemplateField>   
        </Columns>
    </asp:GridView>
</div>

<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
    <asp:ImageButton ID="can"  runat="server" CausesValidation="false" OnClick="add_close" CssClass="close" CommandName="Delete" ImageUrl="~/style/img/closeb.png" />
  
    <div class="fileuploadDiv" id="update" runat="server">
        <ul class="ul">
            <li>Status</li>
            <li><asp:DropDownList ID="drop_status" Width="350px" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>On Going</asp:ListItem>
                        <asp:ListItem>Hired</asp:ListItem>
                    </asp:DropDownList></li>
            <li><hr /></li>
            <li><asp:Button ID="Button2" runat="server" Text="Save" OnClick="save_status" CssClass="bttm" /></li>
        </ul>
    </div>
</div>

</asp:Content>


