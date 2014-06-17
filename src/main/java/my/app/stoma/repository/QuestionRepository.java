package my.app.stoma.repository;

import my.app.stoma.domain.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by bmatragociu on 3/10/14.
 */
@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {
}
