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
public class RecoverPasswordAction extends org.apache.struts.action.Action {

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
        RecoverPasswordBean obj = (RecoverPasswordBean)form;
        HttpSession sess = request.getSession();
        String id_recover = (String)sess.getAttribute("tempcid");
        String query = "select email from [dbo].[user] as u inner join consumer as c on (u.userid = c.userid) where c.cid='"+id_recover+"'";
        Connection con = Data.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if(rs.next()){
            if(rs.getString(1).equals(obj.getEmail())){
                String message = "<html><body>";
                message += "<a href=\"http://localhost:8084/GasPortal/NewPasswordRecover.jsp\">Click Here To Reset Your Password</a>";
                message += "</body></html>";
                new SendMail().sendMail(obj.getEmail(), "Lovely Gas Seva", "password reset", message);
                response.getWriter().print("Password Reset Link has been Sent to your Email ");
                return null;
            }
            else{
                response.getWriter().print("This is not valid Email that is registered at Lovely gas Seva with this account");
                con.close();
                return null;
            }
            
        }
        return null;
    }
}
