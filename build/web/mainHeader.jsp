
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width,initial-scale=1.0"> 
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/bootstrap.min.css" rel="stylesheet">
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
                <script src="js/bootstrap.js"></script>
		<script src="js/bootstrap.min.js"></script>
                <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>
	</head>
        <%@page import="java.sql.*;"%>
       <body>
        <%!String uid,c_id,rt;%>
        <%! int badge;%>
        <%
            HttpSession se = request.getSession(false);
            uid = (String)se.getAttribute("userid");
            c_id = (String)se.getAttribute("c_id");            
            Connection con = Bean_and_Action.Data.getConnection();
            String s = "select count(*) from notification where cid='"+c_id+"' and status=0";            
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(s);
            if(rs.next()){
                badge = rs.getInt(1);
                se.setAttribute("count", badge);
                if(badge>1){
                    rt = "red";
                }
                else{
                    rt = "white";
                }
            }
            
            
        con.close()  ;
        %>
        <div class="navbar navbar-inverse navbar-static-top" style="background-color: rgb(59,82,160);">
			<div class="container">
					<a href="#" class="navbar-brand">Lovely Gas Seva</a>
                                        
					<button class="navbar-toggle" data-toggle="collapse" data-target="#navHeaderCollapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse" id="navHeaderCollapse">
                                            
						<ul class="nav navbar-nav navbar-right">
                                                    <!--<form class="navbar-search"><input type="text" class="search-query" placeholder="Search"></form> -->
                                                    <li><p:link action="mHome">Home</p:link></li>
							<li ><a href="#">About Us</a></li>
                                                        <li class="dropdown">
                                                            <p:link action="message1">Message&nbsp;&nbsp;
                                                                   <b class="badge" style="color: <%=rt%>;"><%=badge%></b> 
                                                            </p:link>
                                                                    
                                                        </li>
							<li class="dropdown">
                                                            <a href="#submenu" class="dropdown-toggle open" data-toggle="dropdown" ><img src="Pic.jsp?imgid=<%=uid%>" width="20px" height="25px">&nbsp;&nbsp;Account<b class="caret"></b></a>
								<ul class="dropdown-menu" id="submenu">
                                                                    <li><p:link action="password">Change Password</p:link></li>
									<li><a href="#">Help</a></li>
									<li><p:link action="logout">Logout</p:link></li>

								</ul>
								
							</li>
							
							

						</ul>
					</div>
			</div>

		</div>   
		<script type="text/javascript">
		jQuery(document).ready(function($) 
		{
	    	
	    	$('a.open').click(function() {
                                var clk = $(this).attr('href');
                                //alert(clk);
				if ($(clk).is(':visible')) {                                        
					$(clk).slideUp();				   
				} 
				else {
					$(clk).slideDown();
				}
			
			return false;
			});
		});
		
		</script>
		
	</body>      
        
</html>