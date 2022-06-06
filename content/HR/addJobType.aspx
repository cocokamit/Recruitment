<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addJobType.aspx.cs" Inherits="content_HR_addJobType" MasterPageFile="~/content/NewMasterPage.master" %>


<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        table { margin-top:60px}
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_jobtype" runat="server">
<div class="page-header">
    <h5>Add Job Type</h5>
</div>
<div class="page-content">
    <asp:GridView ID="grid_item" runat="server" ShowFooter="true" onrowdeleting="grid_item_RowDeleting" AutoGenerateColumns="False" >
        <Columns>
            <asp:TemplateField ItemStyle-Width="15px" Visible="true"> 
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate >             
                    <asp:ImageButton ID="btn" runat="server" ImageUrl="~/style/img/add.png" OnClick="ButtonAdd_Click"  />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_descripton" runat="server" CssClass="na" Text=""></asp:Label>
                    <asp:Label ID="lbl_descripton_desp"  runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_description" autocomplete="off"  runat="server"></asp:TextBox> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" Visible="true">
                <ItemTemplate>
                    <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete.png"  Width="15px"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>            
    </asp:GridView>
    <asp:Button ID="btn_save" runat="server" Text="Save" onclick="btn_save_Click"  CssClass="btn" />  
</div>
</asp:Content>
