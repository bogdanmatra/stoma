package my.app.stoma.repository;

import my.app.stoma.domain.Domain;
import my.app.stoma.domain.News;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by bmatragociu on 3/27/2014.
 */

@Repository
public interface NewsRepository extends JpaRepository<News, Long> {

    @Query("SELECT news FROM News news INNER JOIN news.domains dom WHERE dom = :domain")
    Page<News> findAllNewsByDomain(@Param("domain") Domain domain, Pageable p) throws DataAccessException;

    @Query("SELECT DISTINCT news FROM News news INNER JOIN news.domains dom WHERE dom.locale = :language")
    Page<News> findAllByLanguage(@Param("language") String language, Pageable p) throws DataAccessException;

}
