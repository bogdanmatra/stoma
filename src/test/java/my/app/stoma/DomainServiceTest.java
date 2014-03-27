package my.app.stoma;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.Domain;
import my.app.stoma.service.ArticleService;
import my.app.stoma.service.DomainService;
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
public class DomainServiceTest {

    @Autowired
    DomainService domainService;
    @Autowired
    ArticleService articleService;


    @Test
    public void testDomain() {

        Domain domain=new Domain();
        domain.setName("Oftalmologie");
        domain.setDomMedical("ge");
        domain.setLocale("ro");
        Domain savedDomain = domainService.save(domain);

        Article article=new Article();
        article.setTitle("Gigi");
        article.setContent("Content");

        List<Domain> list= new ArrayList<>();
        list.add(savedDomain);
        article.setDomains(list);

        articleService.save(article);

        Assert.assertEquals("Oftalmologie",articleService.findAll().get(0).getDomains().get(0).getName());
        Assert.assertEquals("Oftalmologie",domainService.findAll().get(0).getName());

    }

}