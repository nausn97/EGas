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
public class GetConsumerBean extends org.apache.struts.action.ActionForm {
    
    private String dist;

    /**
     * @return the dist
     */
    public String getDist() {
        return dist;
    }

    /**
     * @param dist the dist to set
     */
    public void setDist(String dist) {
        this.dist = dist;
    }
    
    
}
