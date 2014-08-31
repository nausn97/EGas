
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="css/bootstrap.css" type="text/css"/>
        <link href="css/bootstrap.min.css" type="text/css">
        <style>
            .MsgBody{            
                margin-left: 350px;
                width: 900px;
                
            }
            .messageSide{
                width:35%;                
                overflow: auto;
                height: 300px;
                position: relative;
            }
            .messageSide table {
                border: 1px #808080 solid;
                width: 100%
            }
            .messageSide table tr{
                height: 50px;
                background: #fbf9f9;
                position: relative;
                
            }
            .messageSide table tr:hover{
                height: 50px;
                background: #808080;
                
            }
            a:hover,a.active{
                text-decoration: none;
                color:#EE701E;
                font-weight: bold;
            }
            .messageSide table tr td{
                border: 1px #808080 solid;
            }
        </style>           
    </head>
     <script type='text/javascript' src="js/jquery.js"></script>
     <script type="text/javascript">
            function getMyMessage(myMsgId){  
                //alert(myMsgId);
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="mynotification.do";
            url +="?myMsgId="+myMsgId;
            //alert(myMsgId)
            //alert(url)
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
    <body>
        <div class="MsgBody">
        <div class="messageSide">
            <div class="panel panel-primary">
                <div class="panel-heading" >
                        Messages Titles and Times
                    </div>
            <%!String row,col;%>
            
            <table>
            <%
                HttpSession se = request.getSession();                
                String c_id = (String)se.getAttribute("c_id");
                Connection con1 = Bean_and_Action.Data.getConnection();
                String s = "select n.status,n.Message,n.Subject,n.Date,d.distributor_name,n.id from notification as n inner join distributor as d on (n.Sender = d.id) where cid='"+c_id+"'";
                Statement st1 = con1.createStatement();
                ResultSet rs1 = st1.executeQuery(s);                 
                
                while(rs1.next()) {
                    if(rs1.getInt(1)==1){
                        row = "CCCC";
                    }
                    else{
                        row = "#429bca";
                        col = "#CCC";
                    }
                 %>
                 <tr style="background: <%=row%>;padding-left: 10px;padding-right: 10px;">
                     <td style="color:<%=col%>; padding-left: 10px;padding-right: 10px;font-size: 14px;"><a onclick="getMyMessage('<%=rs1.getString("id")%>')"><%=rs1.getString("distributor_name")%>&nbsp;&nbsp;&nbsp;
                            <label style="float: right;font-size: 10px;color: #808080;"><%=rs1.getString("date")%></label></a>
                            <label style="font-size: 10px;max-width: 140;"><%=rs1.getString("Message")%></label>
                     </td>     
                         
                 </tr>
                 
                 <%
                 
                }
                st1.close();
                rs1.close();
                con1.close();
                
            %>          
            
            </table>          
        </div>
        </div>            
            <div class="panel panel-primary" style="position: relative;width: 64%;margin-left: 35%;margin-top: -300px;">
                <div class="panel-heading" >
                        Messages
                    </div>
                    <div class="panel-body" id="textBody" style="height: 170px;">
                        <div id="wait"></div>
                    </div>
                <footer style="background: #2ccafd;color: white;margin-top: 0px;font-size: 12px;">Now You can See notification sent by your distributor on this page</footer>
                <div class="panel-footer" style="font-size: 10px">
                    <p class="panel-info">we always try to notify you with all the updates like changes in rate of our products and with important dates of services.we request you to please check your inbox timely</p>
                </div>
                </div>            
        </div>
    </body>

        
</html>
