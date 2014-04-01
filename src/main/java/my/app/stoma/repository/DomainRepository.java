package my.app.stoma.repository;

import my.app.stoma.domain.Domain;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */
@Repository
public interface DomainRepository extends JpaRepository<Domain, Long> {

    @Query("SELECT domain FROM Domain domain WHERE domain.locale = :loc AND domain.domMedical = :dom AND domain.")
    List<Domain> findDomainsByLocaleAndMedD(@Param("dom") String dom, @Param("loc") String loc) throws DataAccessException;

}
