<%-- 
    Document   : Contact
    Created on : 22 Mar, 2014, 1:00:09 AM
    Author     : Naushad Ahmad
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.sql.*"%>
        <style>
            .Contact{
                width: 900px;         
                margin-left: 350px;
                
            }
            .Contact header{
                background: #3763ba;
                color: white;
                text-align: center;
            }
            .postalAddress{
                width:260px;
                margin-right: 20px;
                height: 200px;
                margin-left: 10px;
                background: #E5E5E5;
                padding: 0px 10px 0 10px;                
            }
            .general{
                width:260px;
                margin-right: 20px;
                height: 200px;
                margin-top: -200px;
                margin-left: 300px;
                background: #E5E5E5;
                padding: 0px 10px 0 10px;                
            }
            .Dist{
                width:260px;
                margin-right: 20px;
                height: 200px;
                margin-top: -200px;
                margin-left: 590px;
                background: #E5E5E5;
                padding: 0px 10px 0 10px;                
            }
           .Format label{
                font-family: tahoma,sans-serif;
                font-size: 14px;
                font-weight: normal;                
             
                color:#ec971f;
             
            }
            .Format span{
                margin-left: 100px;
                color:#ec971f;
                //float: left;
             
            }
            .Dist table{
                color: #ec971f;font-family: tahoma;font-size: 14px;
            }
            .Dist table td{
                color: #ec971f;font-family: tahoma;font-size: 14px;
            }
            .Dist table th{
                background: #3763ba;
                color: white;
                text-align: center;
            }
            .general span{
                width: 200px;
                //margin-left: -0px;
                float: left;
                margin-top: -20px;
            }
        </style>
    </head>
    <%@page import="java.sql.* ;"%>
    <%! String d_name,s_no,srn,city,pin,state,mob,cell ;%>
    <%
             
             Connection con = Bean_and_Action.Data.getConnection();
             String consumerId = (String)session.getAttribute("c_id");             
             String query = "select d.distributor_name,d.shop,d.street,d.city,d.pin,d.state,d.contact,d.servicecell from distributor as d inner join consumer as c on (c.distributorid = d.id) where c.cid = '"+consumerId+"'";
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(query);             
             if(rs.next()){
                 d_name = rs.getString(1);
                 s_no = rs.getString(2);
                 srn = rs.getString(3);
                 city = rs.getString(4);
                 pin = rs.getString(5);
                 state = rs.getString(6);
                 mob = rs.getString(7);
                 cell = rs.getString(8);
             }
             con.close();
   %>
   <link type="text/css" href="css/bootstrap.css"/>
    <body>
        <div class="Contact">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Contact Us
                </div>
                <div class="panel-body" style="padding-left: 0px;">
                    
                    <div style="float: left; background: #E5E5E5; opacity: 0.8;width: 73%;height: 250px;border-radius: 10px;color: #ec971f;">
                        <div  style="padding: 20px;line-height: 20px;margin-bottom: 15px;">
                            Distributor Name :   <%=d_name%><br/>
                            Address          :   <%=s_no%> &nbsp;<%=srn%>&nbsp;<%=city%>&nbsp;<%=pin%>&nbsp;<%=state%><br/>
                            Mobile Number    :  <%=mob%>
                            Landline Number  :  <%=cell%>
                            
                        </div>
                            <div  style="padding: 20px;line-height: 20px;margin-bottom: 30px;">
                            Toll Free  : 1800 11 3211 <br/>
                            Cenral Office Landline : 011 2312232<br/>
                            Fax Number : 011 2122129 <br/>
                            Email : e-gas@live.com <br/>
                            
                        </div>
                        
                    </div>
                    <img src="home_imgs/download.jpg">
                </div>
            </div>
        </div>
                            <div style="width: 100%;">
                                <jsp:include page="Footer.jsp"></jsp:include>
                            </div>
                            
    </body>
</html>
