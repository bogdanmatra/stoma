package my.app.stoma.repository;

import my.app.stoma.domain.Question;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by bmatragociu on 3/10/14.
 */
public interface QuestionRepository extends JpaRepository<Question, Long> {
}
