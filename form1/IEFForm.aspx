<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IEFForm.aspx.cs" Inherits="form1_IEFForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Interview Evaluation Form </title>

    <style type="text/css">
        *{margin:0; padding:0; font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;}
        .content { min-width:1200px; width:70%; margin:0 auto; font-size:9px }
        .slip {border:1px solid #eee; padding:40px; margin:20px;}
        table { text-align:left; width:100%; margin:0px 0 0;  border-collapse: collapse;}
        table th,td {   font-size:12px; padding:9px;  border:1px solid black;}
        .desx { padding:0px; border:none;}
        .desx th, .desx td{ border:0px solid black; border-right:1px solid black; }
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
                url: "form1/IEFForm.aspx/viewers",
                data: JSON.stringify({ Id: evs }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d.toString() != "") {
                        var result = data.d.split("~");

                        var splitter = result[3].split(",");

                        $("input[name=quest1][value=" + splitter[0] + "]").attr('checked', 'checked');
                        $("input[name=quest2][value=" + splitter[1] + "]").attr('checked', 'checked');
                        $("input[name=quest3][value=" + splitter[2] + "]").attr('checked', 'checked');
                        $("input[name=quest4][value=" + splitter[3] + "]").attr('checked', 'checked');
                        $("input[name=quest5][value=" + splitter[4] + "]").attr('checked', 'checked');
                        $("input[name=quest6][value=" + splitter[5] + "]").attr('checked', 'checked');
                        $("input[name=quest7][value=" + splitter[6] + "]").attr('checked', 'checked');
                        $("input[name=quest8][value='" + result[0] + "']").attr('checked', 'checked');

                        if (result[0] == "Hire") {
                            $("[id$=lb_hire]").html(result[7]);
                        }
                        else if (result[0] == "For Further Interview") {
                            $("[id$=lb_forfurther]").html(result[7]);
                        }
                        else if (result[0] == "Not Hire") {
                            $("[id$=lb_nothire]").html(result[7]);
                        }

                        $("[id$=lb_name]").html(result[8]);
                        $("[id$=lb_date]").html(result[4]);
                        $("[id$=lb_proffor]").html(result[9]);
                        $("[id$=lb_interby]").html(result[5]);
                        $("[id$=lb_pos]").html(result[6]);


                        $("[id$=lb_positive]").html(result[1]);

                        $("[id$=lb_negative]").html(result[2]);

                        auto_grow(document.getElementById("lb_positive"));
                        auto_grow(document.getElementById("lb_negative"));

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
<body>
    <form id="form1" runat="server">
    
         <div class="content">

            <div class="slip">
            <div style="margin-bottom:50px;">
                        <p style="font-size:27px; margin-top:30px;"><strong>Interview Evaluation Form</strong></p>
                            <img class="pull-right" style="width:400px; height:100px; margin-top:-80px;" src="dist/img/myCLIRecruitmentAdminPortal.png" />
                           
            </div>
                    
            <table style="border:1px solid;">
                     <tr>
                        <td style="width:10%;">
                           <h2><strong> CANDIDATE:</strong></h2>
                        </td>
                        <td style="font-size:16px;">
                           <asp:Label ID="lb_name" runat="server" Text=""></asp:Label>
                        </td>
                        <td  style="width:10%; ">
                           <h2><strong> DATE:</strong></h2>
                        </td>
                        <td style="width:30%;font-size:16px; ">
                            <asp:Label ID="lb_date" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          <h2><strong> PROFILED FOR:</strong></h2>         
                        </td>
                        <td colspan="3" style="font-size:16px;">
                            <asp:Label ID="lb_proffor" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <span style=" font-style:normal; font-size:14px;">Please check the appropriate level for each of the competencies below.</span> 
                        </td>
                    </tr>
                    <tr>
                        <td class="desx" colspan="4">
                            <table >
                                <tr>
                                    <td>
                                        <h2>RATING</h2>
                                    </td>
                                    <td>
                                        1 - NOT EVIDENT
                                    </td>
                                    <td>
                                        2 - SLIGHTLY EVIDENT
                                    </td>
                                    <td>
                                        3 - EVIDENT
                                    </td>
                                    <td style="border:none;">
                                        4 - HIGHLY EVIDENT
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="3" style=" text-align:center;">
                            <h2>COMPETENCY</h2>
                        </td>
                        <td class="desx" style="border-top:1px solid black;">
                            <table>
                                <tr>
                                    <td colspan="4" style="border-bottom:1px solid black; border-right:none; text-align:center;">
                                        <h2>RATING</h2>
                                    </td>
                                </tr>
                               <tr style="text-align:center; font-weight:bold;">
                                    <td style="width:25%">
                                    1
                                    </td>
                                    <td style="width:25%">
                                    2
                                    </td>
                                    <td style="width:25%">
                                    3
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                    4
                                    </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                         <td colspan="3" style="font-size:16px;" >
                            <strong>Education/Training Skills-</strong> Does the candidate have the appropriate educational qualification(s) or training(s) for this position?
                        </td>
                      <td class="desx" style="border-top:1px solid black; padding:0px;">
                            <table>
                               <tr style="text-align:center; font-weight:bold;">
                                    <td style="width:25%; padding-top:26px; padding-bottom:26px;" >
                                        <input id="Checkbox1" type="checkbox" name="quest1" value="1" onclick="javascript: return false;"  />
                                    </td>
                                    <td style="width:25%">
                                        <input id="Checkbox2" type="checkbox" name="quest1" value="2"  onclick="javascript: return false;"/>
                                    </td>
                                    <td style="width:25%">
                                        <input id="Checkbox3" type="checkbox" name="quest1" value="3" onclick="javascript: return false;" />
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                        <input id="Checkbox4" type="checkbox" name="quest1" value="4" onclick="javascript: return false;" />
                                    </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                         <td colspan="3" style="font-size:16px;">
                            <strong>Work Experience-</strong>Has the candidate acquired similar skills or qualifications through past work experience(s)?
                        </td>
                      <td class="desx" style="border-top:1px solid black; padding:0px;">
                            <table>
                               <tr style="text-align:center; font-weight:bold;">
                                    <td style="width:25%; padding-top:26px; padding-bottom:26px;" >
                                        <input id="Checkbox5" type="checkbox" name="quest2" value="1" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                        <input id="Checkbox6" type="checkbox" name="quest2" value="2" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                        <input id="Checkbox7" type="checkbox" name="quest2" value="3" onclick="javascript: return false;" />
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                        <input id="Checkbox8" type="checkbox" name="quest2" value="4" onclick="javascript: return false;" />
                                    </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                     <tr>
                         <td colspan="3" style="font-size:16px;">
                            <strong>Technical Qualifcations/Job Related Skills-</strong> Does the candidate have the technical skills necessary for this position?
                        </td>
                      <td class="desx" style="border-top:1px solid black; padding:0px;">
                            <table>
                               <tr style="text-align:center; font-weight:bold;">
                                    <td style="width:25%; padding-top:26px; padding-bottom:26px;">
                                    <input id="Checkbox9" type="checkbox" name="quest3" value="1" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox10" type="checkbox" name="quest3" value="2" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox11" type="checkbox" name="quest3" value="3" onclick="javascript: return false;" />
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                    <input id="Checkbox12" type="checkbox" name="quest3" value="4" onclick="javascript: return false;" />
                                    </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                     <tr>
                         <td colspan="3" style="font-size:16px;">
                            <strong>Problem Solving Skills-</strong>How did candidate hancle challenges at work?
                        </td>
                      <td class="desx" style="border-top:1px solid black; padding:0px;">
                            <table>
                               <tr style="text-align:center; font-weight:bold;">
                                    <td style="width:25%; padding-top:26px; padding-bottom:26px;">
                                    <input id="Checkbox13" type="checkbox" name="quest4" value="1"  onclick="javascript: return false;"/>
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox14" type="checkbox" name="quest4" value="2" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox15" type="checkbox" name="quest4" value="3"  onclick="javascript: return false;"/>
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                    <input id="Checkbox16" type="checkbox" name="quest4" value="4" onclick="javascript: return false;" />
                                    </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                     <tr>
                         <td colspan="3" style="font-size:16px;">
                            <strong>Decision Making Skills-</strong>How did candidate make the best possible decisions in the shortest amount of time?
                        </td>
                      <td class="desx" style="border-top:1px solid black; padding:0px;">
                            <table>
                               <tr style="text-align:center; font-weight:bold;">
                                    <td style="width:25%; padding-top:26px; padding-bottom:26px;">
                                    <input id="Checkbox17" type="checkbox" name="quest5" value="1" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox18" type="checkbox" name="quest5" value="2" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox19" type="checkbox" name="quest5" value="3" onclick="javascript: return false;" />
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                    <input id="Checkbox20" type="checkbox" name="quest5" value="4" onclick="javascript: return false;" />
                                    </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                     <tr>
                         <td colspan="3" style="font-size:16px;">
                            <strong>Motivation/Initiative-</strong>Analyze candidate's ability to think and act independently, and goal orientation. Why does this person want to work at CLI?
                        </td>
                      <td class="desx" style="border-top:1px solid black; padding:0px;">
                            <table>
                               <tr style="text-align:center; font-weight:bold;">
                                    <td style="width:25%; padding-top:26px; padding-bottom:26px;">
                                    <input id="Checkbox21" type="checkbox" name="quest6" value="1" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox22" type="checkbox" name="quest6" value="2" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox23" type="checkbox" name="quest6" value="3" onclick="javascript: return false;" />
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                    <input id="Checkbox24" type="checkbox" name="quest6" value="4" onclick="javascript: return false;" />
                                    </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                     <tr>
                         <td colspan="3" style="font-size:16px;">
                            <strong>Professional Impression:</strong> Consider self-confidence, maturity and assess candidate's level if professionalism.
                        </td>
                      <td class="desx" style="border-top:1px solid black; padding:0px;">
                            <table>
                               <tr style="text-align:center; font-weight:bold;">
                                    <td style="width:25%; padding-top:26px; padding-bottom:26px;">
                                    <input id="Checkbox25" type="checkbox" name="quest7" value="1" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox26" type="checkbox" name="quest7" value="2" onclick="javascript: return false;" />
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox27" type="checkbox" name="quest7" value="3" onclick="javascript: return false;" />
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                    <input id="Checkbox28" type="checkbox" name="quest7" value="4" onclick="javascript: return false;" />
                                    </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                        <tr>
                         <td colspan="3" style=" text-align:center;">
                            <h2>OVERALL IMPRESSION</h2>
                        </td>
                      <td >
                           
                        </td>
                    </tr>

                       <tr>
                         <td  colspan="2" class="desx" style="border-top:1px solid black; border-right:1px solid black; padding:20px; font-size:16px;"  >
                              <strong>REMARKS and RECOMMENDATION</strong> - Final comments and recommendations for proceeding with the candidate.
                              <table>
                               <tr>
                                    <td style="border-right:none; font-size:16px;">
                                        (+)
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-right:none; font-size:16px;">
                                        <textarea id="lb_positive" readonly="readonly" rows="2" cols="max"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-right:none; font-size:16px;">
                                       (-)
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-right:none; font-size:16px;">
                                        <textarea id="lb_negative" readonly="readonly" rows="2" cols="max"></textarea>
                                    </td>
                                </tr>
                              </table>
                        </td>
                      <td colspan="2" class="desx" style="border-top:1px solid black; padding:0px;" valign="top"> 
                            <table>
                               <tr style="text-align:center; font-weight:bold; border-bottom:1px solid black;">
                                    <td style="width:25%;">
                                    Hire
                                    </td>
                                    <td style="width:25%">
                                    For Further Interview
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                    Not Hire
                                    </td>
                               </tr>

                               <tr style=" font-weight:bold; border-bottom:1px solid black;">
                                    <td style="width:25%;">
                                    <input id="Checkbox29" type="checkbox" name="quest8" value="Hire" onclick="javascript: return false;" />
                                     <asp:Label ID="lb_hire" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td style="width:25%">
                                    <input id="Checkbox30" type="checkbox" name="quest8" value="For Further Interview" onclick="javascript: return false;" />
                                     <asp:Label ID="lb_forfurther" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td style="border-right:none; width:25%;">
                                    <input id="Checkbox31" type="checkbox" name="quest8" value="Not Hire" onclick="javascript: return false;" />
                                     <asp:Label ID="lb_nothire" runat="server" Text=""></asp:Label>
                                    </td>
                               </tr>

                                <tr style=" font-weight:bold;">
                                   <td colspan="3" class="desx" style="border-top:1px solid black; padding:0px; border-right:none;">
                                    <table >
                                        <tr>
                                            <td style="border-right:none; border-bottom:1px solid black;">
                                                <strong>INTERVIEWED BY:</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right:none; border-bottom:1px solid black;">
                                             <asp:Label ID="lb_interby" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right:none; border-bottom:1px solid black;">
                                                <strong>POSITION:</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right:none;">
                                             <asp:Label ID="lb_pos" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                   
                                   </td>
                               </tr>


                            </table>
                        </td>
                    </tr>
                   
            </table>
            </div>
            
        </div>
    </form>
</body>
</html>
