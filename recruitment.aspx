<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recruitment.aspx.cs" Inherits="recruitment" MasterPageFile="~/content/site.master" %>
 
 <asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .header{ display:none}
        .content { margin:20px auto}
        .header { height:50px;}
        .link { float:left; margin:15px 0}
        .link ul { list-style:none; width:700px; }
        .link li { display:inline; }
        .link img { width:220px;margin:5px}
        .link img:hover {border:1px dashed #5C91C2;width:218px;}
        .suwat { float:right; width:380px; margin:20px 0}
        .suwat h3 {color:#104575; font-size:20px}
        .suwat p { line-height:30px; font-size:13px}
    </style>
</asp:Content>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="content">
 <%--<img src="style/img/1.jpg" style="width:100%" /> --%>

    <img src="style/img/2.png" style="width:100%" />

    <div class="link">
        <ul>
            <li><a href="#"><img src="style/img/maribago.jpg" alt="bluewater" /></a></li>
            <li><a href="#"><img src="style/img/pangloa.jpg" alt="bluewater"/></a></li>
            <li><a href="#"><img src="style/img/sumilon.jpg" alt="bluewater"/></a></li>
            <li><a href="#"><img src="style/img/almot.jpg" alt="bluewater"/></a></li>
            <li><a href="#"><img src="style/img/amuma.jpg" alt="bluewater"/></a></li>
            <li><a href="#"><img src="style/img/other.jpg" alt="bluewater"/></a></li>
        </ul>
    </div>

    <div class="suwat">
     <h3>Join our team.Excel with us.</h3>
        <p>
           
            In line with the Filipino culture of amuma, we
            at Bluewater and Almont Resort and other
            company affiliates embody extraordinary
            care and hospital towards ourselves, our
            colleagues, guests, and the environment.

            If you want to contribute to our passion in the
            hospitality industry, we invite you to submit
            an application to any of our properties.

            Explore more of the world and grow with us.
        </p>
    </div>
</asp:Content>