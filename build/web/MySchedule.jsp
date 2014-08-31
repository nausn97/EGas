<%-- 
    Document   : MySchedule
    Created on : Apr 29, 2014, 12:00:10 PM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Appointment</title>
        <style type="text/css">
            .appoint{            
                width: 80%;
                margin-left: 10%;
                //height: 300px;
            }
            .availSlot{
                width: 50%;
                margin-left: 28%;
                border: 1px #000 solid;
                padding: 10px;
                margin-top: 5%;
                
            }
            .availSlot input{
                width: 100px;
                height: 100px;
                margin: 10px;
            }
            
        </style>
        <link type="text/css" href="css/bootstrap.css"/>
    </head>
    <%@page import="java.sql.*;"%>
    
    <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function getAppointDetail(){                
                date=document.getElementById("dateofappoint").value;                                  
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="appointment.do";
            url +="?date="+date;
            //alert(url);
            xmlHttp.onreadystatechange = doUpdate;
            //alert("Processing....");
            document.getElementById("wait").innerHTML="<div><img src=\"home_imgs/wait.gif\"></img></div>";
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
     <script type="text/javascript">
     function finalMyAppoint(appoint){
         
         
            date=document.getElementById("dateofappoint").value;    
            ref=document.getElementById("ref").value;  
            
            //lert(ref);
            
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }             
             
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }      
            
           var url="finalMyAppoint.do";
            url +="?appoint="+appoint+"&date="+date+"&ref="+ref;
            //alert(ref);
            //alert(url);    
           
           xmlHttp.onreadystatechange = doInsert;
            //alert("Processing....");
            document.getElementById("wait2").innerHTML="<div><img src=\"home_imgs/waitarrow.gif\"></img>Please Wait While Processing ...</div>";
            xmlHttp.open("GET", url);            
            xmlHttp.send(null);
         }
         
         function doInsert(){
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){            
             a="";
            var a=xmlHttp.responseText;                          
             document.getElementById("wait2").innerHTML=a;              
          }
      }
    </script>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        <div class="appoint">
            
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Choose Your Slot 
                </div>
                <div class="panel-body">                    
                        <label style="margin-left: 23%;font-family: tahoma;color: #666;margin-right: 3%;">Date</label><input type="date" id="dateofappoint" class="" style="width: 50%;"/>                   
                        <%
                            String ref = request.getParameter("refKey");
                        %>
                        <label style="margin-left: 14%;font-family: tahoma;color: #666;margin-right: 3%;margin-top: 20px;">Reference Number</label><input type="text" id="ref" class="" value="<%=ref%>" style="width: 50%;" readonly="true" required="true"/>                   
                        <input type="submit" onclick="getAppointDetail()" class="btn btn-success" style="width: 15%;margin-left: 29%; margin-top: 20px;">
                    <div id="wait">                        
                            
                            
                        </div>
                        <div id="wait2" style="margin-left: 27%;margin-top: 20px;">                        
                            
                            
                        </div>
                    </div>
                        
                        
                        
                </div>
            </div>
        </div>
    </body>
</html>
