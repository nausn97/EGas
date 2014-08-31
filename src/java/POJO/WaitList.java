/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class WaitList {
    @XmlElement(name="status")
    public String vStatus;
    public WaitList(){
        
    }
    public WaitList(String status)
    {
        vStatus = status;
    }
    
}
