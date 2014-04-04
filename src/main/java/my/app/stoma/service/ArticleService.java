package my.app.stoma.service;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.Domain;
import my.app.stoma.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */

@Service
public class ArticleService {

    @Autowired
    ArticleRepository articleRepository;

    @Transactional(readOnly = false)
    public Article save(Article article) {
        return articleRepository.save(article);
    }


    @Transactional(readOnly = true)
    public List<Article> findAll() {
        return articleRepository.findAll();
    }


    @Transactional(readOnly = true)
    public Page<Article> findAllByDomain(Domain domain, int pageNumber){
        return articleRepository.findAllNewsByDomain(domain, new PageRequest(pageNumber, 5, new Sort(
                Sort.Direction.DESC, "updatedDate")));
    }

    @Transactional(readOnly = true)
    public Page<Article> findAllByLanguage(String language,int pageNumber) {
        return articleRepository.findAllByLanguage(language, new PageRequest(pageNumber, 5, new Sort(
                Sort.Direction.DESC, "updatedDate")));
    }


    @Transactional(readOnly = true)
    public Article findById(long id) {
        return articleRepository.findOne(id);
    }

    @Transactional(readOnly = false)
    public void  delete(long id) {
       articleRepository.delete(id);
    }
}
