/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class UpdateAddressAction extends org.apache.struts.action.Action {

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
        String userId =  (String)sess.getAttribute("ID");
        //int userId = Integer.parseInt(Id);
        UpdateAddressBean obj = (UpdateAddressBean)form;
        String HNo = obj.getHNo();
        String FNo = obj.getFNo();
        String BNo = obj.getBNo();
        String SNo = obj.getSNo();
        String landmark = obj.getLandmark();
        String city = obj.getCity();
        String state = obj.getState();
        String country = obj.getCountry();
        String pin = obj.getPin();
        String mob = obj.getMob();
        String email = obj.getEmail();       
        String landline = obj.getLandline();
        String query = "update [dbo].[user] set House_no='"+HNo+"',Hname_flatNo='"+FNo+"',housingcomplex_buildingNo='"+BNo+"',Street_roadname='"+SNo+"',area_landmark='"+landmark+"',phone='"+mob+"',pincode='"+pin+"',city='"+city+"',email='"+email+"',landline='"+landline+"' where userId="+userId+""; 
        PreparedStatement pst = con.prepareStatement(query);
        int i = pst.executeUpdate();
        if(i>0){
            
            sess.setAttribute("msg", "Update Successful");
            con.close();
            return mapping.findForward("updateAddress");
        }
        else{
            sess.setAttribute("msg", "Cannot Update");
            con.close();
            return mapping.findForward("Fail-Basic-Info");
        }
        
    }
}
