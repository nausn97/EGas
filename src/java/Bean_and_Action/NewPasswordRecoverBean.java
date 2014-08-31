/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

/**
 *
 * @author Naushad Ahmad
 */
public class NewPasswordRecoverBean extends org.apache.struts.action.ActionForm {
    
    private String newpassword;
    private String confirmnewpassword;

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
