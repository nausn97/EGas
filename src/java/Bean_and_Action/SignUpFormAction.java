/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
public class SignUpFormAction extends org.apache.struts.action.Action {

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
         SignUpFormBean obj = (SignUpFormBean)form;
         HttpSession sess = request.getSession(true);
         String cid = obj.getCid();
         String mob = obj.getMob();
         final String email = obj.getEmail();         
         Connection con = Data.getConnection();
         String query = "select c.cid,u.phone,u.email from consumer as c inner join [dbo].[user] as u on (u.userid = c.userid) where CID ='"+cid+"'" ;
         Statement st = con.createStatement();
         ResultSet rs = st.executeQuery(query);
         if(rs.next()) { 
            String message = "<html><body>";
            message += "Dear User<br/>You Have applied for a new account on Lovely Gas Seva<br/>";
            message += "Please Use The User Id and password provided to you in mail for email verifiacation<br/>";
            message += "Your User Id : "+cid+"<br/>";
            int password = (int)(Math.random()*100000);
            int mobcode = (int)(Math.random()*100000);
            message += "Password : "+password+"<br/>";            
            message +="</body></html>";            
            
            String q = "update consumer set Password='"+SecuredPassword.generateStorngPasswordHash(""+password)+"',Status='InActive' where cid='"+cid+"'";
            Statement st1 = con.createStatement();
            int k = st1.executeUpdate(q);
            final String m=message;
            if(k>0){          
                new Thread(new Runnable(){

                    @Override
                    public void run() {
                        try {
                            new Bean_and_Action.SendMail().sendMail(email,"Lovely Gas Seva","Hello",m);
                        } catch (MessagingException ex) {
                            Logger.getLogger(SignUpFormAction.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }).start();
                               
            }
            con.close();
            return mapping.findForward("Succ_verification");
        }
         else{
             sess.setAttribute("Error", "Please Enter Your Valid Consumer Number ");
             con.close();
             return mapping.findForward("Err_verification");
             
         }   
        
    }
}

