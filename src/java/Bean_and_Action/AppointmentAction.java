/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 *
 * @author Naushad Ahmad
 */
public class AppointmentAction extends org.apache.struts.action.Action {

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
        AppointmentBean obj = (AppointmentBean)form;
        String[] day = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","saturday"};
        String data = obj.getDate();        
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatter.parse(data);
        TimeZone tz = TimeZone.getTimeZone("IST");     
//        Calendar calendar = Calendar.getInstance();                
//        //calendar.setTimeZone(tz);            
//        //calendar.setTime(date);
//        //int k = (calendar.getTime().getDay());
//        //if(k==0 || k==6){
//            response.getWriter().print("<div class=\"availSlot\" style=\"color:red\">"+"Sorry We dont give Appointment on Saturday and Sunday Please Choose a Appointment between monday to friday 10 AM-4PM</div>");
//            return null;
//        }
        
        String query = "select * from schedule where date='"+obj.getDate()+"' AND distributorId=10;";                
        Connection con = Data.getConnection();
        Statement st = con.createStatement();
        ResultSet rs  = st.executeQuery(query);
        String buffer = "";
        int a = 0;
        buffer += "<div class=\"availSlot\">" ;
        buffer +="<label style=\"width:100%\">Available Slots</label>";
        while(rs.next()){
            if(rs.getInt("status")==0){
                a = rs.getInt("slots");
                buffer += "<input type=\"submit\" class=\"btn btn-success btn-group\" value=\""+Data.scheduleSlot[rs.getInt("slots")]+"\" id=\""+Data.scheduleSlot[rs.getInt("slots")]+"\" onclick=\"javascript:finalMyAppoint('"+a+"')\"/>" ;
            }
            else{
                buffer += "<input type=\"submit\" class=\"btn btn-warning btn-group disabled\" value=\""+Data.scheduleSlot[rs.getInt("slots")]+"\" id=\""+Data.scheduleSlot[rs.getInt("slots")]+"\" onclick=\"javascript:finalMyAppoint()\"/>" ;
            }
        }
        buffer += "</div>" ;        
        response.getWriter().print(buffer);
        con.close();
        return null;
    }
}


