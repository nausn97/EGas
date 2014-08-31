/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class Update {
    @XmlElement(name="status")
    public String vStatus;
    @XmlElement(name="email")
    public String vEmail;
    @XmlElement(name="phone")
    public String vPhone;
    @XmlElement(name="address")
    public String vAddress;
    
    public Update(){
        
    }
    public Update(String status,String email,String phone,String address){
        vStatus = status;
        vEmail = email;
        vPhone = phone;
        vAddress = address;        
    }
    public Update(String message){
        vStatus = message;
        
    }
    
}
