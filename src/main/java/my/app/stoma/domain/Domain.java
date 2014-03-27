package my.app.stoma.domain;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.BaseEntity;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

/**
 * Created by bmatragociu on 3/26/2014.
 */

@Entity
@Table(name="domains")
public class Domain extends BaseEntity implements Serializable{

    private static final long serialVersionUID = 0;

    @Size(min = 1, max = 45)
    @NotNull
    @NotEmpty
    @Column(name = "name")
    private String name;

    @Column(name = "details")
    private String details;

    @Size(min = 2, max = 2)
    @NotNull
    @NotEmpty
    @Column(name = "locale")
    private String locale;

    @Size(min = 2, max = 2)
    @NotNull
    @NotEmpty
    @Column(name = "dom_medical")
    private String domMedical;


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

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public String getDomMedical() {
        return domMedical;
    }

    public void setDomMedical(String domMedical) {
        this.domMedical = domMedical;
    }

}
