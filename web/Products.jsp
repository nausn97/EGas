<%-- 
    Document   : Products
    Created on : 22 Mar, 2014, 2:05:22 AM
    Author     : Naushad Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@taglib uri="http://struts.apache.org/tags-html-el" prefix="p" %>
        <link type="text/css" href="css/bootstrap.css"/>
        <style>
            .Products{
                margin-left: 350px;
                width: 900px;          
                background-image: url('../images/images.jpg');
                
                z-index: 1;
                position: absolute;
            }       
            .Products table {
                padding: 10px;
            }
            .Products table tr td{
                width: 300px;
                height: 50px;                
                text-align: center;
                margin-bottom: 40px;

            }
            .Products img:hover{
                width: 300px;
                height: auto;
            }
            .Products table table{
                border: 1px #3071a9 solid;
                
                
            }
            .Products table tr{
                height: 50px;
                margin-bottom: 30px;
            }
            .Products table table tr td{
                text-align: center;
                
            }
            .Products img{
                height: 250px;
                width: 200px;
            }
        </style>
    </head>
    <body>
        <div class="Products">            
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Products Available in Lovely Gas Seva
                </div>
                <div class="panel-body" >
                    <table style="position: relative">
                        <tr>
                            <td style="margin-bottom: 20px;">
                                <table>
                                    <tr>
                                        <td style="text-align: center;background: "> <button class="btn btn-success" style="width: 60%;">Rs.500/-</button></td>
                                        
                                    </tr>
                                    <tr>
                                        <td><img src="home_imgs/product1.gif"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;background: "><b style="font-family: sans-serif,tahoma;color: #285e8e"><i> 14.2 Kg Domestic Household Cylinder</i></b></td>
                                    </tr>
                                    <tr>
                                        <td><button class="btn btn-info" style="width: 90%;">View Detail</button></td>
                                    </tr>
                                </table>
                                
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td style="text-align: center;background: "> <button class="btn btn-success" style="width: 60%;">Rs.1500/-</button></td>
                                        
                                    </tr>
                                    <tr>
                                        <td><img src="home_imgs/product2.gif"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;background: "><b style="font-family: sans-serif,tahoma;color: #285e8e"><i> 19 Kg Commercial Cylinder</i></b></td>
                                    </tr>
                                    <tr>
                                        <td><button class="btn btn-info" style="width: 90%;">View Detail</button></td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td style="text-align: center;background: "> <button class="btn btn-success" style="width: 60%;  ">Rs.300/-</button></td>
                                        
                                    </tr>
                                    <tr>
                                        <td><img src="home_imgs/product3.gif"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;background: "><b style="font-family: sans-serif,tahoma;color: #285e8e"><i> 5 Kg Domestic/Commercial Cylinder</i></b></td>
                                    </tr>
                                    <tr>
                                        <td><button class="btn btn-info" style="width: 90%;">View Detail</button></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td style="text-align: center;background: "> <button class="btn btn-success" style="width: 60%;  ">Rs.15000/-</button></td>
                                        
                                    </tr>
                                    <tr>
                                        <td><img src="home_imgs/product4.gif"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;background: "><b style="font-family: sans-serif,tahoma;color: #285e8e"><i> Auto gas for Vehicles</i></b></td>
                                    </tr>
                                    <tr>
                                        <td><button class="btn btn-info" style="width: 90%;">View Detail</button></td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td style="text-align: center;background: "> <button class="btn btn-success" style="width: 60%;  ">Rs.100000/-</button></td>
                                        
                                    </tr>
                                    <tr>
                                        <td><img src="home_imgs/product5.gif"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;background: "><b style="font-family: sans-serif,tahoma;color: #285e8e"><i> Oil Tanker</i></b></td>
                                    </tr>
                                    <tr>
                                        <td><button class="btn btn-info" style="width: 90%;">View Detail</button></td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td style="text-align: center;background: "> <button class="btn btn-success" style="width: 60%;  ">Rs.2500/-</button></td>
                                        
                                    </tr>
                                    <tr>
                                        <td><img src="home_imgs/product6.gif"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;background: "><b style="font-family: sans-serif,tahoma;color: #285e8e"><i> Non Fuel Products</i></b></td>
                                    </tr>
                                    <tr>
                                        <td><button class="btn btn-info" style="width: 90%;">View Detail</button></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel-footer">
                    Now You can order any products online.
                </div>
            </div>
        </div>
        
        <div style="margin-top: 950px">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        
    </body>
</html>
