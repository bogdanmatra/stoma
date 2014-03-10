package my.app.stoma.service;

import my.app.stoma.domain.Answer;
import my.app.stoma.repository.AnswerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.stereotype.Service;

/**
 * Created by bmatragociu on 3/10/14.
 */
@Service
public class AnswerService {

    @Autowired
    AnswerRepository answerRepository;


    public Answer save(Answer answer){

        return answerRepository.save(answer);
    }

    public boolean delete (Answer answer){

        try {
            answerRepository.delete(answer);
            return true;
        } catch (InvalidDataAccessApiUsageException e) {
            return false;
        }


    }



}
