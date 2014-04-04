package my.app.stoma;

import my.app.stoma.domain.Comment;
import my.app.stoma.domain.Event;
import my.app.stoma.domain.Picture;
import my.app.stoma.domain.security.User;
import my.app.stoma.service.CommentService;
import my.app.stoma.service.EventService;
import my.app.stoma.service.PictureService;
import my.app.stoma.service.security.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */

@ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class EventServiceTest {

    @Autowired
    CommentService commentService;

    @Autowired
    PictureService pictureService;

    @Autowired
    EventService eventService;

    @Autowired
    UserService userService;


    @Test
    public void testEvent() {

        int initial = eventService.findAll().size();

        Comment comment = new Comment();
        comment.setContent("Content");
        User user = userService.findByUsername("user");
        comment.setUser(user);
        Comment savedComment = commentService.save(comment);
        List<Comment> cList = new ArrayList<Comment>();
        cList.add(savedComment);

        Picture picture = new Picture();
        picture.setPath("/path/path");
        picture.setPrimary(true);
        Picture savedPicture = pictureService.save(picture);
        List<Picture> pList = new ArrayList<Picture>();
        pList.add(savedPicture);


        Event event = new Event();
        event.setName("Test event");
        event.setComments(cList);
        event.setPictures(pList);
        event.setLocale("en");
        event.setDetails("something");
        eventService.save(event);

        Assert.assertEquals(initial+1,eventService.findAll().size());


    }


}
