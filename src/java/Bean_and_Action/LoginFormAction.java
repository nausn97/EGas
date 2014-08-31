
package Bean_and_Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.sql.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Naushad Ahmad
 */
public class LoginFormAction extends org.apache.struts.action.Action {

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
        
        LoginFormBean obj = (LoginFormBean)form;
        String uid = obj.getUid();
        String pass = obj.getPwd();
        String UserType = obj.getUserType();        
        HttpSession sess = request.getSession(true);
        Connection con = Data.getConnection();        
        String query = "select c.cid,c.password,u.userid,c.status from consumer as c inner join [dbo].[user] as u on (c.userid = u.userid) where c.cid = '"+uid+"';";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if(rs.next()) {  
            
            String status = rs.getString(4);
            String userid = rs.getString(3);
            String p=rs.getString(2);
            if(!SecuredPassword.validatePassword(pass, p))
            {
                sess.setAttribute("logError", "Incorrect User Id or Password <br/> Please Check if Caps Lock is On ");
                con.close();
                return mapping.findForward("Auth_Fail");
            }
            sess.setAttribute("userid", userid);
            sess.setAttribute("c_id", uid);
            if(status.equalsIgnoreCase("inActive")){
                con.close();
                return mapping.findForward("Inactive-User");
            }           
            else{
                Cookie cookie = new Cookie("c_user",uid);
                response.addCookie(cookie);
                cookie = new Cookie("pass_key",pass);
                response.addCookie(cookie); 
                cookie = new Cookie("presence",sess.getId());
                response.addCookie(cookie);                 
                con.close();
                return mapping.findForward("Auth_Succ");            
            }
        }
        else{    
            sess.setAttribute("logError", "Incorrect User Id or Password <br/> Please Check if Caps Lock is On ");
            con.close();
            return mapping.findForward("Auth_Fail");
        }    
        
        
    }
}
