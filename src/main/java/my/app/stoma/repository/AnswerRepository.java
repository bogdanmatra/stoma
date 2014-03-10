package my.app.stoma.repository;

import my.app.stoma.domain.Answer;
import my.app.stoma.domain.Question;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by bmatragociu on 3/10/14.
 */
public interface AnswerRepository extends JpaRepository<Answer, Long> {

    @Query("SELECT a FROM Answer a, Question q  WHERE a.question=q AND q.id=:id")
    List<Answer> findByQuestionId(@Param("id") Long id) throws DataAccessException;

}
