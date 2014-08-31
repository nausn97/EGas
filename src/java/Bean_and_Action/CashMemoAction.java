/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import JAVA.Customer;
import JAVA.InvoiceData;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import JAVA.InvoiceDesign;
import JAVA.Item;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import javax.servlet.http.HttpSession;
import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;


/**
 *
 * @author Naushad Ahmad
 */
public class CashMemoAction extends org.apache.struts.action.Action {

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
        CashMemoBean obj = (CashMemoBean)form;
        HttpSession sess = request.getSession();
        String cid = (String)sess.getAttribute("c_id");
        InvoiceDesign.generateCashmemo(obj.getId(),cid);
                        
        return mapping.findForward(SUCCESS);
    }
    
    
        
    
}
