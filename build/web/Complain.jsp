<%-- 
    Document   : Complain
    Created on : Apr 23, 2014, 1:07:47 AM
    Author     : Naushad Ahmad
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p"%>
        <title>Consumer Complain</title>
        <link href="css/bootstrap.css" type="text/css"/>
        <style type="text/css">
            .Complain{            
                margin-left: 350px;
                width: 900px;
                
                //height: 300px;
            }
            .tabs table{
                border: 1px;
                border-spacing: 0px;
                width: 100%;
                margin-top: -25px;
                margin-left: auto;
                margin-right: auto;
                position: relative;
                
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
        
        <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function logComplain(){                
                type=document.getElementById("type").value;  
                naturetype=document.getElementById("naturetype").value;  
                mob=document.getElementById("mob").value;  
                comp=document.getElementById("comp").value;                  
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="complain.do";
            url +="?type="+type+"&naturetype="+naturetype+"&mob="+mob+"&comp="+comp;
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
             document.getElementById("wait").innerHTML=""; 
             document.getElementById("wait").innerHTML=a;               
              
          }
          
         
     }
    </script>
        
    </head>
    <body>
        <div class="Complain">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    You can log complain to your distributor for any problem
                </div>
                <div class="panel-body">
                    <img src="images/working.png" style="float: right"/>
                    <div style="border-right:1px #999 solid ;height: 100%;width: 60%;position: relative">
                        <div style="width: 80%;margin-left: 10%;">                      
      
                            <table style="width: 100%;">
                                <tr>
                                    <td style="font-family: tahoma;color: #999"><b>Complain Type</b></td>
                                    <td>
                                        <select id="type" class="select" style="font-family: tahoma">                                                                        
                                            <option value="1">Leakage</option>
                                            <option value="2">Service</option>
                                            <option value="3">Mandatory Inspection</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma;color: #999"><b>Nature of Complain</b></td>
                                    <td>
                                        <select id="naturetype" class="select" style="font-family: tahoma">                            
                                            <option value="Cylinder Related">Cylinder Related</option>
                                            <option value="PR Related">PR Related</option>
                                            <option value="Hot Plate Related">Hot Plate Related</option>
                                            <option value="LPG Tube Related">LPG Tube Related</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma;color: #999"><b>Mobile Number</b></td>
                                    <td>
                                        <input type="text" id="mob"  placeholder="Mobile Number" class="textarea" style="background: #fff; width: 100%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma;color: #999" colspan="2"><textarea id="comp" rows="6" style="width: 100%" class="textarea" style="background: #fff;"></textarea></td>
                                    
                                </tr>
                                
                                
                            </table>
                            <div style="position: relative; ">
                                <input type="submit" class="btn btn-success" value="Submit" style="width: 40%;margin-left: 5%;margin-right: 5%" onclick="javascript:logComplain()" ><input type="clear" class="btn btn-warning" value="Clear" style="width: 40%">
                                </div>
                        
                            <div id="wait">
                                
                            </div>
      
                        </div>
                        
                    </div>
                    <div style="width: 100%;margin-top: 35px;" class="tabs">
                        <table>
                            <tr>
                                <th colspan="8" style="text-align: center;background: #EE701E;color: white;font-weight: bold">Previous Complain</th>
                            </tr>
                            <tr>
                                <th>Complain Id</th>
                                <th>Complain Status</th>
                                <th>Complain Date</th>
                                <th>Complain Type</th>
                                <th>Complain Nature</th>
                                <th>Closed Date</th>
                                <th>Complain</th>
                                <th>Action Taken</th>
                                
                                
                            </tr>
                            <tr>
                            <%
                                HttpSession sess = request.getSession(false);
                                String cid = (String)sess.getAttribute("c_id");
                                
                                Connection con = Bean_and_Action.Data.getConnection();
                                String query = "select * from complain where consumerid='"+cid+"'";
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);
                                while(rs.next()){
                                    String cNo = rs.getString("id");
                                    String cType = rs.getString("ComplainType");
                                    String cStatus = rs.getString("status");
                                    String cDate = rs.getString("Complaindate");
                                    String cNature = rs.getString("complainNature");
                                    String cClosedDate = rs.getString("closedate");
                                    String cDesc = rs.getString("description");
                                    String cAction = rs.getString("Action");
                              %>      
                              <td><%=cNo%></td>
                              <td><%=cStatus%></td>
                                <td><%=cDate%></td>                                
                                <td><%=cType%></td>
                                <td><%=cNature%></td>
                                <td><%=cClosedDate%></td>
                                <td><%=cDesc%></td>
                                <td><%=cAction%></td>
                        </tr>
                              <%
                                }
                                con.close();
                            %>
                                
                            </tr>
                        </table>        
                    </div>
                </div>
                <div class="panel-footer">
                    Log Complain by choosing your complain type
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
