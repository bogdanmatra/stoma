package my.app.stoma.service;

import my.app.stoma.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

/**
 * Created by bmatragociu on 3/24/2014.
 */
@Service
public class MailService {

    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private InternetAddress emailReceiver;
    @Autowired
    UserService userService;

    public void sendMail(InternetAddress to, String subject, String text){

            MimeMessage emailMessage = mailSender.createMimeMessage();
            try {
                MimeMessageHelper mimeMessageHelper=new MimeMessageHelper(emailMessage, true);
                mimeMessageHelper.setFrom(emailReceiver);
                mimeMessageHelper.setReplyTo(emailReceiver);
                mimeMessageHelper.setValidateAddresses(true);
                mimeMessageHelper.setTo(to);
                mimeMessageHelper.setSubject(subject);
                mimeMessageHelper.setText(text, true);
                mailSender.send(emailMessage);
            } catch (MessagingException e){
                e.printStackTrace();
            }
    }

    public void sendToAllAdmin(String subject,String content) throws UnsupportedEncodingException {
        for (User user:userService.findAllWithRole("ROLE_ADMIN")) {
            sendMail(new InternetAddress(user.getEmail(),"New Post!"),subject,content);
        }
    }

}