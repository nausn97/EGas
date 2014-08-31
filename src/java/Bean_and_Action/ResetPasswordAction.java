/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Naushad Ahmad
 */
public class ResetPasswordAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ResetPasswordBean obj = (ResetPasswordBean)form;
        HttpSession sess = request.getSession();        
        Connection con = Data.getConnection();
        Statement st = con.createStatement();
        String query = "select c.cid,c.userid,u.fname,u.mname,u.lname from consumer as c inner join [dbo].[user] as u on (u.userid = c.userid) where c.cid='"+obj.getCid()+"'";        
        String buffer = "<html><body>";
        ResultSet rs = st.executeQuery(query);
        if(rs.next()){
            sess.setAttribute("tempcid", obj.getCid());
            String name = rs.getString("fname") + " "+rs.getString("mname")+" "+rs.getString("lname");
            buffer += "<label style=\"color:red;\">This account match your Search<br></label><br>";
            buffer += "current info<br>";
            buffer += "<img src=\"Pic.jsp?imgid="+rs.getString("userid")+"\" style=\"width:60px;height:auto\"/>";
            buffer += "<br><label style=\"color:Gray; font-weight:bold\">Name: "+name+"</labe>";
            buffer += "<br><label style=\"color:#000; font-size:11px;\">E-Gas Seva User</labe>";
            buffer += "<br><br><input type=\"submit\" class=\"btn btn-default\" value=\"This is My Account\" onclick=\"javascript:getEmail()\">";
            buffer += "</body></html>";
            response.getWriter().print(buffer);
            con.close();
            return null;
        }
        response.getWriter().print("Sorry No Match Found Please Check Your Consumer Id");
        con.close();
        return null;
    }
}
