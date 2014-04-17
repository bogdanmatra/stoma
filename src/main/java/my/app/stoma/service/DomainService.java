package my.app.stoma.service;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.Domain;
import my.app.stoma.domain.News;
import my.app.stoma.repository.ArticleRepository;
import my.app.stoma.repository.DomainRepository;
import my.app.stoma.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by bmatragociu on 3/27/2014.
 */
@Service
public class DomainService {

    @Autowired
    DomainRepository domainRepository;
    @Autowired
    NewsRepository newsRepository;
    @Autowired
    ArticleRepository articleRepository;

    @Transactional(readOnly = true)
    public List<Domain> findAll() {
        return domainRepository.findAll();
    }

    @Transactional(readOnly = false)
    public Domain save(Domain domain) {
        return domainRepository.save(domain);
    }

    @Transactional(readOnly = false)
    public Map<String,List<Domain>> getTwoListsStAndGen(String locale) {
        Map<String,List<Domain>> twoLists = new HashMap<>();
        twoLists.put("st",domainRepository.findDomainsByLocaleAndMedD("st",locale));
        twoLists.put("gen",domainRepository.findDomainsByLocaleAndMedD("ge",locale));
        return twoLists;
    }

    @Transactional(readOnly = true)
    public Domain findById(Long id) {
        return domainRepository.findOne(id);
    }

    @Transactional(readOnly = false)
    public List<Domain> getByLocaleAndDomMed(String locale, String domMed) {
        return domainRepository.findDomainsByLocaleAndMedD(domMed,locale);
    }


    @Transactional(readOnly = false)
    public void delete(Long id) {
        List<News> listNews=newsRepository.findAllNewsByDomainNotPageable(domainRepository.findOne(id));
        for(News news:listNews){
            if(news.getDomains().size()==1){
                newsRepository.delete(news.getId());
            }
        }
        List<Article> listArticles=articleRepository.findAllNewsByDomainNotPageable(domainRepository.findOne(id));
        for(Article article:listArticles){
            if(article.getDomains().size()==1){
                newsRepository.delete(article.getId());
            }
        }
        domainRepository.delete(id);
    }



}
