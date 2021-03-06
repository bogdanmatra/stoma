package my.app.stoma.repository.security;

import my.app.stoma.domain.security.User;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by bmatragociu on 2/25/14.
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT user FROM User user WHERE user.username = :username")
    User findByUsername(@Param("username") String username) throws DataAccessException;

    @Query("SELECT user FROM User user WHERE user.email = :email")
    User findByEmail(@Param("email") String email) throws DataAccessException;

    @Query("SELECT u FROM User u JOIN u.roles r WHERE r.authority=:auth")
    List<User> findAllWithRole(@Param("auth") String authority) throws DataAccessException;

    @Query("SELECT u FROM User u")
    Page<User> findAllPageable(Pageable pageable) throws DataAccessException;



}
