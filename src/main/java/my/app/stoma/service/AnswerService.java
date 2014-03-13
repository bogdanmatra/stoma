package my.app.stoma.service;

import my.app.stoma.domain.Answer;
import my.app.stoma.domain.Question;
import my.app.stoma.repository.AnswerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by bmatragociu on 3/10/14.
 */
@Service
public class AnswerService {

    @Autowired
    AnswerRepository answerRepository;


    @Transactional(readOnly = false)
    public Answer save(Answer answer){

        return answerRepository.save(answer);
    }

    @Transactional(readOnly = false)
    public boolean delete (Answer answer){

        try {
            answerRepository.delete(answer);
            return true;
        } catch (InvalidDataAccessApiUsageException e) {
            return false;
        }
    }

        @Transactional(readOnly = true)
        public List<Answer> findByQuestionId(Long id){

            return answerRepository.findByQuestionId(id);
        }


    }




