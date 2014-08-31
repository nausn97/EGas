/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import javax.xml.bind.annotation.XmlElement;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
/**
 *
 * @author verma
 */
public class History {
    @XmlElement(name="status")
    public String vStatus;
    @XmlElement(name="dob")
    public String booking;
    @XmlElement(name="dod")
    public String delivery;
    @XmlElement(name="cyl")
    public String noc;
    @XmlElement(name="msg")
    public String msg;
     @XmlElement(name="error")
    public Boolean error;
    
    
    public History()
    {
        
    }
    
    public History(String a,String b,String c,String d,Boolean e)
    {
        booking=a;
        delivery=b;
        noc=c;
        vStatus=d;
        error=e;
        
    }
    
    public History(String msg1,Boolean e)
    {
        error=e;
        msg=msg1;
    }
}
