package my.app.stoma;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.Picture;
import my.app.stoma.service.ArticleService;
import my.app.stoma.service.PictureService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by bmatragociu on 3/27/2014.
 */

@ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class PictureServiceTest {

    @Autowired
    PictureService pictureService;
    @Autowired
    ArticleService articleService;


    @Test
    public void testPicture() {

        Article article=new Article();
        article.setTitle("Gigi");
        article.setContent("Content");
        Article savedArticle = articleService.save(article);

        Picture picture=new Picture();
        picture.setPath("/path/path");
        picture.setArticle(savedArticle);
        picture.setPrimary(true);

        pictureService.save(picture);

        Assert.assertEquals("Gigi",pictureService.findAll().get(0).getArticle().getTitle());
        Assert.assertEquals("/path/path",pictureService.findAll().get(0).getPath());

    }



}
