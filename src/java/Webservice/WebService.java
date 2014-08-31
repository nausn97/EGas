package Webservice;
import Bean_and_Action.Data;
import Bean_and_Action.DateFunction;
import Bean_and_Action.SendMail;
import Bean_and_Action.SignUpFormAction;
import POJO.AadharData;
import POJO.BookingData;
import POJO.CancelData;
import POJO.ChangeDistributorData;
import POJO.ComplainData;
import POJO.History;
import POJO.LoginData;
import POJO.OrderData;
import POJO.RecoverData;
import POJO.Update;
import POJO.UpdateData;
import POJO.WaitList;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


@Path("")
public class WebService {     
    
    
    @GET
    @Path("recovery/{vUsername}/{vEmail}")
    @Produces(MediaType.APPLICATION_JSON)
    public RecoverData RecoverPassword(@PathParam("vUsername") String cid,@PathParam("vEmail") String email){
        Connection con;    
        try{
                con = Data.getConnection();
                String query = "select cid,email from [dbo].[user] as u inner join consumer as c on (c.userid = u.userid) where c.cid='"+cid+"' and u.email='"+email+"'";
                Statement s = con.createStatement();                
                ResultSet rs = s.executeQuery(query);                
                if(rs.next())
                {           
                    String message = "<html><body>";
                    message += "<a href=\"\">Click Here To Reset Your Password</a>";
                    final String mailId = email;
                    final String msg = message;
                    new Thread(new Runnable(){

                    @Override
                    public void run() {
                        try {
                            new SendMail().sendMail(mailId, "Password Recovery", "Forgot Password", msg);
                        } catch (MessagingException ex) {
                            Logger.getLogger(SignUpFormAction.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }).start();
                               
                    
                    return new RecoverData("1");
                    
                }             
                
            }catch(Exception e){
                return new RecoverData(e.getMessage());
            }
            return new RecoverData("-1");
    }
    
    @GET
    @Path("updateprofile/{vUsername}/{vEmail}/{vContact}/{vAddress}")
    @Produces(MediaType.APPLICATION_JSON)
    public UpdateData profile(@PathParam("vUsername") String cid,@PathParam("vEmail") String email,@PathParam("vContact") String contact,@PathParam("vAddress") String address){
        Connection con;    
        try{
                
            con = Data.getConnection();
            String query = "update [dbo].[user] set email='"+email+"',phone='"+contact+"',house_no='"+address+"' from consumer as c inner join [dbo].[user] as u on (c.userid = u.userid) where cid='"+cid+"'";
            Statement s = con.createStatement();
            int i = s.executeUpdate(query);
            if(i>0){
                String em = email;
                String phone = contact;
                String Address = address;
                return new UpdateData("success",em,phone,Address);
                
            }
        
            return new UpdateData("-1","","","");
    }catch(Exception e){
        return new UpdateData(e.getMessage(),"","","");
    }
    }

    @GET
    @Path("waitlist/{vOrderId}")
    @Produces(MediaType.APPLICATION_JSON)
    public WaitList checkWaitList(@PathParam("vOrderId") String id){         
        try{
        int orderid = Integer.parseInt(id);
        
              CallableStatement st=Data.getConnection().prepareCall("{?=call Bookingwaitingstatus(?) };");
              st.registerOutParameter(1, Types.INTEGER);
              st.setInt(2, orderid);
              st.execute();
              int wl=-10;
              wl=st.getInt(1);
              String msg="";
              if(wl==-1)
              {
                  
                  return new WaitList("-1");
                  
              }
              else if(wl==0){
                 
                 return new WaitList("0");
                 
              }
              else if(wl>0)
              {
                  return new WaitList(""+wl);
                 
              }
              
              
        
            }catch(Exception e){
                return new WaitList(e.getMessage());
            }
            return new WaitList("-1");
    }  
    
    
        
    @GET
    @Path("login/{vUsername}/{vPassword}")
    @Produces(MediaType.APPLICATION_JSON)
    public LoginData loginUser(@PathParam("vUsername") String vUsername,@PathParam("vPassword") String vPassword) {
        Connection con = null;
        try{
            con = Data.getConnection();
            Statement st = con.createStatement();
            String query = "select * from consumer where cid='"+vUsername+"'";                
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
                if(Bean_and_Action.SecuredPassword.validatePassword(vPassword, rs.getString("password")))
                {   
                    String q = "select u.userid,u.fname,u.mname,u.lname,u.email,u.phone,u.house_no,d.distributor_name from consumer as c inner join [dbo].[user] as u on (c.userid = u.userid) inner join distributor as d on(d.id = c.distributorid) where cid='"+vUsername+"'";
                    Statement st2 = con.createStatement();
                    ResultSet rs2 = st2.executeQuery(q);
                    if(rs2.next()){
                        String userid = rs2.getString("userid");
                        String fname = rs2.getString("fname");
                        String mname = rs2.getString("mname");
                        String lname = rs2.getString("lname");
                        String email = rs2.getString("email");
                        String phone = rs2.getString("phone");
                        String Address = rs2.getString("house_no");
                        String dist = rs2.getString("distributor_name");
                        String name = fname;
                        if(mname!=null)
                        {
                            name += mname+lname;
                        }
                        else{
                            name += lname;
                        }
                        con.close();
                        return new LoginData(true,name,userid,email,phone,dist,Address);
                    }
                    
                }
                
            }                
        }catch(Exception e){
            return new LoginData(false,"","","","","","");
        }
    
        return new LoginData(false,"","","","","","");
    }
    
    
    
    @GET
    @Path("booking/{vUsername}/{vEquipment}/{vQuantity}/{vRemarks}")
    @Produces(MediaType.APPLICATION_JSON)
    public BookingData Booking(@PathParam("vUsername") String vUsername,@PathParam("vEquipment") String vEquipment,@PathParam("vQuantity") String vQuantity,@PathParam("vRemarks") String vRemarks) {
        
        
        try{
            Connection con = null;
            String key = null,email = null;
            con = Data.getConnection();
            DateFormat d = new SimpleDateFormat("yyyy-MM-dd");
            String vdate = d.format(new Date());
            String vQuery = "select *  from bookingdetail  where consumerid='"+vUsername+"' and status ='booked' order by dateofbooking desc";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(vQuery);
            Date dat1 = null;
            if(rs.next()){
                st.close();
                rs.close();                
                return new BookingData("-1");                
            }
            
            else {  
                vQuery = "select *  from bookingdetail  where consumerid='"+vUsername+"' and status ='Delivered' order by dateofbooking desc";
                st = con.createStatement();
                rs = st.executeQuery(vQuery);
                if(rs.next()){
                    dat1 = d.parse(rs.getString("dateofdelivery"));                
                    Date dat2 = d.parse(vdate);
                    long n = DateFunction.getDateDiff(dat1, dat2, TimeUnit.DAYS);
                    if(n<30){
                        st.close();
                        rs.close();
                        return new BookingData("0");
                    }
                }
                
            } 
            
            String query = "insert into Bookingdetail(status,consumerid,NoofCyl,prodid,remark) values (?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, "Booked");
            pst.setString(2, vUsername);
            //pst.setString(3,vdate );
            pst.setString(3, vQuantity);
            pst.setString(4, vEquipment);
            pst.setString(5, vRemarks);
            int i = pst.executeUpdate();
            ResultSet rs1 = pst.getGeneratedKeys();                                    
            email="naushad_97@outlook.com";            
                if(rs1.next()){
                    key = rs1.getString(1);                        
                    String message = "<html><body style=\"text-align:center\">";                
                    message += "Your order for following services has been submitted to your distributor";
                    //message += dist;
                    message += "<br/>Your Lovely Gas Seva  Reference No. : "+key;
                    message += "<br/>Equipment : "+Data.Equipments[Integer.parseInt(vEquipment)];
                    message += "<br/>Quantity : "+vQuantity;
                    message += "<br/>Booking Date : "+"2014-05-05";
                    message += "<br/>Your Consumer No : "+vUsername;                
                    message += "</body></html>";
                    //new Bean_and_Action.SendMail().sendMail(email,"Lovely Gas Seva","Hello",message);                           
                    con.close();
                    return new BookingData("success",key);
                }
          
        }catch(Exception e){
            return new BookingData(e.getMessage(),null);
        }
    
        return new BookingData("fail",null);
    }
    
    
    @GET
    @Path("cancel/{vOrderId}")
    @Produces(MediaType.APPLICATION_JSON)
    public CancelData cancelOrder(@PathParam("vOrderId") String vOrderId ){
        Connection con = null;
        try{
            con = Data.getConnection();
            String query = "update bookingdetail set status='Cancelled' where no='"+vOrderId+"'";
            Statement st = con.createStatement();
            int i = st.executeUpdate(query);                        
            if(i>0){
                
                con.close();
                return new CancelData("success","Your Order with reference No : "+vOrderId+" has been Cancelled Successfully");
            }
        }catch(Exception e){
            return new CancelData("fail",e.getMessage());
        }
    
        return new CancelData("fail","Failed Because of Network Issue!");
    }
    
    
     @GET
    @Path("myaadhar/{vUsername}/{vAadhar}")
    @Produces(MediaType.APPLICATION_JSON)
    public AadharData linkAadhar(@PathParam("vAadhar") String vAadhar,@PathParam("vUsername") String vUsername ){
        Connection con = null;
        try{
            con = Data.getConnection();
            String query = "insert into aadhar values(?,?)";            
            if(vAadhar!=""){
                String q = "select cid,aadharno from aadhar where cid='"+vUsername+"'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(q);
                if(!rs.next())
                {
                    query = "insert into aadhar values(?,?)";
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(2, vAadhar);
                    pst.setString(1, vUsername);
                    int i = pst.executeUpdate();
                    if(i>0){
                        con.close();
                        return new AadharData("1","Congratulation Your Aadhar card is now Enrolled");
                    }
                    
                }
                else{
                        con.close();
                       return new AadharData("-1","Already Linked Your Aadhar");
                }
                
            } 
            else{
                return new AadharData("0", "Cannot left Blank");
           }
        }catch(Exception e){
                return new AadharData("Error", e.getMessage());
        }
           return null;
  }
    @GET
    @Path("getOrderId/{vUsername}")
    @Produces(MediaType.APPLICATION_JSON)
    public OrderData getOrderId(@PathParam("vOrderId") String vOrderId,@PathParam("vUsername") String vUsername ){
        Connection con = null;
        int i = 0;
        ArrayList orderid = new ArrayList();
        try{
            con = Data.getConnection();
            String query = "select no from bookingdetail where consumerid="+vUsername+" and status='Booked'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);            
            while(rs.next()){
                orderid.add(rs.getString(1));
                
            }
            return new OrderData(orderid);
        }catch(Exception e){
            
            
        }
    
        //return new OrderData("fail","No Available Order");
        return new OrderData();
    }
    
    @GET
    @Path("complain/{vUsername}/{vType}/{vNature}/{vMob}/{vComp}")
    @Produces(MediaType.APPLICATION_JSON)
    public ComplainData logComplain(@PathParam("vUsername") String vUsername,@PathParam("vType") String vType,@PathParam("vNature") String vNature,@PathParam("vComp")String vComp,@PathParam("vMob") String vMob ){
        Connection con;    
        try{
                con = Data.getConnection();
                String query = "insert into complain(complaintype,Complainnature,status,complaindate,consumerid,description) values(?,?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
                pst.setString(1, vType);
                pst.setString(2, vNature);
                pst.setString(3, "Booked");
                pst.setString(4, getDate());
                pst.setString(5, vUsername);
                pst.setString(6, vComp);

                int i = pst.executeUpdate();
                ResultSet rs = pst.getGeneratedKeys();
                if(rs.next()){                  
                    
                    return new ComplainData("success",rs.getString(1));
                    //sess.setAttribute("compId", rs.getString(1));
                }             
                
            }catch(Exception e){
                return new ComplainData("fail",e.getMessage());
            }
            return new ComplainData("fail","null");
    }
    
    
    
    @GET
    @Path("changeDistributor/{vUsername}/{vOldId}/{vNewId}/{vRemarks}")
    @Produces(MediaType.APPLICATION_JSON)
    public ChangeDistributorData changeDistributor(@PathParam("vUsername") String vUsername,@PathParam("vOldId") String vOldId,@PathParam("vNewId") String vNewId,@PathParam("vRemarks")String vRemarks ){
        Connection con;    
        try{
                con = Data.getConnection();
                String query = "insert into changedist(CID,Dist_Id_old,Dist_ID_New,Remarks,reqDate) values(?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, vUsername);
                pst.setString(2, vOldId);
                pst.setString(3, vNewId);
                pst.setString(4, vRemarks);
                pst.setString(5, getDate());                
                int i = pst.executeUpdate();                
                if(i>0){                  
                    
                    return new ChangeDistributorData("success");
                    //sess.setAttribute("compId", rs.getString(1));
                }             
                
            }catch(Exception e){
                return new ChangeDistributorData(e.getMessage());
            }
            return new ChangeDistributorData("fail");
    }
    
    public String getDate(){
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String curDate = formatter.format(new Date());
        return curDate;
        
    }
    
    
    @GET
    @Path("history/{consumer}")
    @Produces(MediaType.APPLICATION_JSON)
    public History history(@PathParam("consumer") String consumer){
        Connection con;    
        try{
                con = Data.getConnection();
                String query = "select dateofbooking,dateofdelivery,noofcyl,status from bookingdetail where consumerid='"+consumer+"' order by dateofbooking desc";
                Statement s = con.createStatement();
                
                ResultSet rs = s.executeQuery(query);
                Boolean error;
                if(rs.next())
                {
                    
                    String dob=rs.getString("dateofbooking");
                    String dod=rs.getString("dateofdelivery");
                    String noc=rs.getString("noofcyl");
                    String status=rs.getString("status");
               
                                
                    
                    return new History(dob,dod,noc,status,true);
                    //sess.setAttribute("compId", rs.getString(1));
                }             
                
            }catch(Exception e){
                return new History(e.getMessage(),false);
            }
            return new History("fail",false);
    }


}
    

                 

 