package my.app.stoma.service;

import my.app.stoma.domain.security.User;
import my.app.stoma.service.security.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

/**
 * Created by bmatragociu on 3/24/2014.
 */
@Service
public class MailService {


    @Autowired
    private InternetAddress emailReceiver;
    @Autowired
    UserService userService;



    // Supply your SMTP credentials below. Note that your SMTP credentials are different from your AWS credentials.
    static final String SMTP_USERNAME = "AKIAIWMNJYMTTPCF54GQ";  // Replace with your SMTP username.
    static final String SMTP_PASSWORD = "AgY5sgub53zpqgeXTFB9ftqE+OEqYbcGoSnAOVuSzjeD";  // Replace with your SMTP password.

    // Amazon SES SMTP host name. This example uses the us-east-1 region.
    static final String HOST = "email-smtp.us-west-2.amazonaws.com";

    // Port we will connect to on the Amazon SES SMTP endpoint. We are choosing port 25 because we will use
    // STARTTLS to encrypt the connection.
    static final int PORT = 25;


    public void sendMail(InternetAddress to, String subject, String text) throws MessagingException {


        // Create a Properties object to contain connection configuration information.
        Properties props = System.getProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.port", PORT);

        // Set properties indicating that we want to use STARTTLS to encrypt the connection.
        // The SMTP session will begin on an unencrypted connection, and then the client
        // will issue a STARTTLS command to upgrade to an encrypted connection.
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");

        // Create a Session object to represent a mail session with the specified properties.
        Session session = Session.getDefaultInstance(props);

        // Create a message with the specified information.
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(emailReceiver.getAddress()));
        msg.setRecipient(Message.RecipientType.TO, to);
        msg.setSubject(subject);
        msg.setContent(text,"text/plain; charset=UTF-8");

        // Create a transport.
        Transport transport = session.getTransport();

        // Send the message.
        try
        {
            System.out.println("Attempting to send an email through the Amazon SES SMTP interface...");

            // Connect to Amazon SES using the SMTP username and password you specified above.
            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);

            // Send the email.
            transport.sendMessage(msg, msg.getAllRecipients());
            System.out.println("Email sent!");
        }
        catch (Exception ex) {
            System.out.println("The email was not sent.");
            System.out.println("Error message: " + ex.getMessage());
        }
        finally
        {
            // Close and terminate the connection.
            transport.close();
        }
    }

    @Async
    public void sendToAllAdmin(String subject, String content) throws UnsupportedEncodingException {
        for (User user : userService.findAllWithRole("ROLE_ADMIN")) {
            try {
                sendMail(new InternetAddress(user.getEmail(), "New Post!"), subject, content);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
    }

}