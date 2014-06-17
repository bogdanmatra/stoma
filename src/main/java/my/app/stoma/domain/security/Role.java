package my.app.stoma.domain.security;

import my.app.stoma.domain.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by bmatragociu on 2/26/14.
 */

@Entity
@Table(name = "roles")
public class Role extends BaseEntity {

    @Column(name = "authority")
    private String authority;

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

}
