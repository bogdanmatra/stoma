package my.app.stoma.repository;

import my.app.stoma.domain.Answer;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by bmatragociu on 3/10/14.
 */
public interface AnswerRepository extends JpaRepository<Answer, Long> {
}
