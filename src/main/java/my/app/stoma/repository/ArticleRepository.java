package my.app.stoma.repository;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.Domain;
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
public interface ArticleRepository extends JpaRepository<Article, Long> {


    @Query("SELECT article FROM Article article INNER JOIN article.domains dom WHERE dom = :domain")
    Page<Article> findAllNewsByDomain(@Param("domain") Domain domain, Pageable p) throws DataAccessException;

}
