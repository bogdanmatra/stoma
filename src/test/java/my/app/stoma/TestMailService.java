package my.app.stoma;

import my.app.stoma.service.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.mail.internet.InternetAddress;
import java.io.UnsupportedEncodingException;

/**
 * Created by bmatragociu on 3/24/2014.
 */


@ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestMailService {

    @Autowired
    MailService mailService;


    @Test
    public void sendMailTest(){
//    Commented to not send mail every time
//        try {
//            mailService.sendMail(new InternetAddress("bogdanmatra@gmail.com","Test"), "Test", "Test");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
    }


}
