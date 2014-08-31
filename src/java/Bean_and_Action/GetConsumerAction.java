/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Naushad Ahmad
 */
public class GetConsumerAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            GetConsumerBean obj = (GetConsumerBean)form;
            String buffer = "<table id=\"ptable\">\n" +
"                <th>S.No.</th>\n" +
"                <th>Consumer No.</th>\n" +
"                <th>Consumer Name</th>\n" +
"                <th>Address</th>\n" +
"                <th>Seeded with IOCL?</th>\n" +
"                <th>Link With Bank</th>\n" +
"                <th>Total Refill Quantity</th>\n" +
"                <th>Subsidized Refill Quantity</th>\n" +
"                <th>Approx Subsidy(Rs.)</th>";
        
                Connection con = Data.getConnection();
                Statement st = con.createStatement();
                String query = "select c.cid,u.fname,u.mname,u.lname,u.House_no,u.housingComplex_buildingNo,u.Hname_flatNo,u.area_landmark "
                        + "from Consumer as c inner join Distributor as d on (c.distributorId = d.id) inner join [dbo].[user] as u on "
                        + "(u.userId = c.userId) where distributor_name='"+obj.getDist()+"'";
                ResultSet rs = st.executeQuery(query);
                String name = "",address="",cid="";
                String imgA="",imgB="";
                int i = 1;
                while(rs.next()){
                    cid = rs.getString("cid");
                    name = rs.getString("fname") + " "+rs.getString("mname")+" "+rs.getString("lname");
                    address = rs.getString("House_no")+" "+rs.getString("housingComplex_buildingNo")+" "+rs.getString("Hname_flatNo")+" "+rs.getString("area_landmark");
                    if(i%3==0){
                        imgA = "redicon.jpg";
                        imgB = "greenicon.jpg";
                    }
                    else{
                        imgA = "greenicon.jpg";
                        imgB = "redicon.jpg";
                    }
                    if(i%4==0){
                        imgA = "naicon.jpg";
                    }
                    if(i%5==0){
                        imgB = "naicon.jpg";
                    }
                    buffer += "<tr>\n" +
"                    <td>"+i+"</td>\n" +
"                     <td>"+cid+"</td>\n" +
"                     <td style=\"text-align: left;\">"+name+"</td>                   \n" +
"                    <td style=\"text-align: left;\">"+address+"</td>\n" +
"                    <td><img src=\"images/"+imgA+"\"/></td>\n" +
"                    <td><img src=\"images/"+imgB+"\"/></td>\n" +
"                    <td>12</td>\n" +
"                    <td>9</td>\n" +
"                    <td>4590</td>                   \n" +
"                </tr>";
                    i++;
                }
                buffer +="</table>";
                response.getWriter().print(buffer);
                con.close();
                return  null;        
        
    }
}
