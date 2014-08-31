/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.*;

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
public class UpdateBasicInfoAction extends org.apache.struts.action.Action {

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
        Connection con = Data.getConnection();
        
        HttpSession sess = request.getSession(false);
        String userId =  (String)sess.getAttribute("userID");
        //int Id = Integer.parseInt(userId);
        UpdateBasicInfoBean obj = (UpdateBasicInfoBean)form;
        String fname = obj.getfName();
        String lname = obj.getlName();
        String mname = obj.getmName();
        String gender = obj.getGender();
        String dob = obj.getDob();
        String father = obj.getFatherName();
        String mother = obj.getMotherName();
        String spouse = obj.getSpouseName();
        String m_st = obj.getMarital_status();
        String query = "update [dbo].[user] set fname='"+fname+"',mname='"+mname+"',lname='"+lname+"',gender='"+gender+"',dob='"+dob+"',father_name='"+father+"',mother_name='"+mother+"',spouse_name='"+spouse+"',marital_status='"+m_st+"' where userId="+userId+""; 
        PreparedStatement pst = con.prepareStatement(query);
        int i = pst.executeUpdate();
        if(i>0){
            
            sess.setAttribute("msg", "Update Successful");
            con.close();
            return mapping.findForward("updateBasicInfo");
        }
        else{
            sess.setAttribute("msg", "Cannot Update");
            con.close();
            return mapping.findForward("Fail-Basic-Info");
        }
        
    }
}
