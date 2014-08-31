<%-- 
    Document   : A
    Created on : 10 Mar, 2014, 1:26:54 AM
    Author     : Naushad Ahmad
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/FormStyle.css" type="text/css"/>       
        <link rel="stylesheet" href="css/responsive.css" type="text/css"/>   
        <link rel="stylesheet" href="css/ProfileStyle.css" type="text/css"/>       
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/> 
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %> 
          
        
   <style type="text/css">     
        
	 

.container {
  //  width: 600px; 
    margin: 0 auto; 
    
    background-color: #d7dee1;
//    width: 500px;
}


//.post { margin: 0 auto; padding-bottom: 50px; float: left; width: 960px; }






.login-popup{
	display:none;
        background: #cacaca;
	padding: 10px; 	
	border: 2px solid #000;
	float: left;
	font-size: 1.2em;
	position: fixed;
	top: 50%; left: 40%;
        right: 20%;
	z-index: 99999;
	box-shadow: 0px 0px 20px #999;
	-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
        -webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
	border-radius:3px 3px 3px 3px;
        -moz-border-radius: 3px; /* Firefox */
        -webkit-border-radius: 3px; /* Safari, Chrome */
     //   height: 420px;
}

img.btn_close {
	float: right; 
	margin: -28px -28px 0 0;
}
.login-popup label{
    width: 200px;
    float: left;
    margin-bottom: 10px;
    font-family: tahoma;
    font-size: 12px;
    color: white;
}
.login-popup .textBox{
    width: 300px;
    float: left;
    margin-bottom: 10px;
}

</style>
       
        <script src="js/jquery.min.js" ></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
        
   <script type="text/javascript">
        $(document).ready(function() {
	$('a.login-window').click(function() {
		
		// Getting the variable's value from a link 
		var loginBox = $(this).attr('href');
                //alert(loginBox);
		//Fade in the Popup and add close button
		$(loginBox).fadeIn(300);
		
		//Set the center alignment padding + border
		var popMargTop = ($(loginBox).height() +-50) / 2; 
		var popMargLeft = ($(loginBox).width() + 24) / 2; 
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	return false;
	});
});
</script>
    </head>
    <%! String name,fname,mname,lname,gender,father_name,mother_name,spouse_name,m_st,dob,H_No,F_No,B_No,S_No,landmark,city,state,country,pin,mob,landline,email ;%>
        <%! String Bank_Name,Branch_name,Branch_add,ifsc,account ;%>
        <%! String DLNo="",PanNo="",Aadhar="",Passport="",Ration="",VoterId="",GovId,Elec_Bill,Phone_Bill,Emp_Cert,Flat_Pos_Letter,House_reg,other="";%>
        <%! String userID; %>
    <body>
        
        
        <%
            try{
             String c_id = (String)session.getAttribute("c_id");
             
             Connection con = Bean_and_Action.Data.getConnection();
             String q = "select * from [dbo].[user] as u,Consumer as c where u.userId=c.userId and c.cid='"+c_id+"'";
             Statement st1 = con.createStatement();
             ResultSet rs1 = st1.executeQuery(q);
             if(rs1.next()){
                 fname = rs1.getString(2);
                 mname = rs1.getString(3);
                 lname =rs1.getString(4);
                 name = fname+" ";
                 if(mname!=null){
                     name = name + mname +" " + lname;
                 }
                 else{
                     name = name + lname ;
                 }
                 userID = rs1.getString(5);
                 dob = rs1.getString(6);
                 gender = rs1.getString(7);
                 m_st = rs1.getString(8);
                 father_name = rs1.getString(9);
                 mother_name = rs1.getString(10);
                 spouse_name = rs1.getString(11);
                 H_No = rs1.getString(12);
                 F_No = rs1.getString(13);
                 B_No = rs1.getString(14);
                 S_No = rs1.getString(15);
                 landmark = rs1.getString(16);
                 city = rs1.getString(17);
                 pin = rs1.getString(19);
                 state = "Uttrakhand";
                 country = "India";
                 mob = rs1.getString(20);
                 email = rs1.getString(21);
                 Bank_Name = rs1.getString(22);
                 Branch_name = rs1.getString(23);
                 Branch_add = rs1.getString(24);
                 ifsc = rs1.getString(25);
                 account = rs1.getString(26);
                 DLNo = rs1.getString(27);
                 PanNo = rs1.getString(19);
                 landline = rs1.getString(33);
                 HttpSession hts = request.getSession(false);
                 hts.setAttribute("userID",userID);


             Statement st3 = con.createStatement();
             String query = "select p.proofid_no,p.type from Proof as p inner join consumer as c on (c.consumerId = p.consumerId) where c.cid ='"+c_id+"'";
             ResultSet rs3 = st3.executeQuery(query);
             while(rs3.next()){
                if(rs3.getInt(2)==Bean_and_Action.Data.AADHAAR_ADD){
                      Aadhar = rs3.getString(1); 
                      
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.AADHAAR_ID)){
                      Aadhar= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.DRIVINGLICENSE_ADD)){
                      DLNo= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.DRIVINGLICENSE_ID)){
                      DLNo= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.PANCARD_ADD)){
                      PanNo= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.PANCARD_ID)){
                      PanNo= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.PASSPORT_ADD)){
                      Passport= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.PASSPORT_ID)){
                      Passport= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.RATIONCARD_ADD)){
                      Ration= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.RATIONCARD_ID)){
                      Ration= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.VOTERICARD_ADD)){
                      VoterId= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.VOTERICARD_ID)){
                      VoterId= rs3.getString(1);
                  }
                  else if(rs3.getInt(2)==(Bean_and_Action.Data.OTHERID_ADD)){
                      other = rs3.getString(1);
                  }
                  
              }
              }
            }catch(Exception e){
                    out.print(e.getMessage());
                }
                
             
             
             
             
             
             
        %>
        
        <div> 
            <jsp:include page="mainHeader.jsp"></jsp:include>
        </div>           
        <div class="mainProfileBody"  >                       
            <div class="updateDetail Basic">
                            <header>
                                Basic Information
                            </header>
                            <label>Name<Span><%=name%></Span></label>
                            <label>Date of Birth<span><%=dob%></span></label>
                            <label>Gender<span><%=gender%></span></label>
                            <label>Marital Status<span><%=m_st%></span></label>   
                            <label>Father Name<span><%=father_name%></span></label> 
                            <label>Mother Name<span><%=mother_name%></span></label> 
                            <label>Spouse Name<span><%=spouse_name%></span></label>                            
                            
                            <div class="EditButton" style="float: right;  width: 100%;margin-top: -8px;">                                
                               <a href="#Basic-Info" class="login-window"><img src="images/edit.png" style="width:60px;height: auto;z-index: 0"/></a>
                            </div>
                        </div>
                        <div class="updateDetail address">
                            <header>
                                    Contact Information
                            </header>
                            <label>House No. <span><%=H_No%></span></label>
                            <label>Flat No.<span><%=F_No%></span></label>
                            <label>Building No.<span><%=B_No%></span></label>
                            <label>Street/Road No.<span><%=S_No%></span></label>         
                            <label>Area Landmark<span><%=landmark%></span></label>         
                            <label>City<span><%=city%></span></label>       
                            <label>State<span><%=state%></span></label>       
                            <label>Country<span><%=country%></span></label>       
                            <label>Pin Code<span><%=pin%></span></label>       
                            <label>Mobile Phones<span><%=mob%></span></label>       
                            <label>Landline No.<span><%=landline%></span></label>             
                            <label>Email<span style="text-transform: lowercase;"><%=email%></span></label>       
                             <div class="EditButton" style="float: right;  width: 100%;margin-top: -8px;">                                
                                <a href="#Address" class="login-window"><img src="images/edit.png" style="width:60px;height: auto;z-index: 0"/></a>
                            </div>
                        </div>                 
                        <div class="updateDetail Bank">
                            <header>
                                    Bank Detail
                            </header>
                            <label>Bank Name<span><%=Bank_Name%></span></label>
                            <label>Branch Name<span><%=Branch_name%></span></label>
                            <label>Branch Address<span><%=Branch_add%></span></label>
                            <label>IFSC CODE<span><%=ifsc%></span></label>         
                            <label>Account No.<span><%=account%></span></label>                     
                             <div class="EditButton" style="float: right;  width: 100%;margin-top: -8px;">                                
                                <a href="#EditBankInfo" class="login-window"><img src="images/edit.png" style="width:60px;height: auto;z-index: 0"/></a>
                            </div>
                        </div>   
                             
            <div class="updateDetail Id">
                            <header>
                                Identity Proofs
                            </header>
                            <label>Driving License<span><%=DLNo%></span></label>
                            <label>Pan Card<span><%=PanNo%></span></label>
                            <label>Aadhar Card<span><%=Aadhar%></span></label>
                            <label>Passport<span><%=Passport%></span></label>         
                            <label>Ration Card<span><%=Ration%></span></label>         
                            <label>Voter Id<span><%=VoterId%></span></label>     
                            <label>Id issue by central/State Gov.<span><%=other%></span></label>     
                             <div class="EditButton" style="float: right;  width: 100%;margin-top: 0px;">                                
                                <a href="#EditIDInfo" class="login-window"><img src="images/edit.png" style="width:60px;height: auto;z-index: 0"/></a>
                            </div>
                             
                        </div>            
                             
                        <div class="updateDetail AddressProof">
                            <header>
                                    Address Proofs
                            </header>
                            <label>Ration Card</label>
                            <label>Electric Bill</label>
                            <label>Phone Bill</label>
                            <label>Passport</label>         
                            <label>Employee Certificate</label>         
                            <label>Flat allot. or Possession Letter</label>     
                            <label>House Reg. Process</label>     
                             <div class="EditButton" style="float: right;  width: 100%;margin-top: 0px;">                                
                                <a href="#EditAddressProofInfo" class="Edit-Window"><img src="images/edit.png" style="width:60px;height: auto;z-index: 0"/></a>
                            </div>
                        </div>
                             <div class="userimage updateDetail" >
                                 <header>
                                    User Image
                                 </header>
                                 <img src="Pic.jsp?imgid=<%=userID%>"/>
                                 <div class="EditButton" style="float: right;  width: 100%;margin-top: 10px;">                                
                                <a href="#EditIDInfo" class="Edit-Window"><img src="images/edit.png" style="width:60px;height: auto;z-index: 0"/></a>
                            </div>
                             </div>
                       
        </div>                            
 
   <div class="container">
    <div id="content">                                   
   <div id="Basic-Info" class="login-popup">
        <a href="#" class="close"><img src="images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
        <div class="panel panel-primary">
            <div class="panel-heading">
                Update Your Basic Information
            </div>
            <div class="panel-body">
          <p:form action="UpdateBasicInfo" method="post">
              <table style="width: 80%;">
              <tr>
                  <td>First Name*</td>
                  <td><input type="text" class='textBox' name="fName" value="<%=fname%>" required="true" readonly="true"/></td>
              </tr>        
              
               <tr>
                  <td>Middle Name*</td>
                  <td><input class='textBox' type="text" name="mName" value="<%=mname%>"/></td>
              </tr> 
              <tr>
                  <td>Last Name*</td>
                  <td><input class='textBox' type="text" name="lName" value="<%=lname%>" required="true" readonly="true" /></td>
              </tr>
              
              <tr>
                  <td>Date of Birth*</td>
                  <td><input class='textBox' type="text" name="dob" value="<%=dob%>" required="true"  ></td>
              </tr>
              
              <tr>
                  <td>Gender*</td>
                  <td><input class='textBox' type="text" name="gender" required="true" value="<%=gender%>"/></td>
              </tr>
              
              <tr>
                  <td>Marital Status*</td>
                  <td><input class='textBox' type="text" name="marital_status" value="<%=m_st%>" required="true"/></td>
              </tr>
              
              <tr>
                  <td>Father Name*</td>
                  <td><input class='textBox' type="text" name="fatherName" value="<%=father_name%>" required="false" readonly="true"/></td>
              </tr>
              
              <tr>
                  <td>Mother Name*</td>
                  <td><input class='textBox' type="text" name="motherName" value="<%=mother_name%>" /></td>
              </tr>
              
              <tr>
                  <td>Spouse Name*</td>
                  <td><input class='textBox' type="text" name="spouseName" value="<%=spouse_name%>" /></td>
              </tr>
              </table>                  
             <div class="panel-footer">
               <input type="submit" value="Submit" class="btn btn-success"/>
               <input type="submit" value="Close" class="btn btn-primary"/>               
             </div>
         </p:form>         
   </div>
   </div>
 </div>
</div>
</div>
                                 
                                 
                                 
                                 
                                 
     <div class="container">
    <div id="content">                                   
   <div id="EditIDInfo" class="login-popup">
        <a href="#" class="close"><img src="images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
        <div class="panel panel-primary">
            <div class="panel-heading">
                Update your Identity Proofs.
            </div>
            <div class="panel-body">
          <p:form action="UpdateIdInfo" method="post">
              <table style="width: 80%;">
              <tr>
                  <td>Driving License No*</td>
                  <td><input type="text" class='textBox' name="dlno" value="<%=DLNo%>" required="true" readonly="true"/></td>
              </tr>        
              
               <tr>
                  <td>Pan Card No*</td>
                  <td><input class='textBox' type="text" name="panno" value="<%=PanNo%>"/></td>
              </tr> 
              <tr>
                  <td>Aadhar Card No</td>
                  <td><input class='textBox' type="text" name="aadhar" value="<%=Aadhar%>"  readonly="true" /></td>
              </tr>
              
              <tr>
                  <td>Passport No.</td>
                  <td><input class='textBox' type="text" name="passport" value="<%=Passport%>"   ></td>
              </tr>
              
              <tr>
                  <td>Ration Card No</td>
                  <td><input class='textBox' type="text" name="ration" required="true" value="<%=Ration%>"/></td>
              </tr>
              
              <tr>
                  <td>ID issue by State/Central Gov</td>
                  <td><input class='textBox' type="text" name="govid" value="<%=other%>" /></td>
              </tr>
              
              
              </table>                  
             <div class="panel-footer">
               <input type="submit" value="Submit" class="btn btn-success"/>
               <input type="submit" value="Close" class="btn btn-primary"/>               
             </div>
         </p:form>         
   </div>
   </div>
 </div>
</div>
</div>
                                 
                                 
                                 
                                 
        
                                 
                                 
  <div class="container">
    <div id="content">                                   
   <div id="EditBankInfo" class="login-popup">
       <a href="#" class="close" style="z-index: 1"><img src="images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
       <div class="panel panel-primary">
            <div class="panel-heading">
                Update Your Bank Deatils
            </div>
            <div class="panel-body"> 
       <p:form action="UpdateBankDetail" method="post">
           <table style="width: 80%">
               <tr>
                   <td>Bank Name</td>
                   <td><input class='textBox' type="text" name="bankname" value="<%=Bank_Name%>" required="true"/></td>
               </tr>
               <tr>
                   <td>Branch Name</td>
                   <td><input class='textBox' type="text" name="branchname" value="<%=Branch_name%>"/></td>
               </tr>
               <tr>
                   <td>Branch Address</td>
                   <td><input class='textBox' type="text" name="branchaddress" value="<%=Branch_add%>" required="true"  />  </td>
               </tr>
               
               <tr>
                   <td>IFSC Code</td>
                   <td><input class='textBox' type="text" name="ifsc" value="<%=ifsc%>" required="true"/></td>
               </tr>
               <tr>
                   <td>Account Number</td>
                   <td><input class='textBox' type="text" name="account" required="true" value="<%=account%>"/></td>
               </tr>
               
           </table>
       
               <div class="panel-footer">
                   <input type="submit" value="Submit" class="btn btn-success"/>
                   <input type="submit" value="Close" class="btn btn-primary"/>               
               </div>       
                     
         </p:form>         
       </div>                
       </div>
   </div>
 </div>
</div>
                          
                                 
                                 
                                 
                                 
                                 
                                 
                                 
  
                             
 <div class="container">
    <div id="content">                                   
   <div id="Address" class="login-popup">
       <a href="#" class="close" style="z-index: 1"><img src="images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
       <div class="panel panel-primary">
            <div class="panel-heading">
                Update Your Address
            </div>
            <div class="panel-body"> 
       <p:form action="UpdateAddress" method="post">
           <table style="width: 80%">
               <tr>
                   <td>House No</td>
                   <td><input class='textBox' type="text" name="HNo" value="<%=H_No%>" required="true"/></td>
               </tr>
               <tr>
                   <td>Flat No</td>
                   <td><input class='textBox' type="text" name="FNo" value="<%=F_No%>"/></td>
               </tr>
               <tr>
                   <td>Building No.</td>
                   <td><input class='textBox' type="text" name="BNo" value="<%=B_No%>" required="true"  />  </td>
               </tr>
               
               <tr>
                   <td>Street/Road Name.</td>
                   <td><input class='textBox' type="text" name="SNo" value="<%=S_No%>" required="true"/></td>
               </tr>
               <tr>
                   <td>Area Landmark</td>
                   <td><input class='textBox' type="text" name="landmark" required="true" value="<%=landmark%>"/></td>
               </tr>
               <tr>
                   <td>City</td>
                   <td><input class='textBox' type="text" name="city" value="<%=city%>" required="true"/></td>
               </tr>
               <tr>
                   <td>State</td>
                   <td><input class='textBox' type="text" name="state" value="<%=state%>" required="true"/></td>
               </tr>
               
               <tr>
                   <td>Country</td>
                   <td><input class='textBox' type="text" name="country" value="<%=country%>" required="false"/></td>
               </tr>
               
               <tr>
                   <td>Pin Code</td>
                   <td><input class='textBox' type="text" name="pin" value="<%=pin%>" required="false"/> </td>
               </tr>
               <tr>
                   <td>Mobile Number</td>
                   <td><input class='textBox' type="text" name="mob" value="<%=mob%>" required="false"/>  </td>
               </tr>
               <tr>
                   <td>Landline No</td>
                   <td><input class='textBox' type="text" name="landline" value="<%=landline%>" /></td>
               </tr>
               <tr>
                   <td>Email Id</td>
                   <td><input class='textBox' type="text" name="email" value="<%=email%>" required="false"/></td>
               </tr>
           </table>
       
               <div class="panel-footer">
                   <input type="submit" value="Submit" class="btn btn-success"/>
                   <input type="submit" value="Close" class="btn btn-primary"/>               
               </div>       
                     
         </p:form>         
       </div>                
       </div>
   </div>
 </div>
</div>
                    
       
       
    
       
       
       
       
       
       
       
       <div style="margin-left: 0px; width: 100%;">
           <jsp:include page="Footer.jsp"></jsp:include>    
       </div>
       
    
   </body>
</html>
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                     
