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
public class AadharBean extends org.apache.struts.action.ActionForm {
    
    private String id;
    private String id1;

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the id1
     */
    public String getId1() {
        return id1;
    }

    /**
     * @param id1 the id1 to set
     */
    public void setId1(String id1) {
        this.id1 = id1;
    }
    
   
}
