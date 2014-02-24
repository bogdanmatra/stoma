package my.licenta.model;


import junit.framework.Assert;
import org.junit.Test;


public class UserTest {

    @Test
    public void testUser(){

        User user=new User();
        user.setUsername("gigi");
        user.setPassword("pass");


    }

}
