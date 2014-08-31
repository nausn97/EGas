
package Bean_and_Action;

import POJO.BookingData;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
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
import sun.jdbc.odbc.OdbcDef;


/**
 *
 * @author Naushad Ahmad
 */
public class BookingOrderAction extends org.apache.struts.action.Action {

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
        
        BookingOrderBean obj = (BookingOrderBean)form;
        HttpSession sess = request.getSession(false);
        String c_id = (String)sess.getAttribute("c_id");
        Connection con = null;
            String key = null,email = null;
            con = Data.getConnection();
            DateFormat d = new SimpleDateFormat("yyyy-MM-dd");
            String vdate = d.format(new Date());
            String vQuery = "select *  from bookingdetail  where consumerid='"+c_id+"' and status ='booked' order by dateofbooking desc";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(vQuery);
            Date dat1 = null;
            if(rs.next()){
                st.close();
                rs.close();                
                response.getWriter().print("You can not Book a new refill request because Your Previous Order is Not Delivered You Can Use Your Previous Booked Order for New Refill");
                return null;
            }
            
           else {  
                vQuery = "select *  from bookingdetail  where consumerid='"+c_id+"' and status ='Delivered' order by dateofbooking desc";
                st = con.createStatement();
                rs = st.executeQuery(vQuery);
                if(rs.next()){
                    dat1 = d.parse(rs.getString("dateofdelivery"));                
                    Date dat2 = d.parse(vdate);
                    long n = DateFunction.getDateDiff(dat1, dat2, TimeUnit.DAYS);
                    if(n<30){
                        st.close();
                        rs.close();
                        response.getWriter().print("In One Month you cannot refill your cylinder more than once ! Sorry ");
                        return null;
                    }
                }
                
            }
            
            String query = "insert into Bookingdetail(status,consumerid,NoofCyl,prodid,remark) values (?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, "Booked");
            pst.setString(2, c_id);
            //pst.setString(3,vdate );
            pst.setString(3, obj.getQuantity());
            pst.setString(4, obj.getEquip());
            pst.setString(5, obj.getRemarks());
            int i = pst.executeUpdate();
            ResultSet rs1 = pst.getGeneratedKeys();                                    
            email="naushad_97@outlook.com";            
                if(rs1.next()){
                    key = rs1.getString(1);                        
                    String message = "<html><body style=\"text-align:center\">";                
                    message += "Your order for following services has been submitted to your distributor";
                    //message += dist;
                    message += "<br/>Your Lovely Gas Seva  Reference No. : "+key;
                    message += "<br/>Equipment : "+Data.Equipments[Integer.parseInt(obj.getEquip())];
                    message += "<br/>Quantity : "+obj.getQuantity();
                    message += "<br/>Booking Date : "+vdate;
                    message += "<br/>Your Consumer No : "+c_id;                
                    message += "</body></html>";
                    final String msg = message;
                    final String mailId = email;
                    
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
                
                    con.close();
                    response.getWriter().print(message);
                    return null;
                }
    
         return null;
}
}