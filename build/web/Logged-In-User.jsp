<%-- 
    Document   : Logged-In-User
    Created on : 21 Mar, 2014, 9:25:41 AM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.sql.* ;"%>
       <%! String email,uid, cid,fname,lname,mname,name,add,shop_no,distributor_name,street_name,city,state,pin,contact,serviceCell,ctype,mob,landline ;%>
       <%
             
             Connection con = Bean_and_Action.Data.getConnection();
             String consumerId = (String)session.getAttribute("c_id");
             //String q = "select consumerId"
             String query = "select c.cid,u.fname,u.mname,u.lname,d.distributor_name,d.shop,d.Street,d.city,d.pin,d.state,d.Contact,d.servicecell,cc.consumercategory,u.userid,u.email,cc.priority,u.phone,u.landline from consumer as c inner join [dbo].[user] as u on (c.userid=u.userId) inner join distributor as d on (c.distributorId=d.id) inner join consumercategory as cc on (c.consumercategory=cc.id) where c.cid='"+consumerId+"'";
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(query);                          
             if(rs.next()){
                 cid = rs.getString(1);
                 fname = rs.getString(2);
                 mname = rs.getString(3);
                 lname =rs.getString(4);
                 name = fname+" ";
                 if(mname!=null){
                     name = name + mname +" " + lname;
                 }
                 else{
                     name = name + lname ;
                 }
                 distributor_name = rs.getString(5);
                 shop_no = rs.getString(6);
                 street_name = rs.getString(7);
                 city = rs.getString(8);
                 pin = rs.getString(9);
                 state = rs.getString(10);
                 contact = rs.getString(11);
                 serviceCell = rs.getString(12);
                 ctype = rs.getString(13);
                 uid = rs.getString(14);
                 email = rs.getString(15);
                 ctype +=" , "+rs.getString(16);
                 mob = rs.getString(17);
                 landline = rs.getString(18);
             con.close();
             }
             add = distributor_name+", Shop No :"+shop_no+", Street No/Name: "+street_name;
             HttpSession sess = request.getSession(false);
             sess.setAttribute("ID", uid);
             sess.setAttribute("dist", distributor_name);
             sess.setAttribute("email", email);
             sess.setAttribute("mob", mob);
             sess.setAttribute("contact", landline);
             sess.setAttribute("add", add);
             sess.setAttribute("city", city);
             sess.setAttribute("name", name);
             
       %>
         <link rel="stylesheet" href="css/LandingPagestyle.css" type="text/css"/>       
    </head>
    <body style="margin: 0px;padding: 0px;">
         <div class="Logged-In-User" >
             <header style="text-align: center;">
                User Detail
            </header>
            <label>Consumer No:<span><%=cid%></span> </label>
            <label>Consumer Name: <span><%=name%></span></label>
            <label>Distributor Address:<span><%=add%></span></label>
            <label>Distributor City: <span><%=city%></span></label>
            <label>Distributor Phone: <span><%=contact%></span></label>
            <label>Service Cell: <span><%=serviceCell%></span></label>
            <label>Type of Connection: <span><%=ctype%></span></label>
            <label>Preferred Delivery: <span>No</span></label>
            <div class="User-Image">
                <img src="Pic.jsp?imgid=<%=uid%>" />
            </div>            
        </div>
    </body>
</html>
