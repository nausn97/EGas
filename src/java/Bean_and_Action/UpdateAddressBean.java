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
public class UpdateAddressBean extends org.apache.struts.action.ActionForm {
    
   private String HNo;
   private String FNo;
   private String BNo;
   private String SNo;
   private String landmark;
   private String city;
   private String state;
   private String country;
   private String pin;
   private String mob;
   private String email;
   private String landline;

    /**
     * @return the H_No
     */
    
    /**
     * @return the landmark
     */
    public String getLandmark() {
        return landmark;
    }

    /**
     * @param landmark the landmark to set
     */
    public void setLandmark(String landmark) {
        this.landmark = landmark;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return the pin
     */
    public String getPin() {
        return pin;
    }

    /**
     * @param pin the pin to set
     */
    public void setPin(String pin) {
        this.pin = pin;
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
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the landline
     */
    public String getLandline() {
        return landline;
    }

    /**
     * @param landline the landline to set
     */
    public void setLandline(String landline) {
        this.landline = landline;
    }

    /**
     * @return the HNo
     */
    public String getHNo() {
        return HNo;
    }

    /**
     * @param HNo the HNo to set
     */
    public void setHNo(String HNo) {
        this.HNo = HNo;
    }

    /**
     * @return the FNo
     */
    public String getFNo() {
        return FNo;
    }

    /**
     * @param FNo the FNo to set
     */
    public void setFNo(String FNo) {
        this.FNo = FNo;
    }

    /**
     * @return the BNo
     */
    public String getBNo() {
        return BNo;
    }

    /**
     * @param BNo the BNo to set
     */
    public void setBNo(String BNo) {
        this.BNo = BNo;
    }

    /**
     * @return the SNo
     */
    public String getSNo() {
        return SNo;
    }

    /**
     * @param SNo the SNo to set
     */
    public void setSNo(String SNo) {
        this.SNo = SNo;
    }
}
