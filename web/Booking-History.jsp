<html>
    <head>
        <style>
              .CurOrder{
                font-family: tahoma,sans-serif;
                font-size: 14px;
                line-height: 20px;
                text-align: center;
            }      
             .tabs table{
                border: 1px;
                border-spacing: 0px;
                width: 850px;
                margin-top: -25px;
                margin-left: auto;
                margin-right: auto;
                
            }
             .tabs table th{
                font-family: tahoma;
                font-weight: normal;
                font-size: 15px;
                border: 1px #E5E5E5 solid;
                background: #269abc;
                text-align: center;
                color: #fff;
            }
             .tabs table td{
                font-family: tahoma;
                font-weight: normal;
                font-size: 12px;
                border: 1px #E5E5E5 solid;
                //background: #E5E5E5;
                color: #000;
                text-align: center;
            }
        </style>
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>
        <link href="css/generic-notForMcTabs.css" rel="stylesheet" type="text/css" />
        <link href="css/mctabs.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <script src="js/javascript-tabs.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/ext.js">  </script>
        <%
            HttpSession sess = request.getSession(false);
            String mob = (String)sess.getAttribute("mob");
        %>
        <script type="text/javascript">
            function setTextField(){                
                document.getElementById("wait").innerHTML="Your Current No. <input type=\"text\" id=\"mob\" value=<%=mob%> style=\"position:relative;\"> &nbsp;<input type=\"submit\" value=\"Get SMS\" onclick=\"javasrcipt:sendSMS()\" style=\"position: absolute;\"/>";
                
            }
            
        </script>
        
        <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function sendSMS(){
                
                mob=document.getElementById("mob").value;                
                
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      
            }           
            var url="sendsms.do";
            url +="?mobile="+mob;           
            xmlHttp.onreadystatechange = doUpdate;
            //alert("Processing....");
            document.getElementById("wait2").innerHTML="<div><img src=\"home_imgs/wait.gif\"></img></div>";
            xmlHttp.open("GET", url);
            //alert("Checking....");
            xmlHttp.send(null);
            //alert("waiting....");
            }      
     function doUpdate(){
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
             var a=xmlHttp.responseText;
             alert(a);
              document.getElementById("wait2").innerHTML=a;              
          }
          
         
     }
        </script>
        
    <script type="text/javascript">
            function getCashMemo(id){
                          alert(id);      
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      
            }           
            var url="cashmemo.do";
            url +="?id="+id;           
            xmlHttp.onreadystatechange = doUpdate;
            //alert("Processing....");
            document.getElementById("wait2").innerHTML="<div><img src=\"home_imgs/waitarrow.gif\"></img> Please Wait While Processing ...</div>";
            xmlHttp.open("GET", url);
            //alert("Checking....");
            xmlHttp.send(null);
            //alert("waiting....");
            }      
     function doUpdate(){
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
             var a=xmlHttp.responseText;
            // alert(a);
              document.getElementById("wait2").innerHTML="";              
          }
          
         
     }
        </script>
        
        <%@page import="java.sql.*"%>
    </head>
                    <%!Connection con; %>
                    <%!String c_id;%>
                    <%!Statement st; %>
                    <%! ResultSet rs;%>
                    <%!String equip,ref,BookingDate,DeliveryDate,status,id;%>
    <body style="margin-left: 5%; position: relative;">        
        <div style="margin-left: 250px;" class="tabs">
            <div class="panel panel-primary" style="margin-left: 100px;width: 900px;">
                <div class="panel-heading">
                    Now You Can Check Your Previous  Order History 
                </div>
            </div>
         <div id="demopage">
        <div class="container1">
            <ul id="tabs1" class="mctabs">
                <li><a href="#view1">Current Order.</a></li>
                <li><a href="#view2">Pending Order</a></li>
                <li><a href="#view3">Order History</a></li>
                <li><a href="#view4">Last Transaction</a></li>
                <li><a href="#view5">Cancelled Transaction</a></li>
                
            </ul>
            <div class="panel-container">
                <div id="view1" class="CurOrder">        
                    
                    
    <div>        
        <table>
                        <th>Sr. No.</th>
                        <th>Equipments</th>
                        <th>Reference No.</th>
                        <th>Order No.</th>
                        <th>Order Date.</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        <th>SMS</th>
                        <th>Cash Memo</th>
        <%
             
             con = Bean_and_Action.Data.getConnection();
             c_id = (String)session.getAttribute("c_id");
             String query = "select p.name,bd.no,bd.dateOfBooking,bd.status,p.id from Bookingdetail as bd join Product as p on (bd.prodId = p.id) where bd.consumerId='"+c_id+"' and bd.status='Booked'";
             st = con.createStatement();
             rs = st.executeQuery(query);
             int i = 0;
             while(rs.next()){
                 
                 equip = rs.getString("name");
                 ref = rs.getString("no");
                 BookingDate = rs.getString("dateofbooking");
                 status = rs.getString("status");
                 id = rs.getString("id");
             %>                       
             <tr>
                 <td><%=++i%></td>
                 <td><%=equip%></td>
                 <td><%=ref%></td>
                 <td></td>
                 <td><%=BookingDate%></td>
                 <td></td>
                 <td><%=status%></td>             
                 <td ><a href="#" onclick="javascript:setTextField();"><img src="images/icon_text.png" style="position: relative"></a></td>             
                 <td style="position: relative;"> <input type="submit" name="<%=id%>" value="Cash Memo" onclick="javascript:getCashMemo(<%=ref%>)"></td>             
             </tr>
             
             
        <%
                 
             }
             rs.close();
             con.close();
        %>
        </table>         
        <div id="wait" style="margin-top: 20px;"></div>
        <div id="wait2" style="margin-top: 20px;"></div>
        <footer style="background: #2ccafd;color: white;margin-top: 50px;font-size: 12px;">Now You can take delivery of your order with SMS. Save paper</footer>
        <div class="panel-footer" style="font-size: 10px">
            <p class="panel-info">This tab contain your current booked order detail . you can get SMS on your mobile to take delivery or you can generate Cash Memo here to save your time in distributor place</p>
        </div>
    </div>
   </div>                
                <div id="view2" class="pendingOrder">                    
                    <table >
                        <th>Sr. No.</th>
                        <th>Equipments</th>
                        <th>Reference No.</th>
                        <th>Order No.</th>
                        <th>Order Date.</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        <%
             con = Bean_and_Action.Data.getConnection();
             c_id = (String)session.getAttribute("c_id");
             query = "select p.name,bd.no,bd.dateOfBooking,bd.status from Bookingdetail as bd join Product as p on (bd.prodId = p.id) where bd.consumerId='"+c_id+"' and bd.status='Booked'";
             st = con.createStatement();
             rs = st.executeQuery(query);
             i = 0;
             while(rs.next()){
                 
                 equip = rs.getString(1);
                 ref = rs.getString(2);
                 BookingDate = rs.getString("dateofbooking");
                 status = rs.getString(4);
             %>                       
             <tr>
                 <td><%=++i%></td>
                 <td><%=equip%></td>
                 <td><%=ref%></td>
                 <td></td>
                 <td><%=BookingDate%></td>
                 <td></td>
                 <td><%=status%></td>                              
             </tr>
             
        <%
                 
             }
             rs.close();
             con.close();
        %>
                        
                    </table>
                    <footer style="background: #2ccafd;color: white;margin-top: 50px;font-size: 12px;">Now You can take delivery of your order with SMS. Save paper</footer>
                    <div class="panel-footer" style="font-size: 10px">
                         <p class="panel-info">This tab contain your Pending Order detail . you can get SMS on your mobile to take delivery or you can generate Cash Memo here to save your time in distributor place</p>
                    </div>
                </div>               
                <div id="view3" class="OrderHistory">  
                    <table >
                        <th>Sr. No.</th>
                        <th>Equipments</th>
                        <th>Reference No.</th>
                        <th>Order No.</th>
                        <th>Order Date.</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        <%
                                con = Bean_and_Action.Data.getConnection();
                                c_id = (String)session.getAttribute("c_id");
                                query = "select p.name,bd.no,bd.dateOfBooking,bd.dateofdelivery,status from Bookingdetail as bd join Product as p on (bd.prodId = p.id) where bd.consumerId='"+c_id+"'";
                                st = con.createStatement();
                                rs = st.executeQuery(query);
                                i = 0;
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
                        <div class="panel-footer" style="font-size: 10px">
                            <p class="panel-info">This tab contain your current booked order detail . you can get SMS on your mobile to take delivery or you can generate Cash Memo here to save your time in distributor place</p>
                        </div>
                </div><!-- view 3 div-->
                 <div id="view4">            
                      <table >
                        <th>Sr. No.</th>
                        <th>Equipments</th>
                        <th>Reference No.</th>
                        <th>Order No.</th>
                        <th>Order Date.</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        <tr>
                            <td>1</td>
                            <td>R122121212776673993</td>
                            <td>B76727679</td>
                            <td>20-03-2014</td>
                            <td></td>
                            <td>Under Processing</td>
                        </tr>
                        
                    </table>
                     <footer style="background: #2ccafd;color: white;margin-top: 50px;font-size: 12px;">Now You can take delivery of your order with SMS. Save paper</footer>
                    <div class="panel-footer" style="font-size: 10px">
                            <p class="panel-info">This tab contain your current booked order detail . you can get SMS on your mobile to take delivery or you can generate Cash Memo here to save your time in distributor place</p>
                    </div>
                </div>
                 <div id="view5">                     
                      <table >
                        <th>Sr. No.</th>
                        <th>Equipment</th>
                        <th>Reference No.</th>
                        <th>Order No.</th>
                        <th>Order Date.</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        <%
             
             con = Bean_and_Action.Data.getConnection();
             c_id = (String)session.getAttribute("c_id");
             query = "select p.name,bd.no,bd.dateOfBooking,bd.status,p.id from Bookingdetail as bd join Product as p on (bd.prodId = p.id) where bd.consumerId='"+c_id+"' and bd.status='Cancelled'";
             st = con.createStatement();
             rs = st.executeQuery(query);
              i = 0;
             while(rs.next()){
                 
                 equip = rs.getString("name");
                 ref = rs.getString("no");
                 BookingDate = rs.getString("dateofbooking");
                 status = rs.getString("status");
                 id = rs.getString("id");
             %>                       
             <tr>
                 <td><%=++i%></td>
                 <td><%=equip%></td>
                 <td><%=ref%></td>
                 <td></td>
                 <td><%=BookingDate%></td>
                 <td></td>
                 <td><%=status%></td>             
                 
             </tr>
             
             
        <%
                 
             }
             rs.close();
             con.close();
        %>
                        
                    </table>
                     <footer style="background: #2ccafd;color: white;margin-top: 50px;font-size: 12px;">Now You can take delivery of your order with SMS. Save paper</footer>
                    <div class="panel-footer" style="font-size: 10px">
                        <p class="panel-info">This tab contain your current booked order detail . you can get SMS on your mobile to take delivery or you can generate Cash Memo here to save your time in distributor place</p>
                    </div>
                </div>
     </div>  <!-- Panel Container div -->
    </div> 
         </div>
    </div>
                        <div style="margin-top: 110px">
                            <jsp:include page="Footer.jsp"></jsp:include>
                        </div>
                        
    </body>
</html>