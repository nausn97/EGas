<%-- 
    Document   : Aadhar
    Created on : 22 Mar, 2014, 2:24:18 AM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title >Aadhar Card </title>
        <style>
            .Aadhar{            
                margin-left: 350px;
                width: 900px;
                padding: 10px;
                border: 1px #0186e3 solid;
                border-radius: 5px;
                position: relative;
                //height: 300px;
            }
            .Aadhar table {
                width: 80%;                
                margin-left: 10%;
            }
            .Aadhar table tr{
                height: 40px;
                //width: 50%;
            }
            .Aadhar table tr td input{
                
            }
        </style>
        <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function enrollAadhar(){
                
                id=document.getElementById("aadharNo").value;  
                id1=document.getElementById("aadharNo1").value;  
                
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="aadhar.do";
            url +="?id="+id+"&id1="+id1;
           // alert(url);
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
        <link href="css/bootstrap.css" type="text/css"/>
        <link href="css/bootstrap.min.css" type="text/css"/>
    </head>
    <body>
        <div class="Aadhar">
            <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">Enter Aadhar Card Details</h4>
            </div>
            <div class="panel-collapse collapse in" id="section1">
            <div class="panel-body">
            <table>
                <tr>
                    <td>Enter Your Aadhar Card Number</td>
                    <td><input type="text" id="aadharNo" style="width: 300px;" required="false"> </td>
                    
                </tr>
                <tr>
                    <td>Confirm Your Aadhar Card Number</td>
                    <td><input type="text" id="aadharNo1" style="width: 300px;" required="false"> </td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Enroll" onclick="enrollAadhar();" class="btn btn-success"style="margin-left: 0%;width: 300px;"> <div id="wait"></div></td>
                    
                    
                </tr>
                <img src="images/uid.jpg" style="position: relative; width: 350px;height: auto; margin-left: 5%;">
                <img src="home_imgs/aadhaar-logo.jpg" style="position: relative; width: 250px;height: auto; margin-left: 5%;">
            </table>
            </div>
                <footer style="background: #2ccafd;color: white;margin-top: 50px;font-size: 12px;">Now You can Enroll Your Aadhar Card details to your profile</footer>
                <div class="panel-footer" style="font-size: 10px">
                    <p class="panel-info">we request you to please enroll your aadhar card details with your bank account details to get subsidy in your account easily </p>
                </div>
        </div>
            </div>
      </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
