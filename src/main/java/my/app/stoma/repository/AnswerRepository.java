package my.app.stoma.repository;

import my.app.stoma.domain.Answer;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by bmatragociu on 3/10/14.
 */
@Repository
public interface AnswerRepository extends JpaRepository<Answer, Long> {

    @Query("SELECT a FROM Answer a, Question q  WHERE a.question=q AND q.id=:id")
    List<Answer> findByQuestionId(@Param("id") Long id) throws DataAccessException;

    // Odd behavior
    @Modifying
    @Query("delete from Answer a where a.id = :id")
    void customDelete(@Param("id") Long id) throws DataAccessException;

}
