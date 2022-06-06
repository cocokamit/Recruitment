<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManPower.aspx.cs" Inherits="content_Manager_ManPower" MasterPageFile="~/content/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="content" ID="content_mp" runat="server">

 <ul class="ul">
    <li>Request Man Power</li>
 
    <li><asp:TextBox ID="txt_mp" runat="server" TextMode="MultiLine"></asp:TextBox></li>
  
</ul>
<hr />
<asp:Button ID="btnSave" runat="server" Text="Save"  CssClass="bttm" onclick="btnSave_Click" />

</asp:Content>


