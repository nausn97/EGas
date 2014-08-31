<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>    
        <link rel="stylesheet" type="text/css" href="css/FormStyle.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        <style>
                .signup{
                    width: 60%;margin-left: 20%;margin-right: auto;margin-top: 5%;position: absolute;
                    
                }
                .signup label{
                    font-family: tahoma;font-size: 14px;width: 300px;
                    float: left;
                    margin-bottom: 2%;
                }
                .signup input{
                    width:500px;
                    float: left;
                    margin-bottom: 2%;
                }
                .signup table{
                    padding: 2%;
                }
                .signup legend{
                    font-family: tahoma;
                    font-weight: bold;
                    color: #0186e3;
                    
                }
        </style>
        <link type="text/css" href="css/bootstrap.css"/>
    </head>
    <body style="margin: 0;padding: 0;">
        <jsp:include page="Header.jsp"></jsp:include>
        <div class="signup">
            <fieldset>
                <legend>Enter Your Consumer No. With Email and Mobile No </legend>
   <table  class="form_table" width="99%">       
       <span class="myfont" style="color:red; margin-left: 200px;">                      
                    <%
                        HttpSession sess = request.getSession(false);
                        String message = (String)sess.getAttribute("Error");
                        if(message != null) {                                       
                            out.print(message);
                            message = null;
                            sess = request.getSession(true);
                        }
                    %>
       </span>
          <p:form action="signup" method="post">
              <tr style="border: 1px #0186e3 solid;height: 120px;">               
                  <td colspan="2" style="padding: 10px;margin-bottom: 30px;"> 
                 <p style="font-family: tahoma;color: #33cc00">an Email will be sent to your Email Address for verification purpose copy code and click on link and insert the code for verification<br/></p>
                 <p style="font-family: tahoma; color: #ff0033">Please enter your detail as you have provided to your distributor if you don't have access to provided email and mobile number contact your distributor to update data and then register yourself</p>
             </td>
         </tr>
         
         <tr style="height: 80px;">
             <td style="padding-top: 25px;">
                 <label>Enter Your Consumer Number: </label><input type="text" name="cid" >
             </td>
         </tr>
         <tr>
             <td>
                 <label>Enter Your Mobile No.: </label><input type="text" name="mob" >
             </td>    
         </tr>
         <tr>
             <td>
                 <label>Enter Your Email Address: </label><input type="text" name="email" >                                           
             </td>       
         </tr>
         <tr>
             
             <td>
                 <input type="submit" value="Let's Go" class="btn btn-success" style="width: 30%;margin-right: 2%;margin-left: 37%;">
                 <input type="reset" value="Clear All" class="btn btn-primary" style="width: 30%">
             </td>           
         </tr>             
            
             </p:form>
      </table>    
     </fieldset>
 </div>       
       <div style="position: relative;margin-top: 550px;">
           <jsp:include page="/Footer.jsp"></jsp:include>
       </div>
    </body>
</html>
