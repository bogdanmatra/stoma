package my.app.stoma.repository;

import my.app.stoma.domain.Question;
import org.joda.time.DateTime;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by bmatragociu on 3/10/14.
 */
public interface QuestionRepository extends JpaRepository<Question, Long> {
}
