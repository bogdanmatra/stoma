package my.app.stoma;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.Comment;
import my.app.stoma.domain.security.User;
import my.app.stoma.service.ArticleService;
import my.app.stoma.service.CommentService;
import my.app.stoma.service.DomainService;
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
public class CommentArticleServiceTest {

    @Autowired
    CommentService commentService;
    @Autowired
    ArticleService articleService;
    @Autowired
    UserService userService;
    @Autowired
    DomainService domainService;


    @Test
    public void testComment() {

        Comment comment = new Comment();
        User user = userService.findByUsername("superuser");
        comment.setContent("Content");
        comment.setUser(user);
        commentService.save(comment);
        List<Comment> list = commentService.findAll();
        Assert.assertEquals("superuser", list.get(0).getUser().getUsername());


    }


    @Test
    public void testArticle() {

        int initial = articleService.findAll().size();

        Comment comment = new Comment();
        comment.setContent("Content");
        comment.setUser(userService.findByUsername("superuser"));
        // commentService.save(comment);
        List<Comment> list = new LinkedList<>();
        list.add(comment);

        Article article = new Article();
        article.setTitle("Title");
        article.setContent("Content");
        article.setComments(list);
        article.setDomains(domainService.findAll());
        articleService.save(article);

        int after = articleService.findAll().size();

        Assert.assertEquals(initial+1,after);

    }


}
