/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class AadharAction extends org.apache.struts.action.Action {

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
            HttpSession sess = request.getSession(false);
            String c_id = (String)sess.getAttribute("c_id");
            AadharBean obj = (AadharBean)form;
            String aadhar = obj.getId();
            String aadhar1 = obj.getId1();
            if(aadhar.equals(aadhar1)&& aadhar!=""){
                String q = "select cid,aadharno from aadhar where cid='"+c_id+"'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(q);
                if(!rs.next())
                {
                    String query = "insert into aadhar values(?,?)";
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(1, aadhar);
                    pst.setString(2, c_id);
                    int i = pst.executeUpdate();
                    if(i>0){
                        response.getWriter().print("<label style=\"color:green\">Your aadhar card is Enrolled Successfully</label>");
                    }
                    else{
                        response.getWriter().print("Your aadhar card can not Enrolled");
                    }
                }
                else{
                        response.getWriter().print("<label style=\"color:red\">You Already have enrolled your aadhar card</label>");
                }
                
            } 
            else{
                    response.getWriter().print("<label style=\"color:red\">Aadhar card Number and confirm Aadhar card Number not Matched or you have left blank please check!</label>");
           }
           con.close();           
           return null;                        

        }
}
