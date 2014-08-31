<%-- 
    Document   : Aadhar
    Created on : 22 Mar, 2014, 2:24:18 AM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .Cancel{            
                margin-left: 350px;
                width: 900px;
                
            }
            .Cancel table {
                width: 100%;
                
                position: relative;
                    
            }
            .Cancel table th{
                font-family: tahoma;
                font-weight: normal;
                font-size: 15px;
                border: 1px #E5E5E5 solid;
                background: #269abc;
                text-align: center;
                color: #fff;
                
            }
            .Cancel table td{
                border: 1px #000 solid;
                text-align: center;
            }
        </style>
        <link type="text/css" href="css/bootstrap.css"/>
    <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function cancelOrder(id){
                //alert(id);
                //id=document.getElementById("cancelButton").value;  
                //alert(id);
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="cancel.do";
            url +="?id="+id;
            //alert(url);
            xmlHttp.onreadystatechange = doUpdate;
            //alert("Processing....");
            document.getElementById("wait").innerHTML="<div><img src=\"home_imgs/waitarrow.gif\"></img>  Please Wait While Processing your Request ...</div>";
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
    <%@page import="java.sql.* ;"%>
    <body>
        <%!String equip,ref,date,status;%>
    <div class="Cancel">
        <div class="panel panel-primary">
            <div class="panel-heading">
                Cancel Your Booked Orders
            </div>
            <div class="panel-body">
        
        <table>
                        <th>Sr. No.</th>
                        <th>Equipments</th>
                        <th>Reference No.</th>
                        <th>Order No.</th>
                        <th>Order Date.</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        <th></th>
        <%
             
             Connection con = Bean_and_Action.Data.getConnection();
             String c_id = (String)session.getAttribute("c_id");
             String query = "select p.name,bd.no,bd.dateOfBooking,status from Bookingdetail as bd join Product as p on (bd.prodId = p.id) where bd.consumerId='"+c_id+"' and bd.status='Booked'";
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(query);
             while(rs.next()){
                 int i = 0;
                 equip = rs.getString(1);
                 ref = rs.getString(2);
                 date = rs.getString(3);
                 status = rs.getString(4);
             %>                       
             <tr>
                 <td><%=++i%></td>
                 <td><%=equip%></td>
                 <td><%=ref%></td>
                 <td></td>
                 <td><%=date%></td>
                 <td></td>
                 <td><%=status%></td>             
                 <td style="width: 50px"><input type="radio" id="<%=ref%>"</td>             
             </tr>
        <%
                 
             }
             
             con.close();
        %>
        <tr>        
            <td colspan="8"><input type="submit" id="cancelButton" onclick="cancelOrder(<%=ref%>);" value="Cancel " class="btn btn-primary" style="width: 200px;"><div id="wait"></div></td>
        </tr>
        </table> 
        
         
        
        </div>
        <div class="panel-footer" style="font-size: 10px">
            <p class="panel-info">This tab contain your current booked order detail . you can get SMS on your mobile to take delivery or you can generate Cash Memo here to save your time in distributor place</p>
        </div>
    </div>
        </div>
    </div>
       
    </body>
</html>
