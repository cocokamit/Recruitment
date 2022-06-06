<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examinition.aspx.cs" Inherits="content_HR_Exam_examinition" MasterPageFile="~/content/MasterPage.master" %>


<asp:Content ContentPlaceHolderID="content" ID="content_examinition" runat="server">

<h3>Examination</h3>
<br />
  <asp:GridView ID="grid_view" CssClass="tb" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="id" HeaderStyle-Font-Size="0" ItemStyle-Font-Size="0" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="time_limit" HeaderText="Time Limit" SortExpression="time_limit" />
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="lnk_customize" runat="server" OnClick="customize_view" style="color:Red; float:right;  font-size:11px;" Text="customize"></asp:LinkButton>
                    <asp:LinkButton ID="lnk_delete" runat="server" style=" color:Maroon; float:right;  font-size:11px; " Text="delete"></asp:LinkButton>
                    <asp:LinkButton ID="lnk_edit" runat="server" style=" color:BLue; float:right;  font-size:11px;margin-right:5px" Text="edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
   </asp:GridView>

   <br />
    <asp:Button ID="add_exam" runat="server" OnClick="exam_view" Text="Add Exam" />



<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
<asp:ImageButton ID="can"  runat="server" CausesValidation="false" OnClick="add_close" CommandName="Delete" ImageUrl="~/style/img/closeb.png" />
        
    <div class="fileuploadDiv" id="exam" runat="server">
    
        <ul class="ul">
            <li>Exam Type</li>
            <li>
                <asp:TextBox ID="txt_exam" Width="300px" Height="30px" runat="server" ></asp:TextBox>
                <asp:Label ID="lbl_exam" ForeColor="Red" runat="server" Text=""></asp:Label>
            </li>

            <li>Time Limit</li>
            <li>
                <asp:TextBox ID="txt_limit" Width="300px" Height="30px" runat="server" ></asp:TextBox>
                <asp:Label ID="lbl_limit" ForeColor="Red" runat="server" Text=""></asp:Label>
            </li>

        </ul>

        <hr />        

        <center>
        <asp:Button ID="Button2" runat="server" Text="ADD" OnClick="add" CssClass="button" />
        </center>
        </div>



        <div class="fileuploadDiv" id="customize" runat="server">
    
        <ul class="ul">
             <li>Examinition Type</li>
            <li>
                <asp:Label ID="lbl_type" ForeColor="Red" runat="server" Text=""></asp:Label>
            </li>


            <li>Question</li>
            <li>
                <asp:TextBox ID="txt_question" Width="300px" Height="30px" runat="server" ></asp:TextBox>
                <asp:Label ID="lbl_question" ForeColor="Red" runat="server" Text=""></asp:Label>
            </li>

                   <asp:GridView ID="grid_item" AutoGenerateColumns="false" ShowFooter="True" CssClass="table" onrowdeleting="grid_item_RowDeleting" runat="server">
                <Columns>
                    <asp:TemplateField> 
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>.
                        </ItemTemplate>
                        <FooterTemplate >             
                            <asp:ImageButton ID="btn"  runat="server" OnClick="ButtonAdd_Click" ImageUrl="~/style/img/add.png"/> 
                        </FooterTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Choices">
                        <ItemTemplate>
                            <asp:Label ID="lbl_discription" runat="server" CssClass="na" Text=""></asp:Label>
                            <asp:Label ID="lbl_2nd_discription"  runat="server" Text=""></asp:Label>
                            <asp:textbox ID="txt_discription" runat="server" Text="" ></asp:textbox>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:CheckBox ID="cb_ib" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
        </ul>

        <hr />        

        <center>
        <asp:Button ID="Button1" runat="server" Text="SAVE" OnClick="save" CssClass="button" />
        </center>
        </div>
  

</div>
</asp:Content>
