<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CLIConnect.aspx.cs" Inherits="form1_CLIConnect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Print Interview Evaluation Form </title>

    <style type="text/css">
        *{margin:0; padding:0; font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;}
        .content { min-width:1200px; width:70%; margin:0 auto; font-size:9px }
        .slip {border:1px solid #eee; padding:40px; margin:20px;}
        table { text-align:left; width:100%; margin:0px 0 0;  border-collapse: collapse;}
        table th,td {   font-size:21px; padding:9px; }
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
                  url: "form1/CLIConnect.aspx/viewers",
                  data: JSON.stringify({ Id: evs }),
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (data) {
                      if (data.d.toString() != "") {
                          var result = data.d.split("~");

                          $("input[name=quest][value=" + result[0] + "]").attr('checked', 'checked');
                        
                          $("[id$=lb_name]").html(result[8]);
                          $("[id$=lb_date]").html(result[4]);
                          $("[id$=lb_proffor]").html(result[9]);
                          $("[id$=lb_interby]").html(result[5]);
                          $("[id$=lb_pos]").html(result[6]);

                          $("[id$=lb_date]").html(result[1]);
                          $("[id$=lb_name]").html(result[2]);
                          $("[id$=lb_pos]").html(result[3]);
                          $("[id$=lb_empname]").html(result[4]);
                          $("[id$=lb_dept]").html(result[5]);
                          $("[id$=lb_others]").html(result[6]);

                          $("[id$=conquest1]").html(result[7]);
                          $("[id$=conquest2]").html(result[8]);
                          $("[id$=conquest3]").html(result[9]);
                          $("[id$=conquest4]").html(result[10]);

                          auto_grow(document.getElementById("conquest1"));
                          auto_grow(document.getElementById("conquest2"));
                          auto_grow(document.getElementById("conquest3"));
                          auto_grow(document.getElementById("conquest4"));

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
             <img class="pull-right" style="width:400px; height:100px;" src="dist/img/myCLIRecruitmentAdminPortal.png" /
            </div>
             <div>
                  
            </div>
                    
            <table >
                   <tr>
                        <td>
                        <p style="font-size:27px; margin-top:30px; text-align:center;"><strong>BACKGROUND CHECK - CLI CONNECTIONS</strong></p>
                        </td>
                   </tr>
            </table>

             <table >
                   <tr>
                        <td style="width:23%;">
                           Name of Applicant
                        </td>
                        <td style="width:3%;">:</td>
                        <td style="border-bottom:1px solid;">
                            
                           <asp:Label ID="lb_name" runat="server" Text=""></asp:Label>
                        </td>
                        <td style="width:35%;"></td>
                   </tr>
                   <tr>
                        <td>
                           Position profiled for
                        </td>
                        <td >:</td>
                        <td style="border-bottom:1px solid;">
                            
                           <asp:Label ID="lb_pos" runat="server" Text=""></asp:Label>
                        </td>
                        <td></td>
                   </tr>
                   <tr>
                        <td>
                          Employee's Name
                        </td>
                        <td>:</td>
                        <td style="border-bottom:1px solid;">
                           <asp:Label ID="lb_empname" runat="server" Text=""></asp:Label>
                        </td>
                        <td ></td>
                   </tr>
                   <tr>
                        <td>
                          Department
                        </td>
                        <td>:</td>
                        <td style="border-bottom:1px solid;">
                           <asp:Label ID="lb_dept" runat="server" Text=""></asp:Label>
                        </td>
                        <td ></td>
                   </tr>
                   <tr>
                        <td >
                          Relationship
                        </td>
                        <td >:</td>
                        <td colspan="2">
                            <table>
                                <tr>
                                    <td><input type="checkbox" name="quest" id="Checkbox1" value="1" onclick="javascript: return false;" /><label for="Checkbox1"  style="font-size:18px;"> &nbsp; Colleague</label></td>
                                    <td><input type="checkbox" name="quest" id="Checkbox2" value="2"  onclick="javascript: return false;" /><label for="Checkbox1" style="font-size:18px;"> &nbsp; Schoolmate</label></td>
                                    <td><input type="checkbox" name="quest" id="Checkbox3" value="3"  onclick="javascript: return false;" /><label for="Checkbox1" style="font-size:18px;"> &nbsp; Relative</label></td>
                                    <td><input type="checkbox" name="quest" id="Checkbox4" value="4"  onclick="javascript: return false;" /><label for="Checkbox1" style="font-size:18px;"> &nbsp; Others:</label></td>
                                    <td style="border-bottom:1px solid; width:30%;">
                                     <asp:Label ID="lb_others" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                   </tr>
                   <tr>
                        <td colspan="4">
                          Please answer the questions below.
                        </td>
                    </tr>
                      <tr>
                        <td colspan="4">
                            <table>
                                <tr>
                                    <td style="width:5%;"></td>
                                    <td>
                                       <table>
                                            <tr>
                                                <td> 1. Where and how long do you know each other?
                                                </td>
                                            </tr>
                                            <tr>
                                             <td style="border-bottom:1px solid;">
                                               <textarea id="lb_conquest1" readonly="readonly" rows="2" cols="max"></textarea>    
                                             </td>
                                            </tr>
                                       </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:5%;"></td>
                                    <td>
                                       <table>
                                            <tr>
                                                <td> 2. What can you say about the applicant's attitude/ personality?
                                                </td>
                                            </tr>
                                             <tr>
                                             <td style="border-bottom:1px solid;">
                                               <textarea id="conquest2" readonly="readonly" rows="2" cols="max"></textarea>  
                                                </td>
                                            </tr>
                                       </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:5%;"></td>
                                    <td>
                                       <table>
                                            <tr>
                                                <td> 3. What can you say about the applicant's work performance?
                                                </td>
                                            </tr>
                                             <tr>
                                             <td style="border-bottom:1px solid;">
                                               <textarea id="conquest3" readonly="readonly" rows="2" cols="max"></textarea>  
                                                </td>
                                            </tr>
                                       </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:5%;"></td>
                                    <td>
                                       <table>
                                            <tr>
                                                <td> 4. Would you recommend him/her to be hired in Cebu Landmasters, Inc.? And why?
                                                </td>
                                            </tr>
                                             <tr>
                                             <td style="border-bottom:1px solid;">
                                               <textarea id="conquest4" readonly="readonly" rows="2" cols="max"></textarea>  
                                                </td>
                                            </tr>
                                       </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-bottom:1px solid;" align="center">
                                    
                                        <asp:Label ID="lb_date" runat="server" Text=""></asp:Label> 
                                    </td>
                                </tr>
                                <tr>
                                <td align="center">
                                        DATE
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2">
                        
                        </td>
                            <td>
                            <table>
                                <tr>
                                    <td style="border-bottom:1px solid;">
                                    </td>
                                </tr>
                                <tr>
                                <td align="center">
                                        NAME AND SIGNATURE
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                     <tr>
                        <td>&nbsp;</td>
                    </tr> <tr>
                        <td>&nbsp;</td>
                    </tr>
                      <tr>
                        <td colspan="4" align="center" style="font-size:15px;">
                          10th Floor, Park Centrale, J.M. del Mar St., Cebu I.T. Park, Apas, Cebu City
                        </td>
                    </tr>
                     <tr>
                        <td colspan="4" align="center"  style="font-size:15px;">
                          Tel. No. (032) 231-4914 & (032) 231-4870 or Telefax (032) 231-5073
                        </td>
                    </tr>
            </table>
            </div>
           
        </div>
    </form>
</body>
</html>
