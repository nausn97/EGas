<%-- 
    Document   : Aadhar
    Created on : 22 Mar, 2014, 2:24:18 AM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title >Check Wait List </title>
        <style>
            .BookingStatus{            
                margin-left: 350px;
                width: 900px;              
                position: relative;
                //height: 300px;
                margin-bottom: 170px;
            }
            .BookingStatus table {
                width: 100%;                
                
            }
            .BookingStatus table td{
                font-family: tahoma;
                font-weight: normal;
                font-size: 12px;
                border: 1px #E5E5E5 solid;
                //background: #E5E5E5;
                color: #000;
                text-align: center;
            }
            .BookingStatus table th{
                font-family: tahoma;
                font-weight: normal;
                font-size: 15px;
                border: 1px #E5E5E5 solid;
                background: #269abc;
                text-align: center;
                color: #fff;
            }            
            
        
            
        </style>
        <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function checkWaitList(id){
                //alert(id);
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="waitList.do";
            url +="?id="+id;
            //alert(url);
            xmlHttp.onreadystatechange = doUpdate;
            //alert("Processing....");
            document.getElementById("wait").innerHTML="<div><img src=\"home_imgs/checking.gif\"></img></div>";
            xmlHttp.open("GET", url);
            //alert("Checking....");
            xmlHttp.send(null);
            //alert("waiting...."); 
            }      
     function doUpdate(){
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
             var a=xmlHttp.responseText;
             //alert(a);
              document.getElementById("wait").innerHTML=a;              
          }
          
         
     }
        </script>
        <%@page import="java.sql.*"%>
        <%!Connection con; %>
                    <%!String c_id;%>
                    <%!Statement st; %>
                    <%! ResultSet rs;%>
                    <%!String equip,ref,BookingDate,DeliveryDate,status,id;%>
        <link href="css/bootstrap.css" type="text/css"/>
        <link href="css/bootstrap.min.css" type="text/css"/>
    </head>
    <body>
        <div class="BookingStatus">
            <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">Check Your Status or Wait List for Booking</h4>
            </div>
            <div class="panel-collapse collapse in" id="section1">
            <div class="panel-body">
             <table>
                        <th>Sr. No.</th>
                        <th>Equipments</th>
                        <th>Reference No.</th>
                        <th>Order No.</th>
                        <th>Order Date.</th>
                        <th>Delivery Date</th>
                        <th>Status</th>                     
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
                 <td rowspan="2" style="position: relative;"> <input type="submit" id="<%=ref%>" onclick="javascript:checkWaitList('<%=ref%>')" value="Check WaitList"><div id="wait"></div></td>             
             </tr>
             <tr>
                 
             </tr>
             
             
        <%
                 
             }
             rs.close();
             con.close();
        %>
        </table>         
                
        </div>
            </div>
      </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
