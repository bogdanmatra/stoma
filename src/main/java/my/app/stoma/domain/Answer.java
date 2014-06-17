package my.app.stoma.domain;

import my.app.stoma.domain.security.User;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by bmatragociu on 3/10/14.
 */

@Entity
@Table(name = "answers")
public class Answer extends BaseEntity {

    @Size(min = 1, max = 400)
    @NotNull
    @NotEmpty
    @Column(name = "content")
    private String content;

    @ManyToOne
    @JoinColumn(name = "id_question")
    Question question;

    @ManyToOne
    @JoinColumn(name = "id_user")
    User user;


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Answer() {

    }

    public Answer(String content, Question question, User user) {
        this.content = content;
        this.question = question;
        this.user = user;
    }
}
