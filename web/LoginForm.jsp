<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>    
        <link rel="stylesheet" type="text/css" href="css/FormStyle.css">  
        <link rel="stylesheet" type="text/css" href="css/responsive.css"> 
        
    </head>   
    
    <body style="margin:0;padding: 0">
       <div> 
           <jsp:include page="Header.jsp"></jsp:include>
        </div>        
      <p:form action="login" method="post">             
        <div id="login" style="width:40%;margin-right: 25%;margin-top: 7%;margin-bottom: 100px;float:right">            
         <div class="UserType">
             <input  type="radio" name="UserType" value="Consumer">Consumer Login&nbsp;&nbsp;
              <input type="radio" name="UserType" value="Distributor">Distributor Login&nbsp;&nbsp;
              <input type="radio" name="UserType" value="Admin">Admin Login
              
          </div>
            
    
            <div class="head_text_large_login">
                Please Sign In, or 
                <a href="SignUpForm.jsp" id="hide">Sign Up</a>
            </div>      
                <div class="social_main">
                    <a class="social_buttons" href="">
                        <img src="images/b_icon2.png" style="height:50px;width:auto;margin-left: 30%">
                        <div class="social_text">Login Here</div>
                    </a>                                
                </div>
              <div class="login_box">                
                  <input class="textarea" type="text" value="" name="uid" placeholder="User Id" required="true"/>                  
                  <input class="textarea" type="password" value="" name="pwd" placeholder="Password" required="true"/>                  
                  <div class="forget_password">
                      <a class="md-trigger forget_password popup" href="ResetPassword.jsp">Forgot your password?<br/></a>
                  </div>
                    <div class="login_butn">
                        <input type="hidden" value="1" id="validate-login-form">
                        <input class="login_butn_submit btn_login" type="submit" value="Let's Go"/>                
                    </div>  
                  
              </div>              
       </p:form>   
            
        </div>
      
        <div style="margin-top: 400px;">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
           
    </body>
</html>
