
package POJO;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class UpdateData {
    @XmlElement(name="status")
    public String vStatus;
    @XmlElement(name="email")
    public String vEmail;
    @XmlElement(name="phone")
    public String vPhone;
    @XmlElement(name="address")
    public String vAddress;
    
    public UpdateData(){
        
    }
    public UpdateData(String status,String email,String phone,String address){
        vStatus = status;
        vEmail = email;
        vPhone = phone;
        vAddress = address;        
    }
    
    
}
