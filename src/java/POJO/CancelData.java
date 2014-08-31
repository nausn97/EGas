/*

 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;


import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
@XmlRootElement
public class CancelData {
    @XmlElement(name="status")
    public String vStatus;
    @XmlElement(name="message")
    public String vMessage;
    public CancelData(){
        
    }
    public CancelData(String a,String b){
        vStatus = a;
        vMessage = b;
    }
    public CancelData(String a){
        vStatus = a;
    }
    
}
