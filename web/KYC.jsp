
<html>
<head>
    
    <link href="css/generic-notForMcTabs.css" rel="stylesheet" type="text/css" />
    <link href="css/mctabs.css" rel="stylesheet" type="text/css" />
    <script src="js/javascript-tabs.js" type="text/javascript"></script>
    <style>
        .consumerDetail{
            width:570px;
            padding-left: 20px;
            border:1px #999 solid;
            //box-shadow: 0 0 1px #CCC;           
           // height: auto;
            //position: fixed;
            padding-top: 10px;
            margin-left: 10%;     
            
            
        }
        .bankDetails{
            width:570px;
            padding-left: 20px;
            //border:1px #999 solid;
            //box-shadow: 0 0 1px #CCC;           
            //height: auto;
            //position: fixed;
            padding-top: 10px;
            margin-left: 10%;
            
            
        }
        .uploadDocuments{
            width:570px;
            padding-left: 20px;
            //border:1px #999 solid;
            //box-shadow: 0 0 1px #CCC;           
            //height: auto;
            //position: fixed;
            padding-top: 10px;
            margin-left: 10%;
            
        }
            
        
        label{
            float:left;
            width:200px;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 5px;
           // position: relative;
            font-family: sans-serif;
            font-size: 14px;
            margin-bottom: 10px;
            height: 25px;
        }
         select{
            //float:left;
            width:200px;
            margin-bottom: 10px;
            height: 25px;
            font-weight: bold;
            font-size: 14px;
            color: #B82020;
        }
        
        .textBox{
            //float:left;
            width:300px;
            margin-bottom: 10px;
            height: 25px;
            font-weight: bold;
            font-size: 14px;
            color: #999999;
        }
        
        .pDetail{
            width:570px;
            padding-left: 20px;
            border:1px #000 solid;
            //box-shadow: 0 0 1px #CCC;
           // margin-left: 100px;
            //margin-top: 30px;
            //height: auto;
            //position: fixed;          
            margin-top:10px;
            padding-top: 10px;
            margin-left: 10%;
            
        }
        .cDetail {
            width:570px;
            padding-left: 20px;
            border:1px #000 solid;
            //box-shadow: 0 0 1px #CCC;           
            //height: auto;
            //position: fixed;          
            margin-top:10px;
            padding-top: 10px;
            margin-left: 10%;
        }
        
        .proof table{
        
        
        //    border:1px #000 solid;
            box-shadow: 0 0 1px #CCC;
          
        }
        .proof table td{
            border:1px #CCC solid;
        }
        .proof table th{
            background: #f0ad4e;
            color:#B82020;
            height: 30px;
            font-size: 16px;
        }
        .proof h3{
            margin-left: 10px;;
        }
        .proof{
            width:90%;
            margin-left: 10%;
        }
        .arrow{
            width: 900px;
            margin-left: 7%;
            
        }
        .arrow img{
            width: 150px;
            height: auto;
            padding: 5px;
        }
        .proof table tr td input{
            width: 100%;
        }
    </style>
    <script>
        function myFun(){
            element = document.getElementById("1");
            element.src = "images/11.png";
            
        }
        function myFun1(){
            element = document.getElementById("2");
            element.src = "images/11.png";
        }
        function myFun2(){
            element = document.getElementById("3");
            element.src = "images/12.png";
        }
        function myFun3(){
            element = document.getElementById("4");
            element.src = "images/13.png";
        }
        function myFun4(){
            element = document.getElementById("5");
            element.src = "images/14.png";
        }
        
    </script>
    <%@page import="java.sql.*" %>
    
    <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>
    
</head>
<body class="bd1">
    <p:form action="updateKYC" method="post">
    <div>
        <jsp:include page="mainHeader.jsp"></jsp:include>
    </div>
    
    <div id="demopage">
        <h1>Know Your Customers (KYC)</h1>        
        <div class="arrow">
        <img src="images/1.png" id="1">
        <img src="images/2.png" id="2">
        <img src="images/3.png"id="3">
        <img src="images/4.png" id="4">
        <img src="images/5.png"id="5">
        
    </div>
        
        <%! String cid,salu,name,fname,mname,lname,gender,mar_stat,father_name,mother_name,spouse_name,m_st,dob,H_No,F_No,B_No,S_No,landmark,city,state,country,pin,mob,landline,email,c_id ;%>
        <%! String Bank_Name,Branch_name,Branch_add,ifsc,account ;%>
        <%! String DLNo="",PanNo="",Aadhar="",Passport="",Ration="",VoterId="",other="";%>
    
        <%
            try{
            
            Connection con = Bean_and_Action.Data.getConnection();
            HttpSession se = request.getSession(false);
            String userid = (String)se.getAttribute("userid");
            cid = (String)se.getAttribute("c_id");
            String query = "select * from [dbo].[user] as u inner join consumer as c on (u.userid = c.userid) where c.userid="+userid;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
              salu=rs.getString("salutation");
              fname=rs.getString("fname");
              mname=rs.getString("mname");
              lname=rs.getString("lname");
              gender=rs.getString("gender");
              dob=rs.getString("dob");
              mar_stat=rs.getString("marital_status");
              father_name=rs.getString("father_name");
              mother_name=rs.getString("mother_name");
              spouse_name=rs.getString("spouse_name");
              H_No=rs.getString("house_no");
              F_No=rs.getString("Hname_flatno");
              B_No=rs.getString("housingcomplex_buildingno");
              S_No=rs.getString("street_roadname");
              landmark=rs.getString("area_landmark");
              city=rs.getString("city");
              state="Punjab";
              pin=rs.getString("pincode");
              landline=rs.getString("landline");
              mob=rs.getString("phone");
              email=rs.getString("email");
              Bank_Name = rs.getString("bank_name");
              Branch_name = rs.getString("branch_name");
              Branch_add = rs.getString("branch_add");
              ifsc = rs.getString("ifsc");
              account = rs.getString("account_no");  
              st.close();
              rs.close();
            }
              
              String q2 = "select p.proofid_no,p.type,c.CID from proof as p inner join consumer as c on (c.consumerId = p.consumerId) where c.cid='"+c_id+"'" ;  
              Statement st2 = con.createStatement();
              ResultSet rs2 = st2.executeQuery(q2);
              while(rs2.next()){
                  if(rs2.getInt(2)==Bean_and_Action.Data.AADHAAR_ADD){
                      Aadhar = rs2.getString(1); 
                      
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.AADHAAR_ID)){
                      Aadhar= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.DRIVINGLICENSE_ADD)){
                      DLNo= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.DRIVINGLICENSE_ID)){
                      DLNo= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.PANCARD_ADD)){
                      PanNo= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.PANCARD_ID)){
                      PanNo= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.PASSPORT_ADD)){
                      Passport= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.PASSPORT_ID)){
                      Passport= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.RATIONCARD_ADD)){
                      Ration= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.RATIONCARD_ID)){
                      Ration= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.VOTERICARD_ADD)){
                      VoterId= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.VOTERICARD_ID)){
                      VoterId= rs2.getString(1);
                  }
                  else if(rs2.getInt(2)==(Bean_and_Action.Data.OTHERID_ADD)){
                      other = rs2.getString(1);
                  }
                  
              }
              con.close();
            }catch(Exception e) {
                out.print(e.getMessage());
            }
            
        %>
        
        <!-- <div class="container1"> -->
        <div class="container1">
            <ul id="tabs1" class="mctabs">
                <li><a href="#view1">Consumer Details</a></li>
                <li><a href="#view2">Address and Contact Details</a></li>
                <li><a href="#view3">Proof Documentation</a></li>
                <li><a href="#view4">Bank Details</a></li>
                <li><a href="#view5">Upload Document</a></li>
            </ul>
            <p:form action="updatekyc" method="post">
            <div class="panel-container">
                <div id="view1">
            <div class="consumerDetail">
                        <label>Salutation</label>
                        <select name="salu">
                            <option value="1" selected="selected">Mr</option>
                            <option value="2" selected="selected">Miss</option>
                            <option value="3" selected="selected">Mrs</option>
                        </select> 
                        <label></label>
                        <label >First Name*</label> <input class='textBox' type="text" name="fName" value="<%=fname%>"readonly="true"/>
                        <label>Middle Name</label> <input class='textBox' type="text" name="mName" value="<%=mname%>"readonly="true"/>
                        <label>Last Name*</label>  <input class='textBox' type="text" name="lName" value="<%=lname%>"readonly="true"/>
                        <label>Consumer ID*</label><input class='textBox' type="text" name="cid"  value="<%=cid%>" readonly="true"/>
                        <label>Date of Birth*</label><input class='textBox' type="text" name="dob" value="<%=dob%>" readonly="true"/>
                        <label>Gender</label> 
                        <select name="gender" required="true">
                            <option value="1">Male</option>
                            <option value="2">Female</option>                            
                        </select> 
                        <label></label>
                        <label>Marital Status *</label> 
                        <select name="marStatus" required="true">
                            <option value="1">Single</option>
                            <option value="2">Married</option>                            
                        </select> 
                        
           </div>
                        <div class="pDetail">
                            <label>Father's Name*</label> <input class='textBox' type="text" name="fathername" value="<%=father_name%>"/>
                            <label>Mother's Name</label> <input class='textBox' type="text" name="mothername" value="<%=mother_name%>"/>
                            <label>Spouse's Name</label> <input class='textBox' type="text" name="spousename" value="<%=spouse_name%>"/>                           
                        </div>
                    <div id="nextButton">
                        <input type="button" value="Next" id="tab1Next" style="float:right;padding:5px; width: 100px;margin-right: 10px;margin-bottom: 10px; border-radius: 5px" onclick="myFun()">
                    </div>
                    
                </div>
                
                <div id="view2">
                    
                    <div class="consumerDetail">
                        
                        <label>House Number*</label> <input class='textBox' type="text" name="hno" value="<%=H_No%>"/>
                        <label>House Name/Flat Floor No.*</label> <input class='textBox' type="text" name="fno" value="<%=F_No%>"/>
                        <label>Housing Complex/Building No.*</label>  <input class='textBox' type="text" name="bno" value="<%=B_No%>"/>                        
                        <label>Street /Road Name*</label><input class='textBox' type="text" name="sno" value="<%=S_No%>"/>                        
                        <label>Area/Landmark</label><input class='textBox' type="text" name="Landmark" value="<%=landmark%>"/>                        
                        <label>District*</label><input class='textBox' type="text" name="district" value="<%=city%>"  />                        
                        <label>State*</label><input class='textBox' type="text" name="state" value="<%=state%>" />                        
                        <label>Pin Code*</label><input class='textBox' type="text" name="pin" value="<%=pin%>"/>                        
                    </div>
                        <div class="cDetail" >
                            <label>Landline Number</label> <input class='textBox' type="text" name="landline" value="<%=landline%>"/>
                            <label>Mobile Number*</label> <input class='textBox' type="text" name="contact" value="<%=mob%>"/>
                            <label>Email Address</label> <input class='textBox' type="text" name="email" value="<%=email%>"/>
                        </div>
                    <div id="nextButton">
                        <input type="button" value="Next" id="tab1Next" style="float:right;padding:5px; width: 100px;margin-right: 10px;margin-bottom: 10px; border-radius: 5px" onclick="myFun1()">
                    </div>
                </div>
                
                
                <div id="view3">
                    <div class="proof">
                    <h3>Identification Proof</h3>
                    <table style="width: 90%">
                        <th>Proof Available</th>
                        <th>Proof Document</th>
                        <th>Identification Number</th>
                        <th>Additional Information</th>
                        <tr>
                            <td align="center" ><input type="checkbox" id="prfDL"></td>
                            <td>Driving License</td>
                            <td><input type="text" name="dl" value="<%=DLNo%>"/></td>
                            <td><input type="text" name="dlAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>PAN CARD</td>
                            <td><input type="text" name="pan" value="<%=PanNo%>"/></td>
                            <td><input type="text" name="panAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Aadhar Card (UID)</td>
                            <td><input type="text" name="aadhar" value="<%=Aadhar%>"/></td>
                            <td><input type="text" name="aadharAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Passport</td>
                            <td><input type="text" name="passport" value="<%=Passport%>"/></td>
                            <td><input type="text" name="passAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Ration Card</td>
                            <td><input type="text" name="ration" value="<%=Ration%>"/></td>
                            <td><input type="text" name="rationAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Voters ID Card</td>
                            <td><input type="text" name="vid" value="<%=VoterId%>"/></td>
                            <td><input type="text" name="vidAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>ID issue by Central/State Gov.</td>
                            <td><input type="text" name="govid" value="<%=other%>"/></td>
                            <td><input type="text" name="govidAdd" value=""/></td>
                        </tr>
                    </table>
                    <h3>Address Proof</h3>
                    
                    <table style="width: 90%">
                        <th>Proof Available</th>
                        <th>Proof Document</th>
                        <th>Identification Number</th>
                        <th>Additional Information</th>
                        <tr>
                            <td align="center" ><input type="checkbox" id="prfDL"></td>
                            <td>Ration card</td>
                            <td><input type="text" name="vration" value="<%=Ration%>"/></td>
                            <td><input type="text" name="vrationAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Electricity Bill</td>
                            <td><input type="text" name="elecbill" value="<%=other%>"/></td>
                            <td><input type="text" name="elecbillAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Phone Bill</td>
                            <td><input type="text" name="phonebill" value="<%=other%>"/></td>
                            <td><input type="text" name="phonebillAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Passport</td>
                            <td><input type="text" name="vpassport" value="<%=Passport%>"/></td>
                            <td><input type="text" name="vpassportAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Employees Certificate</td>
                            <td><input type="text" name="empcert" value="<%=other%>"/></td>
                            <td><input type="text" name="empcertAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>Flat allot. or Possession Letter</td>
                            <td><input type="text" name="flat" value="<%=other%>"/></td>
                            <td><input type="text" name="flatAdd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="checkbox" id="prfDL"></td>
                            <td>House Registration Paper</td>
                            <td><input type="text" name="house" value="<%=other%>"/></td>
                            <td><input type="text" name="houseAdd" value=""/></td>
                        </tr>
                    </table>
                    </div> <!-- proof div -->
                    <div id="nextButton">
                        <input type="button" value="Next" id="tab1Next" style="float:right;padding:5px; width: 100px;margin-right: 10px;margin-bottom: 10px; border-radius: 5px" onclick="myFun2()">
                    </div>
                </div><!-- view 3 div-->
                 <div id="view4">
                     <div class="bankDetails">
                         <label>Bank Name</label> <input class='textBox' type="text" name="bankname" value="<%=Bank_Name%>"/>
                        <label>Branch Name</label> <input class='textBox' type="text" name="branchname" value="<%=Branch_name%>"/>
                        <label>Branch Address</label>  <input class='textBox' type="text" name="branchaddress" value="<%=Branch_add%>"/>
                        <label>IFSC CODE</label><input class='textBox' type="text" name="ifsc" required="false" value="<%=ifsc%>"/>
                         <label>Account Number</label><input class='textBox' type="text" name="account" value="<%=account%>"/>
                     </div>
                 <div id="nextButton">
                        <input type="button" value="Next" id="tab1Next" style="float:right;padding:5px; width: 100px;margin-right: 10px;margin-bottom: 10px; border-radius: 5px" onclick="myFun3()">
                    </div>   
                </div>
                 <div id="view5">
                     <div class="uploadDocuments">
                         <table >
                             <tr style="height: 50px;">
                                 <td style="width: 200px;text-align: center;margin-bottom: 25px;">Image of Applicant's</td>
                                 <td style="width: 200px;text-align: center;margin-bottom: 25px;">
                                     <input  type="file" name="image">
                                 </td>
                             </tr>
                             <tr style="margin-bottom: 25px;">
                                 <td style="width: 200px;text-align: center;margin-bottom: 25px;">Scanned Copy of KYC</td>
                                 <td style="width: 200px;text-align: center;margin-bottom: 25px;">
                                     <input type="file" name="kyc">
                                 </td>
                             </tr>
                         </table>
                         
                         <div id="nextButton">
                        <input type="button" value="Submit" id="tab1Next" style="float:right;padding:5px; width: 100px;margin-right: 10px;margin-bottom: 10px; border-radius: 5px" onclick="myFun4()">
                    </div>
                     </div>
                    
                </div>  
     </div>  <!-- Panel Container div -->
    </p:form>
    </div>  <!-- container 1 -->
    </div>  <!-- demopage div -->
</p:form>
</body>
</html>