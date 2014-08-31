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
public class ComplainBean extends org.apache.struts.action.ActionForm {
    
    private int type;
    private String naturetype;
    private String mob;
    private String comp;
    
    
    
    

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }

    /**
     * @return the naturetype
     */
    public String getNaturetype() {
        return naturetype;
    }

    /**
     * @param naturetype the naturetype to set
     */
    public void setNaturetype(String naturetype) {
        this.naturetype = naturetype;
    }

    /**
     * @return the mob
     */
    public String getMob() {
        return mob;
    }

    /**
     * @param mob the mob to set
     */
    public void setMob(String mob) {
        this.mob = mob;
    }

    /**
     * @return the comp
     */
    public String getComp() {
        return comp;
    }

    /**
     * @param comp the comp to set
     */
    public void setComp(String comp) {
        this.comp = comp;
    }
}
