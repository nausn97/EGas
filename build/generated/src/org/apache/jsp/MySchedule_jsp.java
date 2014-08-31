package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;;

public final class MySchedule_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Get Appointment</title>\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            .appoint{            \n");
      out.write("                width: 80%;\n");
      out.write("                margin-left: 10%;\n");
      out.write("                //height: 300px;\n");
      out.write("            }\n");
      out.write("            .availSlot{\n");
      out.write("                width: 50%;\n");
      out.write("                margin-left: 28%;\n");
      out.write("                border: 1px #000 solid;\n");
      out.write("                padding: 10px;\n");
      out.write("                margin-top: 5%;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .availSlot input{\n");
      out.write("                width: 100px;\n");
      out.write("                height: 100px;\n");
      out.write("                margin: 10px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("        <link type=\"text/css\" href=\"css/bootstrap.css\"/>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <script type='text/javascript' src=\"js/jquery.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function getAppointDetail(){                \n");
      out.write("                date=document.getElementById(\"dateofappoint\").value;                                  \n");
      out.write("            if (typeof XMLHttpRequest != \"undefined\"){\n");
      out.write("                 xmlHttp= new XMLHttpRequest();      }\n");
      out.write("            else if (window.ActiveXObject){\n");
      out.write("                 xmlHttp= new ActiveXObject(\"Microsoft.XMLHTTP\");      }\n");
      out.write("            if (xmlHttp==null){\n");
      out.write("                alert(\"Browser does not support XMLHTTP Request\")\n");
      out.write("                return;      }\n");
      out.write("            //alert('hjhkjhkh');\n");
      out.write("            var url=\"appointment.do\";\n");
      out.write("            url +=\"?date=\"+date;\n");
      out.write("            //alert(url);\n");
      out.write("            xmlHttp.onreadystatechange = doUpdate;\n");
      out.write("            //alert(\"Processing....\");\n");
      out.write("            document.getElementById(\"wait\").innerHTML=\"<div><img src=\\\"home_imgs/wait.gif\\\"></img></div>\";\n");
      out.write("            xmlHttp.open(\"GET\", url);\n");
      out.write("            //alert(\"Checking....\");\n");
      out.write("            xmlHttp.send(null);\n");
      out.write("            //alert(\"waiting....\");\n");
      out.write("            }      \n");
      out.write("     function doUpdate(){\n");
      out.write("         if (xmlHttp.readyState==4 || xmlHttp.readyState==\"complete\"){\n");
      out.write("             var a=xmlHttp.responseText;\n");
      out.write("             //alert(a);\n");
      out.write("              document.getElementById(\"wait\").innerHTML=a;              \n");
      out.write("          }\n");
      out.write("          \n");
      out.write("         \n");
      out.write("     }\n");
      out.write("   </script>\n");
      out.write("     <script type=\"text/javascript\">\n");
      out.write("     function finalMyAppoint(appoint){\n");
      out.write("         \n");
      out.write("         \n");
      out.write("            date=document.getElementById(\"dateofappoint\").value;    \n");
      out.write("            ref=document.getElementById(\"ref\").value;  \n");
      out.write("            \n");
      out.write("            //lert(ref);\n");
      out.write("            \n");
      out.write("            if (typeof XMLHttpRequest != \"undefined\"){\n");
      out.write("                 xmlHttp= new XMLHttpRequest();      }             \n");
      out.write("             \n");
      out.write("            else if (window.ActiveXObject){\n");
      out.write("                 xmlHttp= new ActiveXObject(\"Microsoft.XMLHTTP\");      }\n");
      out.write("            if (xmlHttp==null){\n");
      out.write("                alert(\"Browser does not support XMLHTTP Request\")\n");
      out.write("                return;      }      \n");
      out.write("            \n");
      out.write("           var url=\"finalMyAppoint.do\";\n");
      out.write("            url +=\"?appoint=\"+appoint+\"&date=\"+date+\"&ref=\"+ref;\n");
      out.write("            //alert(ref);\n");
      out.write("            //alert(url);    \n");
      out.write("           \n");
      out.write("           xmlHttp.onreadystatechange = doInsert;\n");
      out.write("            //alert(\"Processing....\");\n");
      out.write("            document.getElementById(\"wait2\").innerHTML=\"<div><img src=\\\"home_imgs/waitarrow.gif\\\"></img>Please Wait While Processing ...</div>\";\n");
      out.write("            xmlHttp.open(\"GET\", url);            \n");
      out.write("            xmlHttp.send(null);\n");
      out.write("         }\n");
      out.write("         \n");
      out.write("         function doInsert(){\n");
      out.write("         if (xmlHttp.readyState==4 || xmlHttp.readyState==\"complete\"){            \n");
      out.write("             a=\"\";\n");
      out.write("            var a=xmlHttp.responseText;                          \n");
      out.write("             document.getElementById(\"wait2\").innerHTML=a;              \n");
      out.write("          }\n");
      out.write("      }\n");
      out.write("    </script>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"appoint\">\n");
      out.write("            \n");
      out.write("            <div class=\"panel panel-primary\">\n");
      out.write("                <div class=\"panel-heading\">\n");
      out.write("                    Choose Your Slot \n");
      out.write("                </div>\n");
      out.write("                <div class=\"panel-body\">                    \n");
      out.write("                        <label style=\"margin-left: 23%;font-family: tahoma;color: #666;margin-right: 3%;\">Date</label><input type=\"date\" id=\"dateofappoint\" class=\"\" style=\"width: 50%;\"/>                   \n");
      out.write("                        ");

                            String ref = request.getParameter("refKey");
                        
      out.write("\n");
      out.write("                        <label style=\"margin-left: 14%;font-family: tahoma;color: #666;margin-right: 3%;margin-top: 20px;\">Reference Number</label><input type=\"text\" id=\"ref\" class=\"\" value=\"");
      out.print(ref);
      out.write("\" style=\"width: 50%;\" readonly=\"true\" required=\"true\"/>                   \n");
      out.write("                        <input type=\"submit\" onclick=\"getAppointDetail()\" class=\"btn btn-success\" style=\"width: 15%;margin-left: 29%; margin-top: 20px;\">\n");
      out.write("                    <div id=\"wait\">                        \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"wait2\" style=\"margin-left: 27%;margin-top: 20px;\">                        \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
