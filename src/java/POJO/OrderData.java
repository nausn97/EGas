/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class OrderData {
    @XmlElement(name="status")
    public String[] Orderid;
    @XmlElement(name="error")
    public String vErrorMessage;
    int i = 0;
    public OrderData(){
        
    }
    public OrderData (ArrayList a){
        for(Object data : a){
            Orderid[i] = (String)data;
            i++;
        }
    }
}
