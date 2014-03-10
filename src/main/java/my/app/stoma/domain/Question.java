package my.app.stoma.domain;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.List;

/**
 * Created by bmatragociu on 3/10/14.
 */

@Entity
@Table(name="questions")
public class Question extends BaseEntity{

    @Column(name="content")
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
