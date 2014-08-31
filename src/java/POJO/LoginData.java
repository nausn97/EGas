/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;

@XmlRootElement
public class LoginData {
    @XmlElement(name="status")
    public Boolean vStatus;
    @XmlElement(name="name")
    public String vName;
    @XmlElement(name="cid")
    public String vCID;
    @XmlElement(name="email")
    public String vEmail;
    @XmlElement(name="phone")
    public String vPhone;
    @XmlElement(name="dist")
    public String vDistributor;
    @XmlElement(name="address")
    public String vAddress;
    @XmlElement(name="error")
    public String vError;
    
    public LoginData(Boolean status,String name,String cid,String email,String phone,String dist,String Hno){
        vStatus = status;
        vName = name;
        vCID = cid;
        vEmail = email;
        vPhone = phone;
        vDistributor = dist;
        vAddress = Hno;
    }
    public LoginData(){ }
   /* public LoginData(String errMessage){
        vError = errMessage;
        vName = null;
        vCID = null;
        vDistributor = null;
        vEmail = null;
        vPhone = null;
        vAddress = null;
        
    }*/
    
    
    
}
