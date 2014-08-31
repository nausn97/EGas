/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Naushad Ahmad
 */
public class MyMessageAction extends org.apache.struts.action.Action {

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
            MyMessageBean obj = (MyMessageBean)form;
            String query = "select * from notification where id="+obj.getMyMsgId();
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
                String vQuery = "update notification set status=1 where id='"+obj.getMyMsgId()+"'";
                Statement st1 = con.createStatement();
                int k = st1.executeUpdate(vQuery);
                if(k>0){
                    response.getWriter().print(rs.getString("message"));
                }
                
                //JOptionPane.showMessageDialog(null, "jjskakasdkasasda");
                con.close();
                return null;
            }
            else{
                response.getWriter().print("Sorry can not retrieve message something went wrong");
                con.close();
                return null;
            }
        
        
    }
}
