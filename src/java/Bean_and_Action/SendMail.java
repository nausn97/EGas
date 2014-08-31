

package Bean_and_Action;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail
{
    public void sendMail(String to,String subject,String textBody, String htmlBody)throws AddressException, MessagingException
    {

        // Get system properties.
        Properties props = System.getProperties();

        // Setup the mail server.
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.starttls.enable","true");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        
        /*props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");*/
        
      Authenticator auth = new MailAuthenticator();

        Session mailSession = Session.getInstance(props, auth);
        // Define the message.
        Message message = new MimeMessage(mailSession);
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
        //For Multiple recipients
      
        String[] recpts = to.split(",");
        InternetAddress[] inet_TO = new InternetAddress[recpts.length];
                for(int i=0; i<recpts.length; i++){
                    inet_TO[i] = new InternetAddress(recpts[i]);
                }
        message.addRecipients(Message.RecipientType.TO, inet_TO);

       message.setFrom(new InternetAddress("Naushad"));

        message.setSubject(subject);
         message.setText(textBody);
        message.setContent(htmlBody, "text/html");

        // Send message
        Transport.send(message);
   }
}

class MailAuthenticator extends Authenticator{
    @Override
    public PasswordAuthentication getPasswordAuthentication() {
           return new PasswordAuthentication("ahmadnaushad5@gmail.com","Love@you_n97");
        }
}