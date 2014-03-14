package my.app.stoma.service;

import my.app.stoma.domain.Answer;
import my.app.stoma.domain.Question;
import my.app.stoma.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by bmatragociu on 3/10/14.
 */
@Service
public class QuestionService {

    @Autowired
    QuestionRepository questionRepository;

    @Transactional(readOnly = false)
    public Question save(Question question) {
        return questionRepository.save(question);
    }

    @Transactional(readOnly = false)
    public void deleteById(Long id) {
         questionRepository.delete(id);
    }

    public List<Question> findAll() {
        return questionRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Page<Question> findAllPage(int currentPage) {

        Page<Question> page = questionRepository.findAll(new PageRequest(currentPage, 2, new Sort(
                Sort.Direction.DESC, "updatedDate")));

        List<Question> questions = page.getContent();

        for (Question question : questions) {

            // Sorting answers by date
            if (question.getAnswers() != null) {
                Collections.sort(question.getAnswers(), new Comparator<Answer>() {
                    @Override
                    public int compare(Answer answer, Answer answer2) {
                        if (answer.getUpdatedDate().isAfter(answer2.getUpdatedDate())) {
                            return 1;
                        } else if (answer.getUpdatedDate().isBefore(answer2.getUpdatedDate()))
                            return -1;
                        else return 0;
                    }
                });
            }
        }

        return page;
    }

    @Transactional(readOnly = true)
    public Question findById(long id) {
        return questionRepository.findOne(id);
    }


}
