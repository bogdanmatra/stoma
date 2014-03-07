package my.app.stoma;

import my.app.stoma.domain.User;
import my.app.stoma.domain.Role;
import my.app.stoma.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.List;


@ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class UserServiceTest {

    private static final Logger LOGGER = LoggerFactory
            .getLogger(UserServiceTest.class);

    @Autowired
    UserService userService;

    @Test
    public void testUser(){

        LOGGER.info("Entering Test!");
        User user= new User();
        user.setFirstName("Gigi");
        user.setLastName("Ionescu");
        user.setUsername("bogdanmatra");
        user.setPassword("password");
        user.setEmail("bm@gmail.com");
        List<Role> roles = new ArrayList<Role>();
        Role role = new Role();
        role.setAuthority("ROLE_USER");
        roles.add(role);
        user.setRoles(roles);

        userService.save(user);
        User returnedUser=userService.findByUsername("bogdanmatra");

        Assert.assertTrue(returnedUser.getUsername().equals("bogdanmatra"));

        LOGGER.debug(">--------------------------------" + user.getRoles().get(0).getAuthority() + "----------------<");

        LOGGER.info("Exiting Test!");


    }

}
