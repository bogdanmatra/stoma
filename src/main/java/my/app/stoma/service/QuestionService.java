package my.app.stoma.service;

import my.app.stoma.domain.Question;
import my.app.stoma.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by bmatragociu on 3/10/14.
 */
@Service
public class QuestionService {

    @Autowired
    QuestionRepository questionRepository;

    @Transactional(readOnly = false)
    public Question save(Question question){

        return questionRepository.save(question);
    }

    @Transactional(readOnly = false)
    public boolean delete (Question question){

        try {
            questionRepository.delete(question);
            return true;
        } catch (InvalidDataAccessApiUsageException e) {
            return false;
        }


    }

    public List<Question> findAll(){

        return questionRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Page<Question> findAllPage(int currentPage){

        return questionRepository.findAll(new PageRequest(currentPage, 2, new Sort(
               Sort.Direction.DESC, "updatedDate")));

    }






}
