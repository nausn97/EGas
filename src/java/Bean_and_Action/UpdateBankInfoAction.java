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
public class UpdateBankInfoAction extends org.apache.struts.action.Action {

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
            UpdateBankInfoBean obj = (UpdateBankInfoBean)form;
             Connection con = Data.getConnection();
             String query = "update [dbo].[user] set bank_name='"+obj.getBankname()+
                     "',branch_name='"+obj.getBranchname()+"',branch_add='"+obj.getBranchaddress()+
                     "',ifsc='"+obj.getIfsc()+"',account_no='"+obj.getAccount()+"'";
             Statement st = con.createStatement();
             int i = st.executeUpdate(query);
             if(i>0){
                 return mapping.findForward("bankinfo");
             }     
            return mapping.findForward(SUCCESS);
    }
}
