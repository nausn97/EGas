/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class ChangePasswordAction extends org.apache.struts.action.Action {

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
        HttpSession sess = request.getSession();
        ChangePasswordBean obj = (ChangePasswordBean)form;
        String pass = obj.getOldpassword();
        
        String c_id = (String)sess.getAttribute("c_id");
        Connection con = Bean_and_Action.Data.getConnection();
        String query = "select password from consumer where cid='"+c_id+"'";        
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        String message = "0";
        if(rs.next()){
            message = obj.getNewpassword();
            String p = rs.getString(1);
            if(Bean_and_Action.SecuredPassword.validatePassword(pass,p)){
                message += " "+obj.getConfirmnewpassword();
                if(obj.getNewpassword().equals(obj.getConfirmnewpassword())){
                    
                    query = "update consumer set password=? where cid='"+c_id+"'";
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(1, SecuredPassword.generateStorngPasswordHash(obj.getNewpassword()));
                    int i = pst.executeUpdate();
                    if(i>0){
                        response.getWriter().print("Password has been changed");
                        con.close();
                        return null ;
                    }
                }
                
            }
            else{
                response.getWriter().print("Please Enter Correct Old Password");
                con.close();
                return null;
            }
        }
        else{
            response.getWriter().print(message);
            con.close();
            return null;
        }
        response.getWriter().print(message);
        con.close();
        return null;
    }
}
