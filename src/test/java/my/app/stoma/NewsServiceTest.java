package my.app.stoma;

import my.app.stoma.domain.Comment;
import my.app.stoma.domain.News;
import my.app.stoma.domain.Picture;
import my.app.stoma.service.CommentService;
import my.app.stoma.service.NewsService;
import my.app.stoma.service.PictureService;
import my.app.stoma.service.security.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */

@ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class NewsServiceTest {

    @Autowired
    CommentService commentService;
    @Autowired
    UserService userService;
    @Autowired
    PictureService pictureService;
    @Autowired
    NewsService newsService;

    @Test
    public void testNews() {

        int initialSize = newsService.findAll().size();
        int initialSizePictures = pictureService.findAll().size();

        Comment comment = new Comment();
        comment.setContent("Content");
        comment.setUser(userService.findByUsername("superuser"));
        Comment savedComment = commentService.save(comment);
        List<Comment> cList = new LinkedList<>();
        cList.add(savedComment);


        Picture picture = new Picture();
        picture.setPath("/path/path");
        picture.setPrimary(true);
        Picture savedPicture = pictureService.save(picture);
        List<Picture> pList = new LinkedList<>();
        pList.add(savedPicture);


        News news = new News();
        news.setTitle("Title");
        news.setContent("Content");
        news.setComments(cList);
        news.setPictures(pList);
        newsService.save(news);

        int finalSize = newsService.findAll().size();
        int finalSizePictures = pictureService.findAll().size();
        Assert.assertEquals(initialSize+1,finalSize);
        Assert.assertEquals(initialSizePictures+1,finalSizePictures);


    }

}
