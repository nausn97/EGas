/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.Types;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Naushad Ahmad
 */
public class BookingStatusAction extends org.apache.struts.action.Action {

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
        BookingStatusBean obj = (BookingStatusBean)form;
        int id = Integer.parseInt(obj.getId());
        
        CallableStatement st=Data.getConnection().prepareCall("{?=call Bookingwaitingstatus(?) };");
              st.registerOutParameter(1, Types.INTEGER);
              st.setInt(2, id);
              st.execute();
              int wl=-10;
                  wl=st.getInt(1);
              String msg="";
              if(wl==-1)
              {
                  msg+="Running Out of Stock .Waiting List can not be predicted for your booking.";
                  response.getWriter().print(msg);
                  return null;
              }
              else if(wl==0){
                 msg+="Your product is in stock and it will be delivered in a very short span of time"; 
                 response.getWriter().print(msg);                 
                 return null;
              }
              else if(wl>0)
              {
                  msg+="Your Booking Waiting No is "+wl;
              }
              response.getWriter().print(msg);
              return null;
        
        
        
    }
}
