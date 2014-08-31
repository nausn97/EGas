/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author dream big
 */
public class Data {
    public static String Return_Customer[]={"Door Closed","No Money","Customer Not found","Invalid Address","Wrong Address","Cancelled Booking","Empty Cylinder Not available","Wrong/Invalid Booking"};
    public static String Return_Product[]={"Seal Brokedn","Defective Cylinder","CashMemo Missing"};
    public static String Booking_status[]={"Returned","Booked","Transported",""};
    public static String scheduleSlot[]={"10 AM","11 AM","12 PM","1 PM","2 PM","3 PM","4 PM"};
    public static String Equipments[]={"","14.2 KG Non Sub Dom. H/Hod Cylinder","14.2 KG Packed Domestic LPG Cylinder","19 KG Packed Domestic LPG Cylinder","5 KG Packed Non-Domestic LPG Cylinder","5.0 KG Packed Domestic LPG Cylinder","Regulator","Pipes","Stove","Cylinder Trolley"};
        public static final int DRIVINGLICENSE_ID=1;
        public static final int PANCARD_ID=2;
        public static final int AADHAAR_ID=3;
        public static final int PASSPORT_ID=4;
        public static final int RATIONCARD_ID=5;
        public static final int VOTERICARD_ID=6;
        public static final int OTHERID_ID=7;
        public static final int DRIVINGLICENSE_ADD=8;
        public static final int PANCARD_ADD=9;
        public static final int AADHAAR_ADD=10;
        public static final int PASSPORT_ADD=11;
        public static final int RATIONCARD_ADD=12;
        public static final int VOTERICARD_ADD=13;
        public static final int OTHERID_ADD=14;
        
        public static Connection getConnection(){
            Connection con = null;
            try{
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=GasPortal","Ahmad","ahmad");
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
            return con;
        }
    
   
}
