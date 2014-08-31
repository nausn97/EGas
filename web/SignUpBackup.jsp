<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>    
        <link rel="stylesheet" type="text/css" href="css/FormStyle.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
    </head>
    <body style="margin: 0;padding: 0;">
        <div class="mainHeaderClass"> 
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a>About Us</a></li>
                <li><a>Contact Us</a></li>
                
            </ul>
        </div>       
     
        <div id="login" style="width:40%;margin-right: 10%;margin-top: 4%;float:right">
            <div class="head_text_large_login">
                Please Sign Up, or 
                <a href="LoginForm.jsp" id="hide">Sign In</a>
            </div>
      <p:form action="signup" method="post">
                <div class="social_main">
                    <a class="social_buttons" href="">
                 
                        <img src="images/b_icon2.png" style="height:50px;width:auto;margin-left: 30%">
                        <div class="social_text">Sign Up Here</div>
                    </a>                                
                </div>
              <div class="register_box">                
                  <select style="float:right;" class="select" name="bgstate" id="bgstate" style="width:200px" onchange="showcat(this,'sub1','state');">
                                          <option value="" selected="selected"> SELECT STATE </option>				  
					  <option value="2169">Andhra Pradesh</option>					
					  <option value="2196">Arunachal Pradesh</option>					
					  <option value="2170">Assam</option>					
					  <option value="2171">Bihar</option>					
					  <option value="5267">Chhattisgarh</option>					
					  <option value="2174">Delhi</option>					
					  <option value="2199">Goa</option>					
					  <option value="2175">Gujarat</option>					
					  <option value="2176">Haryana</option>					
					  <option value="2177">Himachal Pradesh</option>					
					  <option value="2178">Jammu and Kashmir</option>					
					  <option value="5268">Jharkhand</option>					
					  <option value="2185">Karnataka</option>					
					  <option value="2179">Kerala</option>					
					  <option value="2181">Madhya Pradesh</option>					
					  <option value="2182">Maharashtra</option>					
					  <option value="2183">Manipur</option>					
					  <option value="2184">Meghalaya</option>					
					  <option value="2197">Mizoram</option>					
					  <option value="2186">Nagaland</option>					
					  <option value="2187">Orissa</option>					
					  <option value="2189">Punjab</option>					
					  <option value="2190">Rajasthan</option>					
					  <option value="2195">Sikkim</option>					
					  <option value="2191">Tamil Nadu</option>					
					  <option value="2192">Tripura</option>					
					  <option value="5269">UNION TERRITORY</option>					
					  <option value="2193">Uttar Pradesh</option>					
					  <option value="5259">Uttaranchal</option>					
					  <option value="2194">West Bengal</option>						
			  </select>      
                  <select style="float:right;" class="select" name="bgcity" style="width:200px" onchange="showcat(this,'sub2','city');">
                                          <option value="0">SELECT CITY</option>			  	
                                          <option value="1">Jalandhar</option>	
                                          <option value="2">Amritsar</option>	
                  </select>
                  <select style="float:right;" class="select" name="dist" style="width:200px" title="distributor" id="rtbgagid1">
                                         <option value="0"> SELECT DISTRIBUTOR</option>				  					
                                         <option value="1"> Vijay Gas</option>				  					
                                         <option value="2"> Subh Laxmi Gas</option>				  					
		  </select>
                  <input  class="textarea required" type="text" name="consumerNo" placeholder="Consumer Number"/>
                  <input class="textarea required" type="text" name="userid" placeholder="User ID"/>
                  <input class="textarea required" type="text" name="email" placeholder="Email Address"/>
                  <input style="width:6%;margin-right: 15px" class="textarea" type="text" name="countrycode" value="+91" readonly="true"/>
                  <input style="width:38%;margin-right: 15px" class="textarea" type="text" name="landline" placeholder="Landline Number"/>
                  <input style="width:38%; float:right; margin-right: 0;padding-right: 0;" class="textarea" type="text" name="mob" placeholder="Mobile Number"/>                   
                  <input class="textarea" type="text" name="passportNo" placeholder="Passport Number"/>                   
                  <input class="textarea" type="text" name="panNo" placeholder="Pan Card Number"/>                   
                  <input class="textarea" type="text" name="DLNo" placeholder="Driving License Number"/>                   
                  <input class="textarea" type="text" name="rationCardNo" placeholder="Ration Card Number"/> 
                  <input class="textarea" type="text" name="aadharNo" placeholder="Aadhar Card Number"/>                   
                    <div class="login_butn">
                        <input type="hidden" value="1" id="validate-login-form">
                        <input class="login_butn_submit btn_login" type="submit" value="Let's Go"/>                
                    </div>                    
              </div>              
       </p:form>
        </div> 
        <div class="foo" style="width:100%;height: 80px;">
            <img src="images/Capture.PNG" width="100%" height="150">
        </div>
    </body>
</html>
