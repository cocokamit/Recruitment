<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Statementofaccount.aspx.cs" Inherits="form1_Statementofaccount" %>
<!DOCTYPE  html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Billing Statement_UrbanT</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <style type="text/css">
        *
        {
            margin: 0;
            padding: 0;
            font-family: "Lucida Sans Unicode" , "Lucida Grande" , sans-serif;
        }
        .content
        {
            min-width: 1200px;
            width: 70%;
            margin: 0 auto;
            font-size: 9px;
        }
        .slip
        {
            border: 1px solid #eee;
            padding: 40px;
            margin: 20px;
        }
        .dnone
        {
            display: none;
        }
        .style1
        {
            height: 19px;
        }
        
        .pull-right
        {
            float: right !important;
        }
        h1
        {
            margin-top:20px;
            color: #6C6D6D;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 26pt;
        }
        
        h2
        {
            color: #FFF;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 12pt;
        }
        
        h4
        {
            color: #221F1F;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 10pt;
        }
        p
        {
            color: #221F1F;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: none;
            font-size: 7pt;
            margin: 0pt;
        }
        a
        {
            color: #21439A;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: underline;
            font-size: 7pt;
        }
        h3
        {
            color: #FFF;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 10.5pt;
        }
        
        li p,li,li a
        {
            font-size:13px;
            
            }
        .lods p
        {
            font-size:13px;
            
        }
                
   @page {
    size: A4;
    margin: 40px;
}


    @media print {
    html,
    body {
        width: 210mm;
        height: 297mm;
    }
    @-moz-document url-prefix() {}
    .col-sm-1,
    .col-sm-2,
    .col-sm-3,
    .col-sm-4,
    .col-sm-5,
    .col-sm-6,
    .col-sm-7,
    .col-sm-8,
    .col-sm-9,
    .col-sm-10,
    .col-sm-11,
    .col-sm-12,
    .col-md-1,
    .col-md-2,
    .col-md-3,
    .col-md-4,
    .col-md-5,
    .col-md-6,
    .col-md-7,
    .col-md-8,
    .col-md-9,
    .col-md-10,
    .col-md-11,
    .col-smdm-12 {
        float: left;
    }
    .col-sm-12,
    .col-md-12 {
        width: 100%;
    }
    .col-sm-11,
    .col-md-11 {
        width: 91.66666667%;
    }
    .col-sm-10,
    .col-md-10 {
        width: 83.33333333%;
    }
    .col-sm-9,
    .col-md-9 {
        width: 75%;
    }
    .col-sm-8,
    .col-md-8 {
        width: 66.66666667%;
    }
    .col-sm-7,
    .col-md-7 {
        width: 58.33333333%;
    }
    .col-sm-6,
    .col-md-6 {
        width: 50%;
    }
    .col-sm-5,
    .col-md-5 {
        width: 41.66666667%;
    }
    .col-sm-4,
    .col-md-4 {
        width: 33.33333333%;
    }
    .col-sm-3,
    .col-md-3 {
        width: 25%;
    }
    .col-sm-2,
    .col-md-2 {
        width: 16.66666667%;
    }
    .col-sm-1,
    .col-md-1 {
        width: 8.33333333%;
    }
    .col-sm-pull-12 {
        right: 100%;
    }
    .col-sm-pull-11 {
        right: 91.66666667%;
    }
    .col-sm-pull-10 {
        right: 83.33333333%;
    }
    .col-sm-pull-9 {
        right: 75%;
    }
    .col-sm-pull-8 {
        right: 66.66666667%;
    }
    .col-sm-pull-7 {
        right: 58.33333333%;
    }
    .col-sm-pull-6 {
        right: 50%;
    }
    .col-sm-pull-5 {
        right: 41.66666667%;
    }
    .col-sm-pull-4 {
        right: 33.33333333%;
    }
    .col-sm-pull-3 {
        right: 25%;
    }
    .col-sm-pull-2 {
        right: 16.66666667%;
    }
    .col-sm-pull-1 {
        right: 8.33333333%;
    }
    .col-sm-pull-0 {
        right: auto;
    }
    .col-sm-push-12 {
        left: 100%;
    }
    .col-sm-push-11 {
        left: 91.66666667%;
    }
    .col-sm-push-10 {
        left: 83.33333333%;
    }
    .col-sm-push-9 {
        left: 75%;
    }
    .col-sm-push-8 {
        left: 66.66666667%;
    }
    .col-sm-push-7 {
        left: 58.33333333%;
    }
    .col-sm-push-6 {
        left: 50%;
    }
    .col-sm-push-5 {
        left: 41.66666667%;
    }
    .col-sm-push-4 {
        left: 33.33333333%;
    }
    .col-sm-push-3 {
        left: 25%;
    }
    .col-sm-push-2 {
        left: 16.66666667%;
    }
    .col-sm-push-1 {
        left: 8.33333333%;
    }
    .col-sm-push-0 {
        left: auto;
    }
    .col-sm-offset-12 {
        margin-left: 100%;
    }
    .col-sm-offset-11 {
        margin-left: 91.66666667%;
    }
    .col-sm-offset-10 {
        margin-left: 83.33333333%;
    }
    .col-sm-offset-9 {
        margin-left: 75%;
    }
    .col-sm-offset-8 {
        margin-left: 66.66666667%;
    }
    .col-sm-offset-7 {
        margin-left: 58.33333333%;
    }
    .col-sm-offset-6 {
        margin-left: 50%;
    }
    .col-sm-offset-5 {
        margin-left: 41.66666667%;
    }
    .col-sm-offset-4 {
        margin-left: 33.33333333%;
    }
    .col-sm-offset-3 {
        margin-left: 25%;
    }
    .col-sm-offset-2 {
        margin-left: 16.66666667%;
    }
    .col-sm-offset-1 {
        margin-left: 8.33333333%;
    }
    .col-sm-offset-0 {
        margin-left: 0%;
    }
    .visible-xs {
        display: none !important;
    }
    .hidden-xs {
        display: block !important;
    }
    table.hidden-xs {
        display: table;
    }
    tr.hidden-xs {
        display: table-row !important;
    }
    th.hidden-xs,
    td.hidden-xs {
        display: table-cell !important;
    }
    .hidden-xs.hidden-print {
        display: none !important;
    }
    .hidden-sm {
        display: none !important;
    }
    .visible-sm {
        display: block !important;
    }
    table.visible-sm {
        display: table;
    }
    tr.visible-sm {
        display: table-row !important;
    }
    th.visible-sm,
    td.visible-sm {
        display: table-cell !important;
    }
}
    </style>
</head>
<body>
    <div class="content">
        <div class="slip">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-xs-12">
                    <p style="text-indent: 0pt; text-align: left;">
                        <span>
                            <img width="100%" height="110pt" alt="image" src="../Billing Statement_UrbanT/Image_001.png" />
                        </span>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12 col-xs-12">
                    <h1 style="padding-top: 4pt; text-indent: 0pt; text-align: center;">
                        STATEMENT OF ACCOUNT
                    </h1>
                </div>
            </div>
            <p class="s1" style="padding-top: 6pt; font-size:19px; text-indent: 0pt; text-align: center;">
                Billing No. <asp:Label ID="Label17" runat="server" Text="dsadasd" style="margin-bottom:-100px; text-decoration:underline;"></asp:Label> <u></u>
            </p>
            <div class="row" style="margin-top: 20px; margin-bottom: 50px;">
                <div class="col-md-6 col-lg-6 col-xs-6" style="padding-left: 80px;">
                    <h2 style="padding-top: 5pt; padding-left: 10pt; margin-bottom: -30px; text-indent: 0pt;
                        text-align: left;">
                        BILLING INFORMATION</h2>
                    <img width="100%" height="300" alt="image" src="../Billing Statement_UrbanT/Image_003.png"
                        style="z-index: -1; position: inherit;" />
                    <div class="row" style="margin-top: -250px; padding-left: 20px; padding-right: 20px;">
                        <div class="col-md-12 col-lg-12 col-xs-12">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 col-xs-3" style="padding-right: 0px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 35px; font-size: 15px;">
                                        Billing Date : </p>
                                </div>
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-left: 0px;">
                                    <p style="padding-left: 0pt; padding-top: 14pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label1" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-lg-4 col-xs-4" style="padding-right: 0px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 35px; font-size: 15px;">
                                        Installation Date :</p>
                                </div>
                                <div class="col-md-8 col-lg-8 col-xs-8" style="padding-left: 0px;">
                                 <p style="padding-left: 0pt; padding-top: 14pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label2" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-lg-4 col-xs-4" style="padding-right: 0px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 35px; font-size: 15px;">
                                        Account Number:</p>
                                </div>
                                <div class="col-md-8 col-lg-8 col-xs-8" style="padding-left: 0px;">
                                 <p style="padding-left: 0pt; padding-top: 14pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label3" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5 col-lg-5 col-xs-5" style="padding-right: 0px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 35px; font-size: 15px;">
                                        Customer/ Company TIN:</p>
                                </div>
                                <div class="col-md-7 col-lg-7 col-xs-7" style="padding-left: 0px;">
                                 <p style="padding-left: 0pt; padding-top: 14pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label4" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2 col-lg-2 col-xs-2" style="padding-right: 0px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 35px; font-size: 15px;">
                                        Unit No.:</p>
                                </div>
                                <div class="col-md-10 col-lg-10 col-xs-10" style="padding-left: 0px;">
                                 <p style="padding-left: 0pt; padding-top: 14pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label5" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xs-6" style="padding-right: 80px;">
                    <h2 style="padding-top: 4pt; padding-left: 96pt; margin-bottom: -30px; text-indent: 0pt;
                        text-align: left;">
                        STATEMENT SUMMARY</h2>
                    <img width="100%" height="400" alt="image" src="../Billing Statement_UrbanT/Image_002.png"
                        style="z-index: -1; position: inherit;" />
                    <div class="row" style="margin-top: -350px; padding-left: 20px; padding-right: 20px;">
                        <div class="col-md-12 col-lg-12 col-xs-12">
                            <p style="text-indent: 0pt; text-align: left;">
                                <br />
                            </p>
                            <div class="row">
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-right: 0px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;
                                        font-weight: bold;">
                                        PREVIOUS CHARGES</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-left: 35px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;">
                                        Balance from Previous Bill</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xs-3" style="padding-left: 0px;">
                                 <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label6" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                     <!--       <div class="row">
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-left: 35px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;">
                                        Last Payment Received</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xs-3" style="padding-left: 0px;">
                                    <p style="padding-left: 0pt; padding-top: 10pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-left: 35px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;">
                                        Remaining Balance from Previous Bill</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xs-3" style="padding-left: 0px;">
                                    <p style="padding-left: 0pt; padding-top: 10pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>-->
                            <p style="text-indent: 0pt; text-align: left;">
                                <br />
                            </p>
                            <p style="text-indent: 0pt; text-align: left;">
                                <br />
                            </p>
                            <div class="row">
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-right: 0px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;
                                        font-weight: bold;">
                                        CURRENT CHARGES</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-left: 35px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;">
                                        Monthly Subscription Fee</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xs-3" style="padding-left: 0px;">
                                 <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label7" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-left: 35px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;">
                                        Value Added in Tax/VAT</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xs-3" style="padding-left: 0px;">
                                 <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label8" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-9 col-lg-9 col-xs-9" style="padding-left: 35px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;">
                                        Total Current Charges</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xs-3" style="padding-left: 0px;">
                                 <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label9" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>
                            <p style="text-indent: 0pt; text-align: left;">
                                <br />
                            </p>
                            <p style="text-indent: 0pt; text-align: left;">
                                <br />
                            </p><p style="text-indent: 0pt; text-align: left;">
                                <br />
                            </p>
                            <div class="row">
                                <div class="col-md-7 col-lg-7 col-xs-7" style="padding-right: 0px; text-align: left;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px; font-weight:bold;">
                                        DUE DATE:</p>
                                </div>
                                <div class="col-md-5 col-lg-5 col-xs-5" style="padding-right: 0px; text-align: left;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px; font-weight:bold;">
                                        AMOUNT DUE:</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7 col-lg-7 col-xs-7" style="padding-right: 0px; text-align: left;">
                                 <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label10" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 10pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="70%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                                <div class="col-md-5 col-lg-5 col-xs-5" style="padding-right: 0px; text-align: left;">
                                
                                 <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label11" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 10pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="70%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>

                             <div class="row" style="margin-top:30px;">
                                <div class="col-md-8 col-lg-8 col-xs-8" style="padding-left: 20px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px; font-weight:bold;">
                                        TOTAL AMOUNT DUE</p>
                                </div>
                                <div class="col-md-4 col-lg-4 col-xs-4" style="padding-left: 0px;">
                                <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;">Php <asp:Label ID="Label12" runat="server" Text="dsadasd" style="margin-bottom:-100px;"> </asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 10pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                        
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>

                            
                             <div class="row" style="margin-top:8px;">
                                <div class="col-md-8 col-lg-8 col-xs-8" style="padding-left: 20px;">
                                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 20px; font-size: 15px;">
                                        please pay on or before</p>
                                </div>
                                <div class="col-md-4 col-lg-4 col-xs-4" style="padding-left: 0px;">
                                <p style="padding-left: 0pt; padding-top: 5pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label13" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                                    <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 2pt;
                                        font-size: 15px;">
                                        <span>
                                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-6 col-lg-6 col-xs-6" style="padding-left: 80px;">
                    <p style="text-indent: 0pt; text-align: left;">
                        <span>
                            <h4 style="padding-left: 10pt; text-indent: 0pt; margin-bottom: -19px; text-align: left;">
                                IMPORTANT REMINDERS</h4>
                            <img width="163" height="19" alt="image" src="../Billing Statement_UrbanT/Image_004.png"
                                style="z-index: -1; position: inherit;" /></span></p>
                </div>
                <div class="col-md-6 col-lg-6 col-xs-6" style="padding-right: 80px;">
                    <p style="text-indent: 0pt; text-align: left;">
                        <span>
                            <h4 style="padding-left: 10pt; text-indent: 0pt; margin-bottom: -19px; text-align: left;">
                                PAYMENT INSTRUCTIONS</h4>
                            <img width="146" height="19" alt="image" src="../Billing Statement_UrbanT/Image_005.png"
                                style="z-index: -1; position: inherit;" /></span></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-6 col-xs-6" style="padding-left: 90px;">
                    <ol id="l1">
                        <li style="padding-top: 5pt; padding-left: 10pt; text-indent: -7pt; text-align: left;">
                            <p style="display: inline;">
                                This exclusive service(s) offered is powered by Mesh Networks Inc.</p>
                        </li>
                        <li style="padding-top: 5pt; padding-left: 10pt; text-indent: -7pt; text-align: left;">
                            <p style="display: inline;">
                                The total amount due must be fully paid on or before the due date indicated in your
                                statement of account. A five (5) days grace period is given after the due date to
                                settle remaining balance.</p>
                        </li>
                        <li style="padding-top: 5pt; padding-left: 10pt; text-indent: -7pt; text-align: left;">
                            <p style="display: inline;">
                                Installation fee is subject for 1 time payment only.</p>
                            <p style="text-indent: 0pt; text-align: left;">
                                <br />
                            </p>
                        </li>
                        <li style="padding-top: 5pt; padding-left: 10pt; text-indent: -7pt; text-align: left;">
                            <p style="display: inline;">
                                 After payment has been made from the bank, kindly send a scanned copy or a picture
                                    of your deposited slip on this email:<a href="mailto:urbantechcebu@gmail.com" style="color: #21439A;
                                        font-family: Arial, sans-serif; font-style: normal; font-weight: normal; text-decoration: none;
                                        font-size: 7pt;" target="_blank"> </a><a href="mailto:urbantechcebu@gmail.com" target="_blank">
                                            urbantechcebu@gmail.com</a></p>
                            </p>
                            <p style="text-indent: 0pt; text-align: left;">
                                <br />
                            </p>
                        </li>
                        <li style="padding-top: 5pt; padding-left: 10pt; text-indent: -7pt; text-align: left;">
                            <p style="display: inline;">
                                In case there is a change of information on the Statement of Account, please notify
                                respective Business Development Specialist otherwise, it is presumed that all information
                                provided prior are true and correct.</p>
                        </li>
                    </ol>
                </div>
                <div class="col-md-6 col-lg-6 col-xs-6 lods" style="padding-right: 80px;" >
                    <p class="s6" style="padding-top: 4pt; padding-left: 10pt; text-indent: 0pt; text-align: left;">
                        All payment(s) made should be:</p>
                    <p style="text-indent: 0pt; text-align: left;">
                        <br />
                    </p>
                   
                    <p class="s6" style="padding-left: 10pt; text-indent: 0pt; text-align: left;">
                        Bank Name: BDO</p>
                    <p class="s6" style="padding-left: 10pt; text-indent: 0pt; text-align: left;">
                        Bank Address: A.C Cortes Mandaue City, Cebu Philippines Inc.</p>
                    <p class="s6" style="padding-left: 10pt; text-indent: 0pt; text-align: left;">
                        Acct. Name: Meshnetworks</p>
                    <p class="s6" style="padding-left: 10pt; text-indent: 0pt; text-align: left;">
                        Acct. Number: 010320025640</p>
                    <p style="text-indent: 0pt; text-align: left;">
                        <br />
                    </p>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-12 col-lg-12 col-xs-12" style="padding-left: 70px;">
                    <p style="text-indent: 0pt; text-align: left;">
                        <span>
                            <h2 style="padding-top: 4pt; padding-left: 10pt; margin-bottom: -25px; text-indent: 0pt;
                                text-align: left;">
                                THANK YOU FOR YOUR BUSINESS!
                            </h2>
                            <img width="670" height="31" alt="image" src="../Billing Statement_UrbanT/Image_006.png"
                                style="z-index: -1; position: inherit;" /></span></p>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-6 col-lg-6 col-xs-6" style="padding-left: 90px;">
                    <p style="text-indent: 0pt; text-align: left;">
                        <span>
                            <h3 style="padding-top: 9pt; padding-left: 10pt; margin-bottom: -25px; text-indent: 0pt;
                                text-align: left;">
                                CONFORME</h3>
                            <img width="80%" height="142" alt="image" src="../Billing Statement_UrbanT/Image_007.png"
                                style="z-index: -1; position: inherit;" /></span>
                    </p>
                    <p class="s6" style="text-indent: 0pt; text-align: center; margin-top: -30px; padding-right: 90px;">
                        SIGNATURE OVER PRINTED NAME</p>
                </div>
                <div class="col-md-5 col-lg-5 col-xs-5 lods" style="padding-right: 90px; padding-left: 50px;">
                    <p style="text-indent: 0pt; text-align: left;">
                        <span>
                            <h4 style="padding-top: 1pt; padding-left: 9pt; margin-bottom: -19px; text-indent: 0pt;
                                text-align: left;">
                                CONTACT US</h4>
                            <img width="100%" height="19" alt="image" src="../Billing Statement_UrbanT/Image_008.png"
                                style="z-index: -1; position: inherit;" /></span></p>
                    <p class="s6" style="padding-left: 0pt; text-indent: 0pt; text-align: left;">
                        Should you have any inquiries concerning this statement, please contact :</p>
                    <p style="text-indent: 0pt; text-align: left;">
                        <br />
                    </p>
                     <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px; text-align:center; "><asp:Label ID="Label14" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                    <p style="text-indent: 0pt; text-align: left;">
                        <br />
                    </p>
                    <p style="padding-left: 0pt; text-indent: 0pt; line-height: 1pt; text-align: left;">

                        <span>
                            <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                    <p class="s6" style="padding-top: 3pt; padding-left: 0pt; text-indent: 0pt; text-align: left;">
                        Business Development Specialist</p>
                    <p class="s6" style="padding-top: 0pt; padding-left: 0pt; text-indent: 0pt; text-align: left;">
                        Mesh Networks Development Inc.</p>
                    <p style="text-indent: 0pt; text-align: left;">
                        <br />
                    </p>
                    <p class="s6" style="padding-top: 3pt; padding-left: 0pt; text-indent: 0pt; text-align: left;">
                        Business Development Specialist Mesh Networks Development Inc.</p>
                    <div class="row">
                        <div class="col-md-4 col-lg-4 col-xs-4" style="padding-right: 0px;">
                            <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 143%; text-align: justify;">
                                Contact No.:</p>
                        </div>
                        <div class="col-md-8 col-lg-8 col-xs-8" style="padding-left: 0px;">
                         <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label15" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                            <p style="padding-left: 0pt; padding-top: 7pt; text-indent: 0pt; line-height: 1pt;
                                text-align: left;">
                                <span>
                                    <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-lg-3 col-xs-3" style="padding-right: 0px;">
                            <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 143%; text-align: justify;">
                                Viber No.:</p>
                        </div>
                        <div class="col-md-9 col-lg-9 col-xs-9" style="padding-left: 0px;">
                         <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label16" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                            <p style="padding-left: 0pt; padding-top: 7pt; text-indent: 0pt; line-height: 1pt;
                                text-align: left;">
                                <span>
                                    <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-lg-2 col-xs-2" style="padding-right: 0px;">
                            <p class="s6" style="padding-left: 0pt; text-indent: 0pt; line-height: 143%; text-align: justify;">
                                Email:</p>
                        </div>
                        <div class="col-md-10 col-lg-10 col-xs-10" style="padding-left: 0px;">
                         <p style="padding-left: 0pt; padding-top: 9pt; text-indent: 0pt; line-height: 1pt;
                                        font-size: 15px;"><asp:Label ID="Label18" runat="server" Text="dsadasd" style="margin-bottom:-100px;"></asp:Label></p>
                            <p style="padding-left: 0pt; padding-top: 7pt; text-indent: 0pt; line-height: 1pt;
                                text-align: left;">
                                <span>
                                    <img width="100%" height="1" alt="image" src="../Billing Statement_UrbanT/Image_009.png" /></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
</body>
</html>
