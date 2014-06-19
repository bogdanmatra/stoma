package my.app.stoma.repository.security;

import my.app.stoma.domain.security.Role;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by bmatragociu on 3/24/2014.
 */
public interface RoleRepository extends JpaRepository<Role, Long> {

    @Query("SELECT role FROM Role role WHERE role.authority like :authority")
    Role findByAuthority(@Param("authority") String authority) throws DataAccessException;

}