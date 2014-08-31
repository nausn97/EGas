/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class NewPasswordRecoverAction extends org.apache.struts.action.Action {

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
        NewPasswordRecoverBean obj = (NewPasswordRecoverBean)form;
        Connection con = Data.getConnection();
        HttpSession sess = request.getSession();
        String id_recover = (String)sess.getAttribute("tempcid");
        if(obj.getNewpassword().equals(obj.getConfirmnewpassword())){
                    
                    String query = "update consumer set password=? where cid='"+id_recover+"'";
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(1, SecuredPassword.generateStorngPasswordHash(obj.getNewpassword()));
                    int i = pst.executeUpdate();
                    if(i>0){
                        response.getWriter().print("Password has been changed");
                        con.close();
                        return null ;
                    }
         }
        else{
            response.getWriter().print("Password doesnot matched Please Enter Again your New Password and Confirm passeord");
            return null;
        }
        
        return null;
    }
}
