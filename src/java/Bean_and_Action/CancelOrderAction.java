/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
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
public class CancelOrderAction extends org.apache.struts.action.Action {

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
        CancelOrderBean obj = (CancelOrderBean)form;
        String id =     obj.getId();
        HttpSession sess = request.getSession();
         
         Connection con = Data.getConnection();
         String query = "update bookingdetail set status='Cancelled' where no='"+id+"'";
         Statement st = con.createStatement();         
         int i = st.executeUpdate(query);
         if(i>0){
             String message = "<html><body>";
             String email = (String)sess.getAttribute("email");
             message+="Your Order Number : "+id+"has been cacelled successfully" ;
             final String mailId = email;
             final String msg = message;
             new Thread(new Runnable(){

                    @Override
                    public void run() {
                        try {
                            new Bean_and_Action.SendMail().sendMail(mailId,"Lovely Gas Seva","Hello",msg);         
                        } catch (MessagingException ex) {
                            Logger.getLogger(SignUpFormAction.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }).start();
                
            // 
             response.getWriter().print("Your Order has been cancelled");
         }
         else{
             response.getWriter().print("Failed");
         }
         con.close();
         return null;
    }
}
