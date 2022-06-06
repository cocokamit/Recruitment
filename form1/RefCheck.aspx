<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RefCheck.aspx.cs" Inherits="form1_RefCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Print Interview Evaluation Form </title>

    <style type="text/css">
        *{margin:0; padding:0; font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;}
        .content { min-width:1200px; width:70%; margin:0 auto; font-size:9px }
        .slip {border:1px solid #eee; padding:40px; margin:20px;}
        table { text-align:left; width:100%; margin:0px 0 0;  border-collapse: collapse;}
        table th,td {   font-size:24px; padding:9px;  border:none;}
        .desx { padding:0px; border:1px solid black;}
        .desx th, .desx td{ border:1px solid black; }
        .dnone{ display:none;}
        .style1
        {
            height: 19px;
        }
        
        .pull-right
        {
            float:right !important;
           
            }
              textarea
        {
            width:100%;
            border-style:none;
            resize:none;   
         }
    </style>
    
    <script src="vendors/jquery/dist/jquery.min.js"></script>

    <script type="text/javascript" >
        function MyFunction(evs) {
            $.ajax({
                type: "POST",
                url: "form1/RefCheck.aspx/viewersref",
                data: JSON.stringify({ Id: evs }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d.toString() != "") {
                        var result = data.d.split("~");

                        var splitter = result[0].split(",");

                        $("input[name=quest1][value=" + splitter[0] + "]").attr('checked', 'checked');
                        $("input[name=quest2][value=" + splitter[1] + "]").attr('checked', 'checked');
                        $("input[name=quest3][value=" + splitter[2] + "]").attr('checked', 'checked');
                        $("input[name=quest4][value=" + splitter[3] + "]").attr('checked', 'checked');
                        $("input[name=quest5][value=" + splitter[4] + "]").attr('checked', 'checked');
                        $("input[name=quest6][value=" + splitter[5] + "]").attr('checked', 'checked');
                        $("input[name=quest7][value=" + splitter[6] + "]").attr('checked', 'checked');
                        $("input[name=quest8][value=" + splitter[7] + "]").attr('checked', 'checked');

                        $("[id$=lb_refname]").html(result[1]);
                        $("[id$=lb_company]").html(result[2]);
                        $("[id$=lb_position]").html(result[3]);
                        $("[id$=lb_startdate]").html(result[4]);

                        $("[id$=lb_sepdate]").html(result[5]);
                        $("[id$=lb_lastsep]").html(result[6]);
                        $("[id$=lb_naturesep]").html(result[7]);
                        $("[id$=lb_remarks]").html(result[8]);
                        $("[id$=lb_completed]").html(result[9]);
                        $("[id$=lb_date]").html(result[10]);
                        $("[id$=lb_name]").html(result[11]);


                        auto_grow(document.getElementById("lb_remarks"));
                    }

                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });

        }

        function auto_grow(element) {
            element.style.height = "5px";
            element.style.height = (element.scrollHeight) + "px";
        }
        </script>
</head>
<body onload="window.print()" >
    <form id="form1" runat="server">
    
         <div class="content">

            <div class="slip">
            <div style="margin-bottom:50px;">
                            <img class="pull-right" style="width:400px; height:100px; margin-top:-100px;" src="dist/img/myCLIRecruitmentAdminPortal.png" />
                        <p style="font-size:27px; margin-top:100px;"><strong>REFERENCE CHECK</strong></p>
                        
                    <hr />
                           
            </div>
                    
            <table>
                     <tr>
                        <td style="width:30%;">
                           <p>Name of Applicant</p>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                           <asp:Label ID="lb_name" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          <p>Reference's Name</p>         
                        </td>
                        <td>
                        :
                        </td>
                        <td>
                            <asp:Label ID="lb_refname" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          <p>Company</p>         
                        </td>
                        <td>
                        :
                        </td>
                        <td>
                            <asp:Label ID="lb_company" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          <p>Current Position</p>         
                        </td>
                        <td>
                        :
                        </td>
                        <td>
                            <asp:Label ID="lb_position" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <span style=" font-style:normal; font-size:17px;"><i>Please provide ALL the necessary information below:</i></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table class="desx" >
                                <tr>
                                    <td style="width:65%;">
                                        <p>Start Date of Employment:</p>
                                    </td>
                                    <td>
                                        <asp:Label ID="lb_startdate" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Separation Date of Employment:</p>
                                    </td>
                                    <td>
                                        <asp:Label ID="lb_sepdate" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Last Position held before separation:</p>
                                    </td>
                                    <td>
                                        <asp:Label ID="lb_lastsep" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Was the nature of his/her separation from the company VOLUNTARY or INVOLUNTARY?</p>
                                    </td>
                                    <td>
                                        <asp:Label ID="lb_naturesep" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Is he/she cleared in your Company?</p>
                                    </td>
                                    <td style="text-align:center;">
                                        <input id="Checkbox1" type="checkbox" name="quest1" value="1" onclick="javascript: return false;" /><label for="Checkbox1">&nbsp;Yes</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Checkbox2" type="checkbox" name="quest1" value="2" onclick="javascript: return false;" /><label for="Checkbox2">&nbsp;No</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Did he/she have integrity issues?</p>
                                    </td>
                                     <td style="text-align:center;">
                                        <input id="Checkbox3" type="checkbox" name="quest2" value="1" onclick="javascript: return false;" /><label for="Checkbox3">&nbsp;Yes</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Checkbox4" type="checkbox" name="quest2" value="2" onclick="javascript: return false;" /><label for="Checkbox4">&nbsp;No</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Did he/she have performance issues?</p>
                                    </td>
                                     <td style="text-align:center;">
                                        <input id="Checkbox5" type="checkbox" name="quest3" value="1" onclick="javascript: return false;" /><label for="Checkbox5">&nbsp;Yes</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Checkbox6" type="checkbox" name="quest3" value="2" onclick="javascript: return false;" /><label for="Checkbox6">&nbsp;No</label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td >
                                        <p>Did he/she file a labor case against your company?</p>
                                    </td>
                                     <td style="text-align:center;">
                                        <input id="Checkbox15" type="checkbox" name="quest8" value="1" onclick="javascript: return false;" /><label for="Checkbox15">&nbsp;Yes</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Checkbox16" type="checkbox" name="quest8" value="2" onclick="javascript: return false;" /><label for="Checkbox16">&nbsp;No</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Did he/she file any criminal or civil case while in your Company?</p>
                                    </td>
                                     <td style="text-align:center;">
                                        <input id="Checkbox7" type="checkbox" name="quest4" value="1" onclick="javascript: return false;" /><label for="Checkbox7">&nbsp;Yes</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Checkbox8" type="checkbox" name="quest4" value="2" onclick="javascript: return false;" /><label for="Checkbox8">&nbsp;No</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Did he/she have health concerns while in your Company?</p>
                                    </td>
                                     <td style="text-align:center;">
                                        <input id="Checkbox9" type="checkbox" name="quest5" value="1" onclick="javascript: return false;" /><label for="Checkbox9">&nbsp;Yes</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Checkbox10" type="checkbox" name="quest5" value="2" onclick="javascript: return false;" /><label for="Checkbox10">&nbsp;No</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Is applicant eligible for re-hire in your Company?</p>
                                    </td>
                                     <td style="text-align:center;">
                                        <input id="Checkbox11" type="checkbox" name="quest6" value="1" onclick="javascript: return false;" /><label for="Checkbox11">&nbsp;Yes</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Checkbox12" type="checkbox" name="quest6" value="2" onclick="javascript: return false;" /><label for="Checkbox12">&nbsp;No</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <p>Would you recommend him to be hired in our Company?</p>
                                    </td>
                                     <td style="text-align:center;">
                                        <input id="Checkbox13" type="checkbox" name="quest7" value="1" onclick="javascript: return false;" /><label for="Checkbox13">&nbsp;Yes</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Checkbox14" type="checkbox" name="quest7" value="2" onclick="javascript: return false;" /><label for="Checkbox14">&nbsp;No</label>
                                    </td>
                                </tr>

                               
                            </table>
                        </td>
                    </tr>
                     <tr>
                        <td >
                            <p>REMARKS:</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <textarea id="lb_remarks" readonly="readonly" rows="2" cols="max"></textarea>  
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Completed by</p>
                        </td>
                        <td>
                        :
                        </td>
                        <td >
                             <asp:Label ID="lb_completed" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Date</p>
                        </td>
                        <td>
                        :
                        </td>
                        <td >
                             <asp:Label ID="lb_date" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    

                   
            </table>
            </div>
            
        </div>
    </form>
</body>
</html>
