
package Bean_and_Action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class RefillAction extends org.apache.struts.action.Action {
    private static final String SUCCESS = "success";
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
                
                Connection con = Data.getConnection();
                String buffer = "<div id=\"wrapper_demo\">\n" +
                    " <div class=\"assignmentbodytable\">              \n" +
                    "     <table class=\"assignmentbodytable\" id=\"assignmenttable\">";
                            buffer +="<tr  >        \n" +
                    "    <th bgcolor=\"#679981\" style=\"color:#FFFFFF\">Course Code</th>\n" +
                    "    <th width=\"100\" bgcolor=\"#679981\" style=\"color:#FFFFFF\">Faculty Name</th>\n" +
                    "    <th bgcolor=\"#679981\" style=\"color:#FFFFFF\">Date</th>\n" +
                    "    <th width=\"200px\" bgcolor=\"#679981\" style=\"color:#FFFFFF\">Description</th>\n" +
                    "    <th bgcolor=\"#679981\" style=\"color:#FFFFFF\">Maximum Marks</th>\n" +
                    "    <th bgcolor=\"#679981\" style=\"color:#FFFFFF\">Marks Obtain</th>\n" +
                    "    \n" +
                    "    <th width=\"200\" bgcolor=\"#679981\" style=\"color:#FFFFFF\">Teacher Comment</th>\n" +
                    "    <th width=\"50\" bgcolor=\"#679981\" style=\"color:#FFFFFF\"> File</th>\n" +
                    "    <th width=\"50\" bgcolor=\"#679981\" style=\"color:#FFFFFF\"> File</th>\n" +
                "</tr >    ";        
                HttpSession sess = request.getSession(false);
                String c_id = (String)sess.getAttribute("c_id");
                String query = "select * from BookingDetail where status='open' and consumerId = '"+c_id+"'";        
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);
                if(rs.next()) {
                    buffer += "<tr><td>Hellooo</td><td>Hellooo</td><td>Hellooo</td><td>Hellooo</td><td>Hellooo</td><td>Hellooo</td><td>Hellooo</td><td>Hellooo</td><td>Hellooo</td></tr>";
                }                
                response.getWriter().print(buffer);        
                return null;
    }
}
