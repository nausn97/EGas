/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class BookingData {
    @XmlElement(name="orderno")
    public String OrderNo;
    @XmlElement(name="message")
    public String Message;
    public BookingData(){
        
    }
    public BookingData(String key){
        Message = key;
    }
    public BookingData(String status,String key){
        OrderNo = key;
        Message = status;
    }
    
}
