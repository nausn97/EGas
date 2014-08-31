<%-- 
    Document   : ResetPassword
    Created on : May 9, 2014, 7:07:57 PM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lovely Gas Seva</title>
        <link type="text/css" href="css/bootstrap.css"/>
        <style>
            .mainBody{
                   width: 60%;
                   margin-left: 20%;
                   margin-top: 5%;
                }
            
        </style>
        
        <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function search(){
                
                id=document.getElementById("cid").value;  
                
                
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="search.do";
            url +="?cid="+id;
            //alert(url);
            xmlHttp.onreadystatechange = doUpdate;
            //alert("Processing....");
            document.getElementById("wait").innerHTML="<div><img src=\"home_imgs/waitarrow.gif\"></img>Please Wait While Processing ...</div>";
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
        
        <script>
            function getEmail(){                
                var str = "<label style=\"font-family: tahoma;color: #899caa; margin-right: 4%\">Enter Your Email ID</label><input type=\"text\" class=\"textBox\" id=\"email\" style=\"width: 50%;\"/><input type=\"submit\" value=\"Get Reset Link\" onclick=\"javascript:recoverAccount()\"/>"
                document.getElementById("wait2").innerHTML = str;
            }
        </script>
        
        <script>
            function recoverAccount(){                
                id=document.getElementById("email").value;                               
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="recover.do";
            url +="?email="+id;
            //alert(url);
            xmlHttp.onreadystatechange = doUpdate1;
            //alert("Processing....");
            document.getElementById("wait3").innerHTML="<div><img src=\"home_imgs/waitarrow.gif\"></img>Please Wait While Processing ...</div>";
            xmlHttp.open("GET", url);
            //alert("Checking....");
            xmlHttp.send(null);
            //alert("waiting....");*/
            }      
     function doUpdate1(){
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
             var a=xmlHttp.responseText;
             //alert(a);
              document.getElementById("wait3").innerHTML=a;              
          }
      }
        </script>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>        
            <div class="mainBody">
        <div class="panel panel-default">
            <div class="panel-heading" style="padding: 20px;">
                Find Your Account 
            </div>
            <div class="panel-body" style="padding: 50px;">                
                <label style="font-family: tahoma;color: #899caa; margin-right: 4%">Enter Your Consumer ID</label><input type="text" class="textBox" id="cid" style="width: 50%;"/>
                <div id="wait" style="margin-top: 20px;"></div>
                <div id="wait2"></div>
                <div id="wait3"></div>
            </div>
            <div class="panel-footer">
                
                <input type="submit" class="btn btn-primary" value="Search" onclick="javascript:search()" style="margin-left: 80%;"/>
                    <input type="submit" class="btn btn-default" value="Cancel">
                
            </div>
            
        </div>
        </div>
        
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
