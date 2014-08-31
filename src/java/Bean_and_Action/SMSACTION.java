/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Naushad Ahmad
 */
public class SMSACTION extends org.apache.struts.action.Action {

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
            SMSBEAN obj = (SMSBEAN)form;            
            String data = "";            
            data += "username=" + URLEncoder.encode("apoorv1993", "ISO-8859-1");
            data += "&password=" + URLEncoder.encode("egasseva", "ISO-8859-1");
            data += "&message=" + URLEncoder.encode("Your Order Number is : 10001", "ISO-8859-1");
            data += "&want_report=1";
            data += "&msisdn="+obj.getMobile();

            // Send data
            URL url = new URL("http://bulksms.vsms.net:5567/eapi/submission/send_sms/2/2.0");            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(data);
            wr.flush();

            // Get the response
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                // Print the response output...
                System.out.println(line);
            }
            wr.close();
            rd.close();
            response.getWriter().print("SMS Has Been Sent to your mobile :)");        
            return null;
    }
}
