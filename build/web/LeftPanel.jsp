<!DOCTYPE html>
<%-- 
    Document   : LeftPanel
    Created on : 21 Mar, 2014, 9:22:36 AM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
       <link rel="stylesheet" href="css/LandingPagestyle.css" type="text/css"/>       
        <link rel="stylesheet" href="css/FormStyle.css" type="text/css"/>  
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>
        <%@page import="java.sql.*" %>
        
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script>
            jQuery(document).ready(function($) {
            $('#subMenuLeft2').hide();
    
            $('.submenuheader2').click(function() {
        
		if ($('#subMenuLeft2').is(':visible')) {
		   
			$('#subMenuLeft2').slideUp();				   
		} else {
			$('#subMenuLeft2').slideDown();
		}
		
		return false;
	});
});
        </script>
        <script>
            jQuery(document).ready(function($) {
            $('#subMenuLeft1').hide();
    
            $('.submenuheader1').click(function() {
        
		if ($('#subMenuLeft1').is(':visible')) {
		   
			$('#subMenuLeft1').slideUp();				   
		} else {
			$('#subMenuLeft1').slideDown();
		}
		
		return false;
	});
});
        </script>
    </head>
    <body style="margin: 0px;padding: 0px;">
        <div id="middle_main" style="position: absolute;">
       <div class="HighResolution a1360 a1007">
        <div id="middle">
           <div class="mid_left">
  <div class="mid_left_heading"> <span>Navigation</span> </div>
  
  <ul>
<li><a class="submenuheader submenuheader1 submenuheader_bg" href="">My Account<!--<img src="../jobs/imgs/new.gif" width="19" height="7" />--></a>
    <ul  class="sub_menu submenu" id="subMenuLeft1">
<li><a class="sub" href="Profile.jsp">Profile</a></li>
<li><p:link action="Transactions">Transaction</p:link></li>
<li><a class="sub" href="">Subsidy</a></li>
<li><a class="sub" href=""></a></li>

</ul>
</li>
<li><a class="submenuheader submenuheader2 submenuheader_bg" rel="show" href="#">Booking</a>
<ul  class="sub_menu submenu" id="subMenuLeft2">
<li><p:link action="Book-Now">Refill-Booking</p:link></li>
<li><p:link action="New-Connection">New Connection</p:link></li>
<li><p:link action="waitList1">Booking Wait-List</p:link></li>
<li><p:link action="Cancel-Order">Cancel Order</p:link></li>

</ul>
</li>

<li><p:link action="Products"> Products</p:link></li>
<li><p:link action="Aadhar">Enroll Your Aadhar</p:link></li>
<li><a href="TPortal.jsp" target="new">Transparency Portal</a></li>
<li><p:link action="Distributor">Change Your Distributor</p:link></li>
<li><p:link action="Contact">Contact Distributor</p:link></li>
<li><p:link action="other">Get Other's Refill</p:link></li>
</ul>
<div align="center" style="margin:20px 0 10px 18px; float:left;"> <a href="#" ><img src="images/banner2011.jpg" width="215" height="91" />
        <br/><label style="color:white;font-family: tahoma;background: #09F;display: inline-block;width: 100%">IVRS or SMS</label>
    </a> 
 <br/>
 <br />
 <img src="home_imgs/info.png" width="215" height="91" /><!--</a>-->
 <br/><label style="color:white;font-family: tahoma;background: #09F;display: inline-block;width: 100%">May I Help You</label>
 </div>
    <img src="home_imgs/BottomLeft.png" width="250" height="117" alt="mid_left" /></div>
  </div>
  </div>
      </div>
    </body>
</html>
