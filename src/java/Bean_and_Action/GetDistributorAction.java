/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Naushad Ahmad
 */
public class GetDistributorAction extends org.apache.struts.action.Action {

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
            GetDistributorBean obj = (GetDistributorBean)form;
            String buffer = "<select name=\"Dist\" onchange=\"javascript:getConsumers(this.value)\">";
            buffer += "<option value=\"\" >Select Your Distributor</option>";
            String query = "select Distributor_name from Distributor where city='"+obj.getCity()+"'";
            
            Connection con = Data.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while(rs.next()){
                buffer += "<option value=\""+rs.getString(1)+"\" >"+rs.getString(1)+"</option>";
            }
            buffer += "</select>";
            response.getWriter().print(buffer);
            con.close();
            return null;
    }
}
