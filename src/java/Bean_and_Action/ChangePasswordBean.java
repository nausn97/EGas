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
public class ChangePasswordBean extends org.apache.struts.action.ActionForm {
    
    private String oldpassword;
    private String newpassword;
    private String confirmnewpassword;

    /**
     * @return the oldpassword
     */
    public String getOldpassword() {
        return oldpassword;
    }

    /**
     * @param oldpassword the oldpassword to set
     */
    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword;
    }

    /**
     * @return the newpassword
     */
    public String getNewpassword() {
        return newpassword;
    }

    /**
     * @param newpassword the newpassword to set
     */
    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }

    /**
     * @return the confirmnewpassword
     */
    public String getConfirmnewpassword() {
        return confirmnewpassword;
    }

    /**
     * @param confirmnewpassword the confirmnewpassword to set
     */
    public void setConfirmnewpassword(String confirmnewpassword) {
        this.confirmnewpassword = confirmnewpassword;
    }
    
}
