<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%


        
if(request.getParameter("imgid")!=null && request.getParameter("imgid")!="")
{
	int id =  Integer.parseInt(request.getParameter("imgid"));        
	String filename = "image"+id+".jpg";	
	try{      
		
                Connection con = Bean_and_Action.Data.getConnection();
		Statement st1=con.createStatement();		
                String strQuery="select image from [dbo].[user] where userid="+id+";";
		ResultSet rs1 = st1.executeQuery(strQuery);	
		String imgLen="";				
		if(rs1.next()){
                        imgLen = rs1.getString(1);
			int len = imgLen.length();
			byte [] rb = new byte[len];
			InputStream readImg = rs1.getBinaryStream(1);
			int index=readImg.read(rb, 0, len);  
			st1.close();
			response.reset();
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			response.getOutputStream().write(rb,0,len); 
			response.getOutputStream().flush();        
		}
	}
	catch (Exception e){
		e.printStackTrace();
	}
}
%>
