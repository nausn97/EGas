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
            .Distributor{            
                margin-left: 340px;
                width: 920px;
                padding: 10px;
                
            }
            .Distributor table{
                width:90%;
                margin-left: 5%;
                
            }
            .Distributor table th{
                font-family: tahoma;
                font-weight: normal;
                font-size: 15px;
                border: 1px #E5E5E5 solid;
                background: #269abc;
                text-align: center;
                color: #fff;
            }
            .Distributor table td{
                font-family: tahoma;
                font-weight: normal;
                font-size: 12px;
                border: 1px #E5E5E5 solid;
                //background: #E5E5E5;
                color: #000;
                text-align: center;
            }
        </style>
        
        
        
        
        <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDb9QhZhlryNgwr5UQrXoDMr77x3ncNzk8&sensor=false">
        </script>

        <script type="text/javascript">
        var marker,
        distributor1 = new google.maps.LatLng(31.3260150,75.5761830);
        var distributor2 = new google.maps.LatLng(32.3860150,75.6861830);
        var distributor3 = new google.maps.LatLng(31.9860150,76.9861830);

        function initialize() {
            var mapOptions = {
            center: new google.maps.LatLng(31.3560150,75.6061830),
            zoom: 7,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);
        marker = new google.maps.Marker({
        position: distributor1,
        map: map,
        animation: google.maps.Animation.DROP
        
        });
        marker = new google.maps.Marker({
        position: distributor2,
        map: map,
        animation: google.maps.Animation.DROP
        
        });
        marker = new google.maps.Marker({
        position: distributor3,
        map: map,
        animation: google.maps.Animation.DROP
        
        });
        marker = new google.maps.Marker({
        position: CentralPark1,
        map: map,
        animation: google.maps.Animation.DROP
        
    });
}
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    
    
   
    
    </head>  
    <body>
        <div class="Distributor">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Choose Your Distributor to change
                </div>
                <div class="panel-body">
            
            <%
                HttpSession sess = request.getSession();
                String cDist = (String)sess.getAttribute("add");
                String city = (String)sess.getAttribute("city");
            %>
            <label>Your Current Distributor : </label> <span style="color: #4cae4c;font-weight: bold"><%=cDist%></span>
        <%@page import="java.sql.* ;"%>
        <%! String name,area,city,state,id ;%>       
        <%! Connection con; ;%>
        
        <table>
            <tr>
                <th colspan="6" style="text-align: center;background: #EE701E;font-weight: bold">Your Nearest Distributor Are</th>
            </tr>
            <tr>
                <th>S.No</th>
                <th>Distributor Name</th>
                <th>Area</th>
                <th>City</th>
                <th>State</th>
                <th>Select Distributor</th>
            </tr>
        <%
             con = Bean_and_Action.Data.getConnection();
             String consumerId = (String)session.getAttribute("c_id");
             String query = "select * from distributor where city='"+city+"'";
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(query);
             int i=0;
             while(rs.next()){
                 name = rs.getString("distributor_name");
                 area = "Shop No : "+rs.getString("shop") +" "+ rs.getString("Street");
                 city = rs.getString("city");
                 state = rs.getString("state");
                 id = rs.getString("id");
                 
         %>
            <tr>
                <td><%=++i%></td>
                <td><%=name%></td>
                <td><%=area%></td>
                <td><%=city%></td>
                <td><%=state%></td>
                <td><input type="radio" name="dist" id="<%=id%>" style="position: relative;"></td>
            </tr>
         <%
                 
             }
        %> 
        
        </table>
        <div style="margin-left: 5%;">
            <label style="position: absolute;">Please Enter Remarks :</label><textarea rows="6" id="reason" style="margin-top: 20px;position: relative;width: 95%;"></textarea>
        </div>
        <div class="submit_button">
            <input type="submit" style="width: 30%; margin-left: 35%;margin-top: 2%" onclick="changeDist()" class="btn btn-primary" value="Change My Distributor"> 
         </div>
        <br>
        <div id="wait" style="margin-left: 5%;position: relative;margin-top: 10px; margin-bottom: 20px;">
            
        </div>
        
        <div style="width: 96%;height: 400px;border: 1px #000 solid;margin-left: 2%;" id="googleMap">
            
        </div>
        <div style="position: relative">
        <footer style="background: #2ccafd;color: white;margin-top: 50px;font-size: 12px;">Now You can change your distributor to your nearest distributor</footer>
        <div class="panel-footer" style="font-size: 10px">
            <p class="panel-info">Lovely Gas Seva offers you to choose your Distributor within an identified cluster of distributors. You can select your distributor if your choice from the cluster provided as shown above and submit. We also request you to give reason for your transfer enabling us to improve further and match your expectation</p>
        </div>
        </div>
    </div>
        
        
        <script type='text/javascript' src="js/jquery.js"></script>
        <script type="text/javascript">
            function changeDist(){     
            var remarks = document.getElementById("reason").value;
                newid = 8;
            if (typeof XMLHttpRequest != "undefined"){
                 xmlHttp= new XMLHttpRequest();      
            }
            else if (window.ActiveXObject){
                 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      
            }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;      
            }            
            var url="changedist.do";
            url +="?ID_NEW="+newid+"&remarks="+remarks;            
            xmlHttp.onreadystatechange = doUpdate;            
            document.getElementById("wait").innerHTML="<div><img src=\"home_imgs/waitarrow.gif\"></img>  Please Wait While Processing your Request ...</div> ";
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
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
