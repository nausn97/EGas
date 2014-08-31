/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class RecoverData {
    @XmlElement(name="status")
    public String vStatus;
    public RecoverData(){
        
    }
    public RecoverData(String status){
        vStatus = status;
    }
            
}
