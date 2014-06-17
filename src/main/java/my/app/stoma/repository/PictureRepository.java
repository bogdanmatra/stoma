package my.app.stoma.repository;

import my.app.stoma.domain.Picture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by bmatragociu on 3/27/2014.
 */
@Repository
public interface PictureRepository extends JpaRepository<Picture, Long> {
}
