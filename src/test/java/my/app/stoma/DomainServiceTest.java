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
import java.util.Map;

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

        Domain domain = new Domain();
        domain.setName("Oftalmologie");
        domain.setDomMedical("ge");
        domain.setLocale("ro");
        Domain savedDomain = domainService.save(domain);

        Article article = new Article();
        article.setTitle("Gigi");
        article.setContent("Content");

        List<Domain> list = new ArrayList<>();
        list.add(savedDomain);
        article.setDomains(list);

        articleService.save(article);

        Assert.assertEquals("Oftalmologie", getDomainFromList(domainService.findAll(),"Oftalmologie").getName());
    }


    @Test
    public void testGetDomainsByLocale() {

        Domain domainS = new Domain();
        domainS.setName("Aparatura stoma");
        domainS.setDomMedical("st");
        domainS.setLocale("ro");
        domainService.save(domainS);

        Domain domainG = new Domain();
        domainG.setName("Oftalmologie");
        domainG.setDomMedical("ge");
        domainG.setLocale("ro");
        domainService.save(domainG);

        Map<String,List<Domain>> map =domainService.getTwoListsStAndGen("ro");

        List<Domain> listStoma = map.get("st");
        List<Domain> listGen = map.get("gen");

        Assert.assertEquals("st", getDomainFromList(listStoma,"Aparatura stoma").getDomMedical());
        Assert.assertEquals("ge", getDomainFromList(listGen,"Oftalmologie").getDomMedical());
    }


    public Domain getDomainFromList(List<Domain> domainList, String name){
        for(Domain domain: domainList){
            if (domain.getName().equals(name)) return domain;
        }
        return null;
    }


}