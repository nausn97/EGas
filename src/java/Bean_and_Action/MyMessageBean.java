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
public class MyMessageBean extends org.apache.struts.action.ActionForm {
    
    private String myMsgId;

    /**
     * @return the myMsgId
     */
    public String getMyMsgId() {
        return myMsgId;
    }

    /**
     * @param myMsgId the myMsgId to set
     */
    public void setMyMsgId(String myMsgId) {
        this.myMsgId = myMsgId;
    }
    
    
}
