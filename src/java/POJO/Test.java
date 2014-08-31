/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 *
 * @author Naushad Ahmad
 */
public class Test {
    public static void main(String[] args) {
        try{
                /*Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=GasPortal","Ahmad","ahmad");
                Statement st = con.createStatement();                
                System.out.println("heldsjl");
                String vFName = "LPU0007C0014";
                String query = "select c.cid,u.fname,u.lname,u.mname,u.email,u.phone,u.house_no,d.distributor_name from consumer as c inner join [dbo].[user] as u on (c.userid = u.userid) inner join distributor as d on(d.id = c.distributorid) where cid='"+vFName+"'";
                ResultSet rs = st.executeQuery(query);
                if(rs.next()){
                    String dist = rs.getString("distributor_name");
                    String cid = rs.getString("cid");
                    String fname = rs.getString("fname");
                    String lname = rs.getString("lname");
                    String mname = rs.getString("mname");                    
                    String Hno = rs.getString("house_no");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");              
                    String name = fname;
                    if(mname!=null){
                        name = name + mname +" " + lname;
                     }
                    else{
                         name = name + lname ;
                    }
                   //return new userData(name,cid,email,phone,dist,Hno);
                    System.out.println(name+" "+email+" "+phone+" "+cid+" "+dist+" "+Hno);
                }
                else{
                    //return new userData("Consumer Id Does'nt Exist");
                }
             */
            
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(formatter.format(new Date()));
            }catch(Exception e){
                //return new userData(e.getMessage());
                System.out.println(e.getMessage());
            }
            
            
    }
    
}
