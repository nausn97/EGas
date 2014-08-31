<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    
    <%@taglib uri="http://struts.apache.org/tags-tiles" prefix="p" %>

</head>

<body>
    <div style="min-height: 100%;vertical-align: bottom;">
<table width="100%" border="0" cellpadding="0" cellspacing="0">  
    <tr>
      <td width="100%"  valign="top"><p:insert attribute="HEADER"></p:insert></td>
    </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">  
  <tr>
    <td colspan="2" rowspan="3" valign="top"><p:insert attribute="LEFT-PANEL"></p:insert></td>    
  </tr>
  <tr>    
    <td valign="top"><p:insert attribute="LOGGED-IN-USER"></p:insert></td>    
  </tr>
  <tr>    
    <td rowspan="2" valign="top"><p:insert attribute="SERVICES"></p:insert></td>    
  </tr>     
   
  
  
</table>
  </div>
  
</body>
</html>
