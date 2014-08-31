/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

/**
 *
 * @author Naushad Ahmad
 */
public class ConfirmButtonAction extends org.apache.struts.action.Action {

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
        String buffer = "";
        HttpSession sess = request.getSession();
        String c_id = (String)sess.getAttribute("c_id");
         
         Connection con = Data.getConnection();
         String query = "select * from BookingDetail where status ='Booked' and consumerId='"+c_id+"'" ;        
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if(!rs.next()){
                 buffer = "<input type=\"submit\" value=\"Confirm Booking\" style=\"float: right;margin-top: 20px;\"/>";                                   
        }
        else{
            buffer = "<labe>You Previous Booking Order is Not Delivered</label>";
        }
        response.getWriter().print(buffer); 
        con.close();
        return null;
    }
}
