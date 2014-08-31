/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
/**
 *
 * @author Naushad Ahmad
 */
public class NewConnectionAction extends org.apache.struts.action.Action {

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
            
            NewConnectionBean obj = (NewConnectionBean)form;
            
            Connection con = Data.getConnection();
            String query = "insert into NewConnection (salutation,fname,mname,lname,dob,gender,marital_status,father_name,mother_name,spouse_name,House_no,Hname_flatNo,housingcomplex_buildingNo,Street_roadname,area_landmark,city,districtid,pincode,phone,email,bank_name,branch_name,branch_add,ifsc,account_no,consumercategoryid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            //String query = "insert into NewConnection (salutation,fname,mname,lname,dob) values(?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, obj.getSalu());
            pst.setString(2, obj.getFname());
            pst.setString(3, obj.getMname());
            pst.setString(4, obj.getLname());
            pst.setString(5, obj.getDate());            
           
            pst.setString(6, obj.getGender());
            pst.setString(7, "Single");
            pst.setString(8, obj.getFathername());
            pst.setString(9, obj.getMothername());
            pst.setString(10,obj.getSpousename());
            pst.setString(11, obj.getHno());
            pst.setString(12, obj.getHname());
            pst.setString(13, obj.getBno());
            pst.setString(14, obj.getSno());
            pst.setString(15, "LPU");
            pst.setString(16, obj.getDistrict());
            pst.setString(17, "1");
            pst.setString(18, obj.getPin());
            pst.setString(19, "935783");
            pst.setString(20, obj.getEmail());
            pst.setString(21, obj.getBankname());
            pst.setString(22, obj.getBranchname());
            pst.setString(23, obj.getBranchaddress());
            pst.setString(24, obj.getIfsc());
            pst.setString(25, obj.getAccount());
            pst.setString(26, "1");
            
            
            String message = "<html><body style=\"text-align:center\">Please Click the link below to get appointment for new connection.<br>";
            message += "<a href=\"http://localhost:8084/GasPortal/MySchedule.jsp?refKey=";
            int i=pst.executeUpdate();
            ResultSet rs = pst.getGeneratedKeys();
            if(rs.next()){
                
                String key = rs.getString(1);                
                message += key;
                message += "\">Click Here</a>";
                message +="</body></html>";      
                final String mailId = obj.getEmail();
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
                //new SendMail().sendMail(obj.getEmail(), "Lovely Gas Seva", "Reference", message);
                con.close();
                return mapping.findForward("schedule");
            }            
            con.close();
            return mapping.findForward(SUCCESS);
    }
}
