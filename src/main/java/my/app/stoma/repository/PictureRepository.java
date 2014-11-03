package my.app.stoma.repository;

import my.app.stoma.domain.Picture;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by bmatragociu on 3/27/2014.
 */
@Repository
public interface PictureRepository extends JpaRepository<Picture, Long> {

    @Modifying
    @Query("delete from Picture a where a.id = :id")
    void customDelete(@Param("id") Long id) throws DataAccessException;

}
