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
public class UpdateKYCBean extends org.apache.struts.action.ActionForm {
    
    private String salu;
    private String fname;
    private String mname;
    private String lname;
    private String gender;
    private String dob;
    private String fathername;
    private String mothername;
    private String spousename;
    private String hno;
    private String fno;
    private String bno;
    private String sno;
    private String district;
    private String state;
    private String pin;
    private String country;
    private String email;
    private String contact;
    private String landline;
    private String bankname;
    private String branchname;
    private String branchaddress;
    private String ifsc;
    private String account;

    /**
     * @return the salu
     */
    public String getSalu() {
        return salu;
    }

    /**
     * @param salu the salu to set
     */
    public void setSalu(String salu) {
        this.salu = salu;
    }

    /**
     * @return the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     * @param fname the fname to set
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     * @return the mname
     */
    public String getMname() {
        return mname;
    }

    /**
     * @param mname the mname to set
     */
    public void setMname(String mname) {
        this.mname = mname;
    }

    /**
     * @return the lname
     */
    public String getLname() {
        return lname;
    }

    /**
     * @param lname the lname to set
     */
    public void setLname(String lname) {
        this.lname = lname;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the fathername
     */
    public String getFathername() {
        return fathername;
    }

    /**
     * @param fathername the fathername to set
     */
    public void setFathername(String fathername) {
        this.fathername = fathername;
    }

    /**
     * @return the mothername
     */
    public String getMothername() {
        return mothername;
    }

    /**
     * @param mothername the mothername to set
     */
    public void setMothername(String mothername) {
        this.mothername = mothername;
    }

    /**
     * @return the spousename
     */
    public String getSpousename() {
        return spousename;
    }

    /**
     * @param spousename the spousename to set
     */
    public void setSpousename(String spousename) {
        this.spousename = spousename;
    }

    /**
     * @return the hno
     */
    public String getHno() {
        return hno;
    }

    /**
     * @param hno the hno to set
     */
    public void setHno(String hno) {
        this.hno = hno;
    }

    /**
     * @return the fno
     */
    public String getFno() {
        return fno;
    }

    /**
     * @param fno the fno to set
     */
    public void setFno(String fno) {
        this.fno = fno;
    }

    /**
     * @return the bno
     */
    public String getBno() {
        return bno;
    }

    /**
     * @param bno the bno to set
     */
    public void setBno(String bno) {
        this.bno = bno;
    }

    /**
     * @return the sno
     */
    public String getSno() {
        return sno;
    }

    /**
     * @param sno the sno to set
     */
    public void setSno(String sno) {
        this.sno = sno;
    }

    /**
     * @return the district
     */
    public String getDistrict() {
        return district;
    }

    /**
     * @param district the district to set
     */
    public void setDistrict(String district) {
        this.district = district;
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
     * @return the contact
     */
    public String getContact() {
        return contact;
    }

    /**
     * @param contact the contact to set
     */
    public void setContact(String contact) {
        this.contact = contact;
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
     * @return the bankname
     */
    public String getBankname() {
        return bankname;
    }

    /**
     * @param bankname the bankname to set
     */
    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

    /**
     * @return the branchname
     */
    public String getBranchname() {
        return branchname;
    }

    /**
     * @param branchname the branchname to set
     */
    public void setBranchname(String branchname) {
        this.branchname = branchname;
    }

    /**
     * @return the branchaddress
     */
    public String getBranchaddress() {
        return branchaddress;
    }

    /**
     * @param branchaddress the branchaddress to set
     */
    public void setBranchaddress(String branchaddress) {
        this.branchaddress = branchaddress;
    }

    /**
     * @return the ifsc
     */
    public String getIfsc() {
        return ifsc;
    }

    /**
     * @param ifsc the ifsc to set
     */
    public void setIfsc(String ifsc) {
        this.ifsc = ifsc;
    }

    /**
     * @return the account
     */
    public String getAccount() {
        return account;
    }

    /**
     * @param account the account to set
     */
    public void setAccount(String account) {
        this.account = account;
    }
    

    
}
