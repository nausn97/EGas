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
public class UpdateBankInfoBean extends org.apache.struts.action.ActionForm {
    
    private String bankname;
    private String branchname;
    private String branchaddress;
    private String ifsc;
    private String account;

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
