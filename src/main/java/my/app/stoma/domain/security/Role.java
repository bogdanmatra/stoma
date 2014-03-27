package my.app.stoma.domain.security;

import my.app.stoma.domain.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by bmatragociu on 2/26/14.
 */

@Entity
@Table(name = "roles")
public class Role extends BaseEntity implements Serializable {

    private static final long serialVersionUID = -8721509412360448342L;

    @Column(name = "authority")
    private String authority;

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

}
