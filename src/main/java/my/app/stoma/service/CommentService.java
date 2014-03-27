package my.app.stoma.service;

import my.app.stoma.domain.Comment;
import my.app.stoma.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */

@Service

public class CommentService {

    @Autowired
    CommentRepository commentRepository;

    @Transactional(readOnly = false)
    public Comment save(Comment comment){
        return commentRepository.save(comment);
    }


    @Transactional(readOnly = true)
    public List<Comment> findAll(){
        return commentRepository.findAll();
    }


}
