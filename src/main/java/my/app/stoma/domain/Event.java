package my.app.stoma.domain;

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

@Entity
@Table(name = "events")
public class Event extends BaseEntity {

    @Size(min = 1, max = 200)
    @NotNull
    @NotEmpty
    @Column(name = "name")
    private String name;

    @NotNull
    @NotEmpty
    @Column(name = "details")
    private String details;

    @Column(name = "viewed")
    private Long viewed;

    @Size(min = 2, max = 2)
    @NotNull
    @NotEmpty
    @Column(name = "locale")
    private String locale;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL)
    List<Picture> pictures;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL)
    List<Comment> comments;

    @Transient
    private List<MultipartFile> files;

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Long getViewed() {
        return viewed;
    }

    public void setViewed(Long viewed) {
        this.viewed = viewed;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public List<Picture> getPictures() {
        return pictures;
    }

    public void setPictures(List<Picture> pictures) {
        this.pictures = pictures;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void incrementViewed(){
        if (viewed==null){
            viewed=1L;
        }
        else{
            viewed++;
        }

    }

}
