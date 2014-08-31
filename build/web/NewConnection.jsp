<%-- 
    Document   : UpdateForm
    Created on : Apr 17, 2014, 1:10:40 PM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get A New Connection</title>
        <link href="css/FormStyle.css" type="text/css"/>
        <style type="text/css">
            body{
                background:  white;
                padding: 0px;
                margin: 0px;
            }
            .NewConnectionForm{
                width: 70%;
                margin-left: 15%;
                padding: 10px;                
                background:#E5E5E5;
            }
            .NewConnectionForm fieldset{
                width: 93%;
                font-family: tahoma;
                margin-left: 2%;
                margin-bottom: 2%;
            }
            .NewConnectionForm table tr td{
                padding-left: 40px;
                padding-right: 40px;
                
                
            }
            .NewConnectionForm table tr{
                height: 50px;
            }
            .header{
                width: 100%;
                background: black;
                height: 50px;
                margin-bottom: 40px;
            }
            
        </style>
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>
        <script type="text/javascript">
            document.getElementById("aadhar").onchange() = function(){
                alert('vcgfjfhgkh')
                if ( document.getElementById('icd').checked ==true ) {
                alert('helollooo');
            }
        }        
        </script>
    </head>
    <link href="css/bootstrap.css" type="text/css"/>
    <body>
        <div class="header">
            <jsp:include page="Header.jsp"></jsp:include>
                
        </div>
        
        
        <div class="NewConnectionForm" style="position: absolute">
            
            <div class="panel panel-primary">
                <div class="panel-heading">
                    New Connection Form
                </div>
                
        <div class="panel-body">
        <p:form action="newConnection" method="post">
            <fieldset>
                <legend>Your Details</legend>
                <table>
                    <tr>
                        <td>Salutation : </td><td><select name="salu"><option value="Mr">Mr</option><option value="Mrs">Mr</option><option value="Mr">Miss</option></select></td>
                        <td>First Name* : </td><td><input class='textarea' type="text" name="fname" style="width: 150px;" required="true"></td>
                    </tr>
                    <tr>
                        <td>Middle Name : </td><td><input type="text" name="mname"></td>
                        <td>Last Name* : </td><td><input type="text" name="lname" required="true"></td>
                        
                    </tr>
                     <tr>
                         <td>Date of Birth    :</td><td><input type="date" name="date" required="true"/></td>
                         <td>Gender    :</td><td><select name="gender"><option value="Male">Male</option><option value="Female">Female</option></select></td>
                        
                        
                    </tr>
                </table>
            </fieldset>
            
            
            <fieldset>
                <legend>Personal Details</legend>
                <table>
                    <tr>
                        <td>Father's Name:* </td><td><input class='textarea' type="text" name="fathername" required="true"></td>
                        <td>Mother's Name:* </td><td><input class='textarea' type="text" name="mothername" required="true"></td>
                    </tr>
                    <tr>
                        <td>Spouse's Name: </td><td><input type="text" name="spousename"></td>
                        <td></td>
                        
                    </tr>
                     
                </table>
            </fieldset>
            
            
            <fieldset>
                <legend>Proof of Address (PoA)</legend>
                <table>
                    <tr>
                        
                        <td>Aadhar Card : </td><td><input type="checkbox" id='aadhar' onclick="javascript:function()" ></td>
                        <td>Driving License :</td><td><input type="checkbox" id='dl'></td>
                    </tr>
                    <tr>
                        <td>Lease agreement / rent receipt : &nbsp;&nbsp;&nbsp;</td><td><input type="checkbox" id='lease'></td>
                        <td>Voter ID : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="checkbox" id='voter'></td>
                        
                    </tr>
                     <tr>
                         <td>Passport Number : &nbsp;&nbsp;&nbsp;</td><td><input type="checkbox" id='passport'></td>
                        <td>Telephone/Electricity Bill : &nbsp;&nbsp;</td><td><input type="checkbox" id='bill'></td>
                        
                        
                    </tr>
                    
                   
                </table>
            </fieldset>
            
            <fieldset>
                <legend>Connection Address/Conatact Details</legend>
                <table style="padding-left: 2px;padding-right: 2px;">
                    <tr>
                        <td>House No : &nbsp;&nbsp;&nbsp;</td><td><input class='textarea' type="text" name="hno"></td>
                        <td>House/Flat Name : &nbsp;&nbsp;&nbsp;</td><td><input class='textarea' type="text" name="hname"></td>
                    </tr>
                    <tr>
                        <td>Housing Building/Complex No. : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="bno"></td>
                        <td>Street/Road Name : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="sno"></td>
                        
                    </tr>
                     <tr>
                         <td>City* : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="district" required="true"></td>
                        <td>State* : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="state" required="true"></td>                     
                        
                    </tr>
                    <tr>
                         <td>Pin* : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="pin" required="true"></td>
                        <td>Country* : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="country" required="true"></td>                     
                        
                    </tr>
                    <tr>
                         <td>Email : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="email"></td>
                        <td>Contact No* : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="email" required="true"></td>                     
                        
                    </tr>
                    <tr>
                         <td>Landline No. : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="landline"></td>
                        
                        
                    </tr>
                </table>
            </fieldset>
            
            <fieldset>
                <legend>Proof of ID(PoI)</legend>
                <table>
                    <tr>
                        <td>Aadhar Card :</td><td id="aadharWait"></td><td><input type="checkbox" id='aadhar'></td>
                        <td>Driving License : </td><td id="dlWait"></td><td><input type="checkbox" id='dl'></td>
                    </tr>
                    <tr>
                        <td>Voter ID : </td><td id="voterWait"></td><td><input type="checkbox" id='voter'></td>
                        <td>Passport : </td><td id="passportWait"></td><td><input type="checkbox" id='voter'></td>
                        
                    </tr>
                      <tr>
                         <td>Pan No : </td><td id="panWait"></td><td><input type="checkbox" id='lease'></td>
                        <td>Ration Card : </td><td id="rationWait"></td><td><input type="checkbox" id='bill'></td>                        
                        
                    </tr>
                    <tr>
                         <td>Other : &nbsp;&nbsp;&nbsp;</td><td id="otherWait"></td><td><input type="checkbox" id='lease'></td>                        
                        
                    </tr>
                </table>
            </fieldset>
            
            <fieldset>
                <legend>Optional Bank Account</legend>
                <table>
                    <tr>
                        <td>Bank Name : &nbsp;&nbsp;&nbsp;</td><td><input class='textarea' type="text" name="bankname"></td>
                        <td>Branch Name : &nbsp;&nbsp;&nbsp;</td><td><input class='textarea' type="text" name="branchname"></td>
                    </tr>
                    <tr>
                        <td>Branch Address : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="branchaddress"></td>
                        <td>IFSC code : &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="ifsc"></td>
                        
                    </tr>
                     <tr>
                         <td>Account No    :&nbsp; &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="account" /></td>                       
                        
                    </tr>
                </table>
            </fieldset>           
            <fieldset>
                <legend>Upload Section</legend>
                <table>
                    <tr>
                        <td><input type="file" name="image" style="margin-right: 150px;"/></td><td><input type="file" name="sign"/></td>
                    </tr>
                    <tr>
                        <td></td><td></td>
                    </tr>
                    
                </table>
            </fieldset>     
            <div class="btn" style="border-top: 1px #000 solid;width: 98%">
                <input type="submit" value="Submit" class="btn btn-success" style="width: 150px;margin-right: 30px;"/>
                <input type="reset" value="Clear All" class="btn btn-warning" style="width: 150px;"/>
            </div>
        </div>
        </p:form>
            </div>
            <div class="panel-footer">
                <div class="text-danger" >
                    Please fill form with valid data you will get a mail on email id provided by you above that will contain appointment date with your reference id you have to represent all the documents that you have provided here 
                </div>
            </div>
        </div>
            <div style="margin-top: 2000px;">
                <jsp:include page="Footer.jsp"></jsp:include>
            </div>
            
    </body>
</html>
