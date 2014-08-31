/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Naushad Ahmad
 */
public class FinalMyAppointmentAction extends org.apache.struts.action.Action {

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
        Statement st = con.createStatement();
        FinalMyAppointmentBean obj = (FinalMyAppointmentBean)form;
        String vQuery = "select * from appointment where refno='"+obj.getRef()+"'";
        ResultSet rs = st.executeQuery(vQuery);
        if(rs.next()){
            st.close();
            rs.close();
            response.getWriter().print("Your Appointment is Already Scheduled");
            return null;
        }
        String email = "";        
        String scId="";
        {
                String q="Select id from schedule where date=? AND slots=? AND distributorId=?";
                PreparedStatement ps=con.prepareStatement(q);
                ps.setString(1, obj.getDate());
                ps.setInt(2,Integer.parseInt(obj.getAppoint()));
                ps.setInt(3, 10);
                rs=ps.executeQuery();
                rs.next();
                scId=rs.getString(1);
        }
        String query = "insert into appointment values(?,?,?)";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setInt(1, obj.getRef());
        pst.setString(2, scId);
        pst.setInt(3, obj.getRef());
        int i = pst.executeUpdate();
        String message = "<html><body style=\"margin-top:20px\">";
        message += "Thank You So Much to Apply for a New Connection in Lovely Gas Seva<br>";
        message += "Please Note Down Your Appointment date and time you need to Bring Following documents";
        message += "<ul><li>Print out Of Filled Form</li><li>Identity Proof</li><li>Address Proof</li><li>Passport Size Color Photograph</li></ul>";
        message += "Your Appoinment is scheduled on <b>" +obj.getDate()+" at "+obj.getAppoint();
        message += "</b></body></html>";
        if(i>0){            
            pst.close();
            String q = "select email from newConnection where id ='"+obj.getRef()+"'";
            st = con.createStatement();
            rs = st.executeQuery(q);
            if(rs.next())
            {
                email = rs.getString("email");
                new SendMail().sendMail(email, "Lovely Gas Seva", "Appointment", message);
                response.getWriter().print(message);
            }          
            con.close();
            return null;
        }
        else{
            response.getWriter().print("There are some technichal issue please try after some time we are trying to resolve. !");
            con.close();
            return null;
        }
        
        
    }
}
