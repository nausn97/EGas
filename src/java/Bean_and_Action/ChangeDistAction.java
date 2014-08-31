/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import POJO.ComplainData;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
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
public class ChangeDistAction extends org.apache.struts.action.Action {

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
                String query = "insert into changedist(CID,Dist_Id_old,Dist_ID_New,Remarks,reqDate) values(?,?,?,?,?)";
                ChangeDistBean obj = (ChangeDistBean)form;
                HttpSession sess = request.getSession();
                String cid = (String)sess.getAttribute("c_id");
                String name = (String)sess.getAttribute("name");
                String message = "<html><body>";
                String email = "";
                String oldid = "";
                String Q = "select Distributorid from Consumer where cid='"+cid+"'";
                Statement statement = con.createStatement();
                ResultSet result = statement.executeQuery(Q);
                if(result.next()){
                    oldid = result.getString("distributorid");
                    result.close();
                    statement.close();
                }                
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, cid);
                pst.setString(2, oldid);
                pst.setString(3, obj.getID_NEW());
                pst.setString(4, obj.getRemarks());
                pst.setString(5, getDate());                
                int i = pst.executeUpdate();                
                if(i>0){                                      
                    
                    pst.close();
                    Statement st = con.createStatement();
                    String q = "select email from Distributor where Id="+oldid;
                    ResultSet rs = st.executeQuery(q);
                    if(rs.next()){
                        
                        email = rs.getString("email");
                        rs.close();
                        
                        
                    }
                    String add = "236 P.O Kanwli GMS Road Dehradun 140871";
                    message += "Name : <b>"+name+"</b></br>";
                    message += "Address : <b>"+add+"</b></br>";
                    message += " wants to change distributor because of <b>"+obj.getRemarks()+"</b></br>";
                    message += "so Kindly forward these documents"+"</br>";
                    message += "<ul><li>Duly Signed KYC Form</li>";
                    message += "<li>KYC Form should have your Seal</li>";                    
                    message += "</body></html>";
                    response.getWriter().print("Your Request is Submitted to your distrubutor Check your Mail for Response. Change Distributor process take minimum 2-3 days You will get mail after successfully process done");
                    //new SendMail().sendMail(email, "Request for Distributor Change", "chage My Distributor", message);
                    con.close();
                    return null;
                    
                }             
                response.getWriter().print("something went Wrong please try again or try later");
                con.close();
                return null;
                
    }
    
    public String getDate(){
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String curTime = formatter.format(new Date());
        return curTime;
    }
        
}
