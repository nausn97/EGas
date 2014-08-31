<%-- 
    Document   : ChangeMyPasssword
    Created on : May 20, 2014, 10:29:25 PM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" type="text/css"/>
    </head>
    <style>
        .MyPassword{
             margin-left: 350px;
                width: 900px;             
                position: relative;
                margin-bottom: 100px;
        }
        .MyPassword table {
                width: 80%;                
                margin-left: 10%;
            }
            .MyPassword table tr{
                height: 40px;
                //width: 50%;
            }
            .Aadhar table tr td input{
                
            }
    </style>
    <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function changePassword(){
                
                oldpassword=document.getElementById("oldpassword").value;  
                newpassword=document.getElementById("newpassword").value;  
                confirmnewpassword=document.getElementById("confirm").value;
                
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="myPassword.do";
            url +="?oldpassword="+oldpassword+"&newpassword="+newpassword+"&confirmnewpassword="+confirmnewpassword;
          //alert(url);
            xmlHttp.onreadystatechange = doUpdate;
            //alert("Processing....");
            document.getElementById("wait").innerHTML="<div><img src=\"home_imgs/waitarrow.gif\"></img> please wait while processing ...</div>";
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
    <body>
        
        <div class="MyPassword">
            <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">Change Your Password for Security</h4>
            </div>
            <div class="panel-collapse collapse in" id="section1">
            <div class="panel-body">
            <table>
                <tr>
                    <td>Enter Your Old Password</td>
                    <td><input type="password" id="oldpassword" style="width: 300px;" required="true"> </td>
                    
                </tr>
                <tr>
                    <td>Enter Your New Password</td>
                    <td><input type="password" id="newpassword" style="width: 300px;" required="true"> </td>
                    
                </tr>
                <tr>
                    <td>Confirm your new Password</td>
                    <td><input type="password" id="confirm" style="width: 300px;" required="true"> </td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Change Password" onclick="changePassword();" class="btn btn-success"style="margin-left: 0%;width: 300px;"> <div id="wait"></div></td>
                <div id="wait"></div>
                    
                </tr>
                
            </table>
            </div>
                
        </div>
            </div>
      </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
