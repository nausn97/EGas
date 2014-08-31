/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
@XmlRootElement
public class ChangeDistributorData {
    @XmlElement(name="status")
    public String vStatus;
    public ChangeDistributorData(){
        
    }
    public ChangeDistributorData(String status){
        this.vStatus = status;
    }
}
