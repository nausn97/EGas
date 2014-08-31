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
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

/**
 *
 * @author Naushad Ahmad
 */
public class ComplainAction extends org.apache.struts.action.Action {

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
            
            String c_id = (String)sess.getAttribute("c_id");
            ComplainBean obj = (ComplainBean)form;            
            Connection con = Data.getConnection();
            String query = "insert into complain(complaintype,Complainnature,status,complaindate,consumerid,description) values(?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, obj.getType());
            pst.setString(2, obj.getNaturetype());
            pst.setString(3, "Booked");
            pst.setString(4, getDate());
            pst.setString(5, c_id);
            pst.setString(6, obj.getComp());
            
            int i = pst.executeUpdate();
            ResultSet rs = pst.getGeneratedKeys();
            if(rs.next()){
                response.getWriter().print("Your Complain has been Logged. Please note down your Complain Id for any further Query : "+rs.getString(1));
                con.close();
                return null;
                //sess.setAttribute("compId", rs.getString(1));
            }
            response.getWriter().print("Your Complain can not be logged right now Please try later. we Are working on it. ");
            con.close();
            return null;
    }
    
    public String getDate(){
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String curDate = formatter.format(new Date());
        return curDate;
        
    }
}
