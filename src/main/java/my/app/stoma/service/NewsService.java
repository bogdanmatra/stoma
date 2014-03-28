package my.app.stoma.service;

import my.app.stoma.domain.Domain;
import my.app.stoma.domain.News;
import my.app.stoma.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */

@Service
public class NewsService {

    @Autowired
    NewsRepository newsRepository;

    @Transactional(readOnly = true)
    public List<News> findAll() {
        return newsRepository.findAll();
    }

    @Transactional(readOnly = false)
    public News save(News news) {
        return newsRepository.save(news);
    }

    @Transactional(readOnly = true)
    public List<News> findAllByDomain(Domain domain) {
        return newsRepository.findAllNewsByDomain(domain);
    }

}
