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
public class FinalMyAppointmentBean extends org.apache.struts.action.ActionForm {
    
    private String appoint;
    private String date;
    private int ref;

    /**
     * @return the appoint
     */
    public String getAppoint() {
        return appoint;
    }

    /**
     * @param appoint the appoint to set
     */
    public void setAppoint(String appoint) {
        this.appoint = appoint;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the ref
     */
    public int getRef() {
        return ref;
    }

    /**
     * @param ref the ref to set
     */
    public void setRef(int ref) {
        this.ref = ref;
    }

    /**
     * @return the ref
     */
    
   
}
