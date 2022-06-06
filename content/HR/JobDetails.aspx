<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobDetails.aspx.cs" Inherits="content_HR_JobDetails" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        hr { margin:5px 0px}
        .ul { margin-bottom:20px}
        .ul li { line-height:30px; font-size:12px}
        .ul textarea{ width:100%}
        .ul input[type=text]{ width:100%}
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_jobdetails" runat="server">
<div class="page-header">
    <h5>Positions / Create Job</h5>
</div>

<div class="page-content no-event">
    <ul class="ul">
        <li>Department <asp:Label ID="lbl_type" runat="server"  ForeColor="Red"></asp:Label></li>
        <li>
            <asp:DropDownList ID="drop_type" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="job_type" DataValueField="jobtype_id">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                SelectCommand="SELECT [job_type], [jobtype_id] FROM [JobType] where status is null">
            </asp:SqlDataSource>
        </li>

         <li>Property <asp:Label ID="lbl_loc" runat="server"  ForeColor="Red"></asp:Label></li>
        <li>
            <asp:DropDownList ID="drop_loc" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" AppendDataBoundItems="true" DataTextField="description" DataValueField="id">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                SelectCommand="SELECT [description], [id] FROM [location] where status is null">
            </asp:SqlDataSource>
        </li>

        <li>Section <asp:Label ID="lbl_section" runat="server" ForeColor="Red"></asp:Label></li>
        <li><asp:TextBox ID="txt_section" Width="340px" runat="server"></asp:TextBox></li>

        <li>Job Title <asp:Label ID="lbl_subject" runat="server" ForeColor="Red"></asp:Label></li>
        <li><asp:TextBox ID="txt_subject" Width="340px" runat="server"></asp:TextBox></li>

        <li>Qualifications <asp:Label ID="lbl_qualification" runat="server" ForeColor="Red"></asp:Label></li>
        <li><asp:TextBox ID="txt_qualification" TextMode="MultiLine" Height="400px" runat="server"></asp:TextBox></li>

        <li style="display:none;">Job Description <asp:Label ID="lbl_details" runat="server" ForeColor="Red"></asp:Label></li>
        <li style="display:none;"><asp:TextBox ID="txt_details" TextMode="MultiLine" runat="server" Height="400px" ></asp:TextBox></li>
        <li style="display:none;"><hr /></li>
        <li> <asp:Button ID="btn_save" runat="server" Text="Save" onclick="btn_save_Click" CssClass="btn" /></li>
    </ul>
</div>

</asp:Content>


