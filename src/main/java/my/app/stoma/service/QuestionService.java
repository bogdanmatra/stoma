package my.app.stoma.service;

import my.app.stoma.domain.Question;
import my.app.stoma.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.stereotype.Service;

/**
 * Created by bmatragociu on 3/10/14.
 */
@Service
public class QuestionService {

    @Autowired
    QuestionRepository questionRepository;


    public Question save(Question question){

        return questionRepository.save(question);
    }

    public boolean delete (Question question){

        try {
            questionRepository.delete(question);
            return true;
        } catch (InvalidDataAccessApiUsageException e) {
            return false;
        }


    }


}
