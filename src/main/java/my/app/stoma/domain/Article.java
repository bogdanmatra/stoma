package my.app.stoma.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * Created by bmatragociu on 3/26/2014.
 */
@JsonIgnoreProperties({"domains", "pictures", "comments"})
@Entity
@Table(name = "articles")
public class Article extends BaseEntity {

    @Size(min = 1, max = 200)
    @NotNull
    @NotEmpty
    @Column(name = "title")
    private String title;

    @NotNull
    @NotEmpty
    @Column(name = "content")
    private String content;

    @Column(name = "viewed")
    private Long viewed;

    @NotEmpty
    @NotNull
    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinTable(name = "domains_articles", joinColumns = {@JoinColumn(name = "article_id", nullable = false, updatable = false)}, inverseJoinColumns = {@JoinColumn(name = "domain_id", nullable = false, updatable = false)})
    private List<Domain> domains;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL)
    List<Comment> comments;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL)
    List<Picture> pictures;

    @Transient
    private List<MultipartFile> files;

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getViewed() {
        return viewed;
    }

    public void setViewed(Long viewed) {
        this.viewed = viewed;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Domain> getDomains() {
        return domains;
    }

    public void setDomains(List<Domain> domains) {
        this.domains = domains;
    }

    public List<Picture> getPictures() {
        return pictures;
    }

    public void setPictures(List<Picture> pictures) {
        this.pictures = pictures;
    }
}
