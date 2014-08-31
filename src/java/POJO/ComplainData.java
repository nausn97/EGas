/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class ComplainData {
    @XmlElement(name="refid")
    String complainNumber;
    @XmlElement(name="status")
    String vStatus;
    public ComplainData(){}
    public ComplainData(String status,String key){
        complainNumber = key;
        vStatus = status;
    }
    
}
