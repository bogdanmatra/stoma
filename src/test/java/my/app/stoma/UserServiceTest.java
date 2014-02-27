package my.app.stoma;

import my.app.stoma.domain.User;
import my.app.stoma.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceTest {

    @Autowired
    UserService userService;

    @Test
    public void testUser(){

        User user= new User();
        user.setFirstName("Gigi");
        user.setLastName("Ionescu");


    }

}
