/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class AadharData {
    @XmlElement(name="status")
    public String vAadharStatus;
    @XmlElement(name="error")
    public String vErrorMessage;
    
    public AadharData(){
        
    }
    public AadharData (String a, String b){
        vAadharStatus = a;
        vErrorMessage = b;
    }
}
