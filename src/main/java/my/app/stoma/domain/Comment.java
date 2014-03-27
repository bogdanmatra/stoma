package my.app.stoma.domain;

import my.app.stoma.domain.security.User;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by bmatragociu on 3/26/2014.
 */

@Entity
@Table(name="comments")
public class Comment extends BaseEntity {

    @Size(min = 1, max = 400)
    @NotNull
    @NotEmpty
    @Column(name = "content")
    private String content;

    @ManyToOne
    @JoinColumn(name = "id_user")
    User user;

    @ManyToOne
    @JoinColumn(name = "id_article")
    Article article;

    @ManyToOne
    @JoinColumn(name = "id_event")
    Event event;

    @ManyToOne
    @JoinColumn(name = "id_news")
    News news;


    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }
}
