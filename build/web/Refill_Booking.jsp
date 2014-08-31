<!DOCTYPE html>
<html>
    <head>
        <title>Refill Booking</title>        
        <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            
            var xmlHttp;
            function doBooking(value){
         //bdate=document.getElementById("bookingdate").value;
        equip=document.getElementById("equip").value;
        quantity=document.getElementById("quantity").value;
        remarks=document.getElementById("remarks").value;
         if (typeof XMLHttpRequest != "undefined"){
             xmlHttp= new XMLHttpRequest();      }
         else if (window.ActiveXObject){
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
         if (xmlHttp==null){
             alert("Browser does not support XMLHTTP Request")
             return;      }
         var url="order.do";
         url +="?equip="+equip+"&quantity=" +quantity+"&remarks="+remarks;
         xmlHttp.onreadystatechange = doUpdate;
         //alert("Processing....");
         document.getElementById("wait").innerHTML="<div><img src=\"home_imgs/waitarrow.gif\"></img> Please Wait While Processing Your Request ....</div>";
         xmlHttp.open("GET", url, true);
         xmlHttp.send(null);            
     }
     function doUpdate(){
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
             var a=xmlHttp.responseText;
              document.getElementById("wait").innerHTML=a;
              
          }
          
         
     }
        </script>
    
        <%@taglib  uri="http://struts.apache.org/tags-html-el" prefix="p" %>
        
        
        
        <style>
            .Booking{
                
                
                margin-left: 350px;
                width: 900px;
                position: relative;          
                
                
            }
            .Cur-Detail{
                width: 430px;
                background: #269abc;
                padding:10px;
                height: auto;
                position: absolute;
            }
            .Cur-Detail label{
                width: 150px;
                margin-bottom: 10px;
                font-family: tahoma,geneva,sans-serif;
                color:#FFF;
                font-size: 12px;
                font-weight: bold;                
                display: block;
                float: left;
            }
            .Order-Detail{
                width:430px;
                float: right;
                //margin-top: -268px;
                background: #269abc;
                padding: 5px;
                //z-index: -1;
                position: absolute;
                margin-left: 440px;
                
            }
           
            .Cur-Detail input{
                width: 250px;
                margin-bottom: 10px;
                
            }
            .Order-Detail table tr{
                
                height: 40px;
            }
            .Order-Detail table tr td{
                width: 200px;
                padding-right: 20px;
                
                
            }
            
        </style>    
 
        <link type="text/css" href="css/bootstrap.css">        
    </head>
    <body style="z-index: 0;">        
        
    <div class="Booking">
                    <%!Connection con; %>
                    <%!String c_id;%>
                    <%!Statement st; %>
                    <%! ResultSet rs;%>
                    <%@page import="java.sql.*"%>
        <%!String equip,ref,BookingDate,DeliveryDate,status;%>
        <div class="panel panel-primary">
            <div class="panel-heading">
                Book Your Online Refill. Before you Order you can change your Mobile No. and Email to get any further update
            </div>
            <div class="panel-body">
        <div class="Cur-Detail">
        <p:form action="UpdateBookingInfo" method="post">        
            <header style="text-align: center;background: #EE701E;color: white;"><b>Update New Contact Detail/Click Save to Update</b></header>
            <label> Phone No: </label>
            <input type="text" name="land"/>
            <label> Mobile No: </label>
            <input type="text" name="mob" >
            <label> Email: </label>
            <input type="text" name="email">
            <label> Area: </label>
            <input type="text" name="area">
            <label> Remarks: </label>
            
            <textarea rows="4" name="remarks" style="width: 250px;">            </textarea>            
            <input  type="submit" class="btn btn-success" value="Save" style="width: 64%; float: right; margin-top: 18px;"/>
        </p:form>    
        </div>      
        
        <div class="Order-Detail">
            <table  class="form_table" width="99%">       
                <header style="text-align: center;background: #EE701E;color: white;">Refill Booking Selection</header>
       
        
         <tr>
             <td style="color: white">Preferred Deliver</td>
             <td>No</td>
         </tr>
         <tr>
             <td style="color: white">Equipment </td>
             <td style="width: 250px;">
                 <select id="equip" required="true">
                     <option value="">Select your Equipment</option>
             <%
                c_id = (String)session.getAttribute("c_id");
                Connection con = Bean_and_Action.Data.getConnection();
                String q = "select p.name,p.id from product as p inner join Equipment as e on(p.id = e.prodId) where consumerId ='"+c_id+"'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(q);                
                while(rs.next()){
            %>
            <option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
            <%
                }
                rs.close();
                con.close();
             %>            
                                
               </select>                                           
             </td>
         </tr>   
         <tr>
             <td style="color: white">No. of Cyl. Required</td>
             <td><input type="number" id="quantity" min="1" max="2" style="width: 100%"/></td>
         </tr>
         <tr>
             <td style="color: white">Remarks</td>
             <td ><textarea row="5" id="remarks" style="width: 100%"></textarea></td>
         </tr>
         <tr>
             <td></td>
             <td > <input type="submit" onclick="doBooking('Naushad');"value="Book My Order" class="btn btn-success" style="width: 100%;margin-top: 20px;"></td>
         </tr> 
         <tr>
             <td colspan="2" style="margin-left: 50px; width: 20px;height: auto;"><div id='wait' style="color:white"></div></td>
         </tr>
        <!--dss-->     
      </table>          

        </div>
        <style type="text/css">
            .OrderHistory table{
                border: 1px;
                border-spacing: 0px;
                width: 850px;                
                margin-left: auto;
                margin-right: auto
            }
            .OrderHistory table th{
                font-family: tahoma;
                font-weight: normal;
                font-size: 15px;
                border: 1px #E5E5E5 solid;
                background: #269abc;
                text-align: center;
                color: #fff;
            }
             .OrderHistory table td{
                font-family: tahoma;
                font-weight: normal;
                font-size: 12px;
                border: 1px #E5E5E5 solid;
                //background: #E5E5E5;
                color: #000;
                text-align: center;
            }
        </style>
                    <div id="view3" class="OrderHistory" style="margin-top: 350px;">  
                        
                    <table >
                        <tr>
                            <th colspan="7" style="text-align: center;background: #EE701E;color: white;font-weight: bold" >Your Previous Order History</th>
                        </tr>
                        <tr>
                        <th>Sr. No.</th>
                        <th>Equipments</th>
                        <th>Reference No.</th>
                        <th>Order No.</th>
                        <th>Order Date.</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        </tr>
                        <%
                                con = Bean_and_Action.Data.getConnection();
                                c_id = (String)session.getAttribute("c_id");
                                String query = "select p.name,bd.no,bd.dateOfBooking,bd.dateofdelivery,status from Bookingdetail as bd join Product as p on (bd.prodId = p.id) where bd.consumerId='"+c_id+"'";
                                st = con.createStatement();
                                rs = st.executeQuery(query);
                                int i = 0;
                                while(rs.next()){                 
                                equip = rs.getString("name");
                                 ref = rs.getString("no");
                                 BookingDate = rs.getString("dateofbooking");
                                 DeliveryDate = rs.getString("dateofdelivery");
                                 status = rs.getString("status");
                        %>
                                <tr>
                                    <td><%=++i%></td>
                                    <td><%=equip%></td>
                                    <td><%=ref%></td>
                                    <td></td>
                                    <td><%=BookingDate%></td>
                                    <td><%=DeliveryDate%></td>
                                    <td><%=status%></td>                                             
                                </tr>
                        <%
                            }
                            rs.close();
                            con.close();
                           
                        %>
                        
                    </table>
                    <footer style="background: #2ccafd;color: white;margin-top: 50px;font-size: 12px;">Now You can take delivery of your order with SMS. Save paper</footer>
                        
                </div>
            </div>
                        <div class="panel-footer" style="font-size: 10px">
                            <p class="panel-info">This tab contain your current booked order detail . you can get SMS on your mobile to take delivery or you can generate Cash Memo here to save your time in distributor place</p>
                        </div>
        </div>
    </div>
                        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>