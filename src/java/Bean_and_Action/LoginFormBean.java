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
public class LoginFormBean extends org.apache.struts.action.ActionForm {
    
    private String uid;    
    private String pwd; 
    private String UserType;
    private String Type;
    
    public String getUid() {
        return uid;
    }    
    public void setUid(String uid) {
        this.uid = uid;
    }    
    public String getPwd() {
        return pwd;
    }    
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    /**
     * @return the UserType
     */
    public String getUserType() {
        return UserType;
    }

    /**
     * @param UserType the UserType to set
     */
    public void setUserType(String UserType) {
        this.UserType = UserType;
    }

    /**
     * @return the Type
     */
    public String getType() {
        return Type;
    }

    /**
     * @param Type the Type to set
     */
    public void setType(String Type) {
        this.Type = Type;
    }
}
