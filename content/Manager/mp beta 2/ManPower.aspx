<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManPower.aspx.cs" Inherits="content_Manager_ManPower" MasterPageFile="~/content/MasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .PopUpPanel { top:30%; left:35%}
        .table { margin:0 0 5px 0}
    </style>
</asp:Content>



<asp:Content ContentPlaceHolderID="content" ID="content_mp" runat="server">



<div class="round">
    <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
        <Columns>
            <asp:BoundField DataField="id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
            <asp:BoundField DataField="description" SortExpression="description" HeaderText="Description"/>
            <asp:BoundField DataField="ngalan" SortExpression="ngalan" HeaderText="Request By"/>
            <asp:BoundField DataField="job_type" SortExpression="job_type" HeaderText="Department"/>
             <asp:BoundField DataField="status" SortExpression="status" ItemStyle-ForeColor="Red" HeaderText="Status"/>
            <%--<asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnk_status" Text="Status" OnClick="view_status"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Width="70" />
            </asp:TemplateField> --%>  
        </Columns>
    </asp:GridView>
</div>

<asp:Button ID="Button1" runat="server" Text="Request"  CssClass="bttm" onclick="view_status" />

<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
    <asp:ImageButton ID="can"  runat="server" CausesValidation="false" OnClick="add_close" CssClass="close" CommandName="Delete" ImageUrl="~/style/img/closeb.png" />
  
    <div class="fileuploadDiv" id="update" runat="server">
         <ul class="ul">
            <li>Request Man Power</li>
                <li><asp:TextBox ID="txt_mp" runat="server" TextMode="MultiLine"></asp:TextBox></li>
                <li><hr /></li>
                <li><asp:Button ID="btnSave" runat="server" Text="Save"  CssClass="bttm" onclick="btnSave_Click" /></li>
        </ul>
    </div>
</div>



</asp:Content>


