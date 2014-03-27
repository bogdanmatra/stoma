package my.app.stoma.service;

import my.app.stoma.domain.Article;
import my.app.stoma.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
    public Article save(Article article){
        return articleRepository.save(article);
    }


    @Transactional(readOnly = true)
    public List<Article> findAll(){
        return articleRepository.findAll();
    }



}
