package my.app.stoma.domain;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.mail.Multipart;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by bmatragociu on 3/26/2014.
 */

@Entity
@Table(name = "pictures")
public class Picture {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;

    @Size(min = 1, max = 45)
    @NotNull
    @NotEmpty
    @Column(name = "path")
    private String path;

    @Column(name = "primar", columnDefinition = "TINYINT")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean primary;

    @ManyToOne
    @JoinColumn(name = "id_article")
    private Article article;

    @ManyToOne
    @JoinColumn(name = "id_event")
    private Event event;

    @ManyToOne
    @JoinColumn(name = "id_news")
    private News news;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public boolean isPrimary() {
        return primary;
    }

    public void setPrimary(boolean primary) {
        this.primary = primary;
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

    public Picture(){
    }

    public Picture(MultipartFile multipartFile,String path) throws IOException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-HH-mm-ss-SSS");
        String[] type = multipartFile.getContentType().split("/");
        String extention=type[type.length-1];
        String fileName=String.format("%s.%s", simpleDateFormat.format(new Date()), extention);
        String destination=path.replace("\\","/") + "resources/uploadedPictures/" + fileName;
        multipartFile.transferTo(new File(destination));

        setPath(fileName);
        setPrimary(false);
    }

}

