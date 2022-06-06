<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
    }

    void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("", "vacancies", "~/site/vacancy.aspx");
        routes.MapPageRoute("", "job", "~/site/jobs.aspx");
        routes.MapPageRoute("", "contact", "~/site/contact.aspx");
        routes.MapPageRoute("", "career", "~/site/Default.aspx");
        routes.MapPageRoute("", "about", "~/site/about.aspx");
        
        routes.MapPageRoute("", "mail-config", "~/content/config/email.aspx");
        routes.MapPageRoute("", "blog", "~/blogger/Default.aspx");
        routes.MapPageRoute("", "post", "~/content/hr/blog_list.aspx");
        routes.MapPageRoute("", "create-post", "~/content/hr/blog.aspx");
        routes.MapPageRoute("", "edit-post", "~/content/hr/blog.aspx");
        routes.MapPageRoute("", "courses", "~/content/hr/courses.aspx");
        routes.MapPageRoute("", "compose-email", "~/content/HR/email_create.aspx");
        routes.MapPageRoute("", "email", "~/content/HR/email.aspx");
        routes.MapPageRoute("", "error", "~/error.aspx");
        routes.MapPageRoute("", "dashboard", "~/content/hr/report/Default.aspx");
        routes.MapPageRoute("", "applicants", "~/content/hr/Default.aspx");
        routes.MapPageRoute("", "banner", "~/content/hr/setting.aspx");
        //routes.MapPageRoute("", "recruitment", "~/recruitment.aspx"); 
        routes.MapPageRoute("", "questionnaire", "~/content/examineer/questionnaire.aspx");
 
        //HR
        routes.MapPageRoute("", "addJobtype", "~/content/HR/addJobType.aspx");
        routes.MapPageRoute("", "JobTypeList", "~/content/HR/JobTypeList.aspx");
        routes.MapPageRoute("", "JobDetails", "~/content/HR/JobDetails.aspx");
        routes.MapPageRoute("", "JobList", "~/content/HR/JobsList.aspx");
        routes.MapPageRoute("", "exmrlt", "~/content/HR/examresult.aspx");
        routes.MapPageRoute("", "Approval","~/content/HR/forApproval.aspx");
        
        
        routes.MapPageRoute("", "cebu", "~/content/HR/Form.aspx"); //1
        routes.MapPageRoute("", "cdo", "~/content/HR/Form.aspx");   //2
        routes.MapPageRoute("", "bacolod", "~/content/HR/Form.aspx");   //3
        routes.MapPageRoute("", "bogo", "~/content/HR/Form.aspx");  //4
        routes.MapPageRoute("", "davao", "~/content/HR/Form.aspx"); //5
        routes.MapPageRoute("", "dumaguete", "~/content/HR/Form.aspx"); //6
        routes.MapPageRoute("", "manila", "~/content/HR/Form.aspx"); //7
        
        
        routes.MapPageRoute("", "recruitment", "~/content/HR/Form.aspx");
        routes.MapPageRoute("", "search", "~/content/HR/search.aspx");
        routes.MapPageRoute("", "FormDetails", "~/content/HR/FormDetails.aspx");
        routes.MapPageRoute("", "appl", "~/content/HR/applicants.aspx");
        routes.MapPageRoute("", "appldet", "~/appdetails.aspx");
        routes.MapPageRoute("", "formapp", "~/form.aspx");
        routes.MapPageRoute("", "reject", "~/content/HR/Rejected.aspx");
        routes.MapPageRoute("", "examinition", "~/content/HR/Exam/examinition.aspx");
        routes.MapPageRoute("", "Source", "~/content/Employee/source.aspx");
        routes.MapPageRoute("", "Location","~/content/Employee/location.aspx");
        routes.MapPageRoute("", "users", "~/content/Employee/user.aspx");
        routes.MapPageRoute("", "evaluation", "~/content/Employee/evaluation.aspx");
        
        //Hired
        routes.MapPageRoute("", "Hired", "~/content/Employee/hired_employee.aspx");
        routes.MapPageRoute("", "viewForm", "~/content/Employee/View.aspx");
        routes.MapPageRoute("", "evalresult", "~/content/Employee/resulteval.aspx");
        
        //examineer
        routes.MapPageRoute("", "exmrfrm", "~/content/examineer/examform.aspx");
        routes.MapPageRoute("", "vwanrdfrm", "~/content/examineer/viewansweredform.aspx");

        //evaluation
        routes.MapPageRoute("", "evalform", "~/content/examineer/evaluation.aspx");

        routes.MapPageRoute("", "MP", "~/content/Manager/ManPower.aspx");
        routes.MapPageRoute("", "viewmp", "~/content/Manager/ViewMonPower.aspx");
        //signout
        routes.MapPageRoute("", "exam", "~/examineer.aspx");
        routes.MapPageRoute("", "quit", "~/content/misc/signout.aspx");
        routes.MapPageRoute("", "admin", "~/Default.aspx");


        routes.MapPageRoute("", "IEF", "~/form1/IEvaluationForm.aspx");
        routes.MapPageRoute("", "IEFForm", "~/form1/IEFForm.aspx");
        routes.MapPageRoute("", "RefCheckForm", "~/form1/RefCheck.aspx");
        routes.MapPageRoute("", "CLIConnection", "~/form1/CLIConnect.aspx");
    }

    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
