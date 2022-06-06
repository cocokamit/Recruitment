<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobTypeList.aspx.cs" Inherits="content_HR_JobTypeList" MasterPageFile="~/content/MasterPage.master" %>


<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_jobtypelist" runat="server">
<h4>Create Job</h4>
<hr class="hhr" />
   <asp:GridView ID="grid_view" CssClass="table" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="jobtype_id" HeaderStyle-Font-Size="0" ItemStyle-Font-Size="0" />
            <asp:BoundField DataField="job_type" HeaderText="Job Type" SortExpression="job_type" />
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="lnk_delete" OnClick="delete" runat="server" style=" color:Maroon; float:right;  font-size:11px; " Text="delete"></asp:LinkButton>
                    <asp:LinkButton ID="lnk_edit" OnClick="view" runat="server" style=" color:BLue; float:right;  font-size:11px;margin-right:5px" Text="edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
   </asp:GridView>


<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
<asp:ImageButton ID="can"  runat="server" CausesValidation="false" OnClick="add_close" CommandName="Delete" ImageUrl="~/style/img/closeb.png" />
        
    <div class="fileuploadDiv">
    
        <ul class="ul">
            <li>Job Type</li>
            <li>
                <asp:TextBox ID="txt_class" runat="server" ></asp:TextBox>
                <asp:Label ID="lbl_class" ForeColor="Red" runat="server" Text=""></asp:Label>
            </li>
        </ul>
        <hr />      
        <center>
        <asp:Button ID="Button2" runat="server" Text="Save" OnClick="edit" CssClass="button" />
        </center>
        </div>
  

</div>


</asp:Content>

