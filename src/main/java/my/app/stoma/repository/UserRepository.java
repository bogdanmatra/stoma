package my.app.stoma.repository;

import my.app.stoma.domain.User;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by bmatragociu on 2/25/14.
 */

public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT user FROM User user WHERE user.id = :id")
    User findById(@Param("id") Long id) throws DataAccessException;

    @Query("SELECT user FROM User user WHERE user.username = :username")
    User findByUsername(@Param("username") String username) throws DataAccessException;

    @Query("SELECT user FROM User user WHERE user.email = :email")
    User findByEmail(@Param("email") String email) throws DataAccessException;


}
