<%-- 
    Document   : Services
    Created on : 21 Mar, 2014, 9:26:56 AM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@taglib  uri="http://struts.apache.org/tags-html-el" prefix="p" %>
        <link rel="stylesheet" href="css/LandingPagestyle.css" type="text/css"/>        
        <link type="text/css" href="css/bootstrap.css"/>
            
    </head>
    <body style="margin: 0px;padding: 0px; z-index: 99999">
        <div class="Services">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Available Services at Lovely Gas Seva
                </div>
        <div class="panel-body">
            <p:link action="Book-Now">
            <div class="servies-element">
                <img src="home_imgs/order.PNG" />
                <footer>
                    <footer>Refill Booking</footer>
                </footer>
            </div>
           </p:link>
            <p:link action="complain1">
            <div class="servies-element">
                 <img src="home_imgs/complain.PNG"/>
                <footer>
                    Complain
                </footer>
            </div>
           </p:link>
            <a href='Profile.jsp'>
            <div class="servies-element">
                <img src="home_imgs/sa.PNG"/>
                <footer>
                    Profile
                </footer>
            </div>
            </a>
            <p:link action="Transactions" >
            <div class="servies-element">
                <img src="home_imgs/ssaa.PNG"/>
                <footer>
                    Booking History
                </footer>
            </div>
            </p:link>
            <p:link action="Distributor" >
            <div class="servies-element">
                <img src="home_imgs/change.PNG"/>
                <footer>
                    Change Distr.
                </footer>
            </div>
            </p:link>
            <p:link action="Aadhar" >
            <div class="servies-element">
                <img  src="home_imgs/aadhaar-logo.jpg"/>
                <footer>
                     Enroll Aadhar
                </footer>
            </div>
           </p:link>
          </div>
                <div class="panel-footer" >
                    Choose your Service directly from here or you can choose from the Left Menu 
                </div>
            </div>
        </div>
        <div style="margin-top: 330px">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        
    </body>
</html>
