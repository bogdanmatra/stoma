package my.app.stoma.repository;

import my.app.stoma.domain.Picture;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by bmatragociu on 3/27/2014.
 */
public interface PictureRepository extends JpaRepository<Picture, Long> {
}
