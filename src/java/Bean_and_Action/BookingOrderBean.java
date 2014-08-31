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
public class BookingOrderBean extends org.apache.struts.action.ActionForm {
    
    //private String bookingdate;
    private String equip;
    private String quantity;
    private String remarks;
    

    /**
     * @return the bookingdate
     */
    /**
     * @return the equip
     */
    public String getEquip() {
        return equip;
    }

    /**
     * @param equip the equip to set
     */
    public void setEquip(String equip) {
        this.equip = equip;
    }

    /**
     * @return the quantity
     */
    public String getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(String quantity) {
        this.quantity = quantity;
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
