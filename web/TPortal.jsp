<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <script type="text/javascript" src="js/paging.js"></script>
    <style>
        .search{
            width:75%;
            //height:100px;
            float:left;
            margin-left: 12.5%;
            border: 3px rgb(59,82,160) solid;
            box-shadow: 1px #999999 1px 3px 4px;;
            padding-top: 30px;
            
        }
        
        .search table{
            width:75%;
            float: left;
            margin-left: 12.5%;            
            font-family: sans-serif;
            font-size: 14px;
            position: relative;
            
        }
        .search table tr{
            width:60%;            
            //border-bottom: 1px #ffd200 solid;
            
        }
        .search table tr td{
            width: 30%;
            //margin-bottom: 40px;
        }
        .search table tr td select{
            width: 60%;
            margin-bottom: 20px;
            //margin-top: -5px;
        }
        .search table tr td label{
            //width: 300px;
            margin-bottom: 20px;
            margin-top: -5px;
            
        }
        .normalSearch{
            width:36%;
            float:left;            
            background: rgb(59,82,160);
            height:200px;        
            margin-left:12.5%;            
        }
        .normalSearch table{
            width: 75%;
            margin-left: 12.5%;
         //   color:white;
        }
        
        .normalSearch select{
            width: 78%;
            //margin:10px 30px 10px 30px;
            margin: 0px 0px 10px 10px;
        }
        
        .QuickSearch{
           width:36%;
            float:right;
            padding: 2%;
            //height: 150px;
            background: rgb(59,82,160);
            color:#ffd200;
            //margin-bottom: 10px;
            margin-right: 12.5%;
            
        }
        .QuickSearch table{
            width: 75%;
            margin-left: 12.5%;
         //   color:white;
        }
        .QuickSearch input{            
            width: 80%;
            margin-bottom: 20px;
        }
        .QuickSearch label{
            font-family: sans-serif;
            font-size: 14px;            
            color:#ffd200;
            
            
        }
        h3{
            color:#FFF;
            margin-top: 0px;
            margin-left: 20px;
            font-family: sans-serif;
            
        }
        .portalTable{
            
            width: 90%;
            margin-left: 5%;
            border: 1px;
            padding: 2px;
            
            
        }
        .portalTable table{
            width: 100%;
            margin-top: 30px;
            border-spacing: 1px;
            border:1px #dddcdc solid;
            padding:2px
        }
        .portalTable th{
            background: rgb(59,82,160);
            color:#FFF;
            font-family: sans-serif;
            height:30px;
             font-size: 14px;
        }
        .portalTable td{
            border:1px ;
            text-align: center;
            border:1px #dddcdc solid;
            padding: 4px;
            font-family: monospace;
            color: rgb(59,82,160);
            
        }
        .portalTable tr{
            border:1px;
            height:20px;
        }
        .helpTable{
            width: 60%;
            margin-left: 5%;
            
            
        }
        .helpTable table{
            width: 100%;
            margin-top: 30px;
            border-spacing: 1px;
            border:1px #dddcdc solid;
            padding:2px
        }
        .helpTable th{
            background: rgb(59,82,160);
            color:#FFF;
            font-family: sans-serif;
            height:30px;
             font-size: 14px;
        }
        .helpTable tr{
            border:1px;
            height:20px;
        }
        .helpTable td{
            border:1px ;
            text-align: center;
            border:1px #dddcdc solid;
            padding: 4px;
            font-family: monospace;
            border-spacing: 0px;
        }
    </style>
    
    <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function getCity(state){             
                
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="city.do";
            url +="?state="+state;
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
             document.getElementById("wait").innerHTML=""
              document.getElementById("cities").innerHTML=a;              
          }
          
         
     }
        </script>
        <script type="text/javascript">
           function getDist(city){             
                
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="distributor.do";
            url +="?city="+city;
            ////alert(url);
            xmlHttp.onreadystatechange = doUpdate1;
            ////alert("Processing....");
            document.getElementById("wait2").innerHTML="<div><img src=\"home_imgs/wait.gif\"></img></div>";
            xmlHttp.open("GET", url);
            //alert("Checking....");
            xmlHttp.send(null);
            //alert("waiting....");
            }      
     function doUpdate1(){
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
             var ab=xmlHttp.responseText;             
                document.getElementById("wait2").innerHTML="";
                //alert('jkhzk');
                document.getElementById("distributor").innerHTML=ab;              
          }
          
         
     }
        </script>
        
        <script type="text/javascript">
           function getConsumers(dist){             
               // alert(dist);
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      }
            //alert('hjhkjhkh');
            var url="consumers.do";
            url +="?dist="+dist;
           // //alert(url);
            xmlHttp.onreadystatechange = doUpdate2;
            //alert("Processing....");
            //document.getElementById("wait2").innerHTML="<div><img src=\"home_imgs/wait.gif\"></img></div>";
            xmlHttp.open("GET", url);
            //alert("Checking....");
            xmlHttp.send(null);
            //alert("waiting....");
            }      
     function doUpdate2(){
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
             var abc=xmlHttp.responseText;             
              //  document.getElementById("wait2").innerHTML=""
                //alert(abc);
                document.getElementById("MyTable").innerHTML=abc;              
          }
          
         
     }
        </script>
    
    </head>
    <body>
        <div>
            <jsp:include page="Header.jsp"></jsp:include>
        </div>
        
        <div class="headText">
            <h2 style=" text-align: center; font-family: monospace;font-size: 32;color: rgb(59,82,160); ">Transparency Portal</h2>
        </div>
        <div class="search">    
            <table>
                <tr>
                    <td>Select Financial Year</td>
                    <td>
                        <select name="fyear">
                          <option value="01">2010-2011</option>
                          <option value="01">2011-2012</option>
                          <option value="02">2012-2013</option>
                        </select>  
                    </td>
                </tr>
                <tr>
                    <td>Select Consumer Type</td>
                    <td>
                        <select name="dtype">
                          <option value="01">Domestic</option>
                          <option value="01">Commercial</option>
                          <option value="02">Other</option>
                    </select>       
                    </td>
                        
                </tr>
            </table>                     
        </div>
        <div class="normalSearch">
            <h3 style="color: #ffd200">Normal Search</h3>
            <table>
                <tr>
                    <td style="color:#FFF">State </td>
                    <td>
                        <select name="state" onchange="getCity(this.value)">
                                          <%
                                              
                                              Connection con = Bean_and_Action.Data.getConnection();
                                              String query = "select Distinct state from statesandcities";
                                              Statement st = con.createStatement();
                                              ResultSet rs = st.executeQuery(query);
                                              while(rs.next()){
                                           %>
                                           <option value="<%=rs.getString(1)%>" ><%=rs.getString(1)%></option>
                                           <%
                                              }
                                              con.close();
                                          %>
                        </select> <div id="wait" style="float: right;"></div>
           
                        </td>
                
                </tr>
                <tr>
                    <td style="color:#FFF">District</td>
                    <td>
                        <div id="cities">
                            <select name="city">
                                <option value="" selected="selected"> SELECT DISTRICT </option>
                            </select> 
                        </div>
                        
                    </td>
                </tr>
                <tr>
                    <td style="color:#FFF">Distributor</td>
                    <td>
                        <div id="distributor">
                            <select name="Dist">
                                <option value="" selected="selected"> SELECT DISTRIBUTOR </option>
                            </select>
                        </div>
                    </td>
                </tr>
            </table>
            
            
        </div>        
        <div class="QuickSearch">            
            <h3>Quick Search</h3>
            <table>
                <tr>                    
                    <td style="color:#FFF">Distributor Name:</td>
                    <td>
                        <input type="text" name="distributor"/>
                    </td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" name="quuickSubmit" value="Search" /></td>
                </tr>
            </table>              
            
        </div>
            <div id="wrapper_demo">            
        <div class="portalTable" id="MyTable">
            <table id="ptable">
                <th>S.No.</th>
                <th>Consumer No.</th>
                <th>Consumer Name</th>
                <th>Address</th>
                <th>Seeded with IOCL?</th>
                <th>Link With Bank</th>
                <th>Total Refill Quantity</th>
                <th>Subsidized Refill Quantity</th>
                <th>Approx Subsidy(Rs.)</th>
                
            </table>
            </div>
                <a><div style="background: rgb(59,82,160);color: #FFF;text-align: center;width:90%;margin-left: 5%;float:left;height: 30px;" id="pageNavPosition"></div>    </a>   
        <script type="text/javascript"><!--
        var pager = new Pager('ptable', 6); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    //--></script>  
        </div>        
        <div class="helpTable">
            <table>
                <th>Aadhar Linking status with IOCL</th>
                <th>Aadhar Linking status with BANK</th>
                <th>Message</th>
                <tr>
                    <td><img src="images/greenicon.jpg">Available</td>
                    <td><img src="images/greenicon.jpg"><label>Available</label></td>
                    <td>You are good to receive subsidy in your Bank Account</td>
                </tr>
                <tr>
                    <td><img src="images/greenicon.jpg"/><label>Available</label></td>
                    <td><img src="images/redicon.jpg"/><label>Not Available</label></td>
                    <td>Please visit your nearest branch to link your Aadhaar number</td>
                </tr>
                <tr>
                    <td><img src="images/redicon.jpg"/><label>Not Available</label></td>
                    <td><img src="images/naicon.jpg"/><label>Not Known</label></td>
                    <td>Please visit your Bank AND/OR Distributor to link your Aadhaar number.</td>
                </tr>

            </table>            
            <p style="font-size: 11px;float:left">*The Notional per cylinder subsidy is calculated based on actual All India average subsidy of financial year 2012-13.</p>
            <p style="font-size: 10px;color: red;float: left;margin-top: 5px;">               
                Disclaimer <br/>
                While every effort has been made to ensure the accuracy of the information supplied herein, Indian Oil Corporation Limited is not responsible for any errors or omissions which may happen due to failure in network communication and software related issues. Unless otherwise indicated, data available here are collected from Indane Gas distributors and not directly generated by Indian Oil Corporation. For any feedback on mistakes/corrections the concerned distributor may be contacted with supporting documents.</p>
        </div>     
      <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
