package my.app.stoma.domain;

import my.app.stoma.domain.security.User;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * Created by bmatragociu on 3/10/14.
 */

@Entity
@Table(name = "questions")
public class Question extends BaseEntity {

    @Size(min = 1, max = 400)
    @NotNull
    @NotEmpty
    @Column(name = "content")
    private String content;

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    List<Answer> answers;

    @ManyToOne
    @JoinColumn(name = "user_id")
    User user;


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
