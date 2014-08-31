/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Naushad Ahmad
 */
public class ChangeDistBean extends org.apache.struts.action.ActionForm {
    
    private String ID_OLD;
    private String ID_NEW;
    private String remarks;

    /**
     * @return the ID_OLD
     */
    public String getID_OLD() {
        return ID_OLD;
    }

    /**
     * @param ID_OLD the ID_OLD to set
     */
    public void setID_OLD(String ID_OLD) {
        this.ID_OLD = ID_OLD;
    }

    /**
     * @return the ID_NEW
     */
    public String getID_NEW() {
        return ID_NEW;
    }

    /**
     * @param ID_NEW the ID_NEW to set
     */
    public void setID_NEW(String ID_NEW) {
        this.ID_NEW = ID_NEW;
    }

    /**
     * @return the remarks
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * @param remarks the remarks to set
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    
}
