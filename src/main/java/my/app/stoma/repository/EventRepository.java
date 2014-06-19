package my.app.stoma.repository;

import my.app.stoma.domain.Event;
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
public interface EventRepository extends JpaRepository<Event, Long> {

    @Query("SELECT event FROM Event event WHERE event.locale = :locale ORDER BY event.createdDate DESC")
    List<Event> findByLocale(@Param("locale") String  domain) throws DataAccessException;

}
