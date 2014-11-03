package my.app.stoma.service;

import my.app.stoma.domain.Picture;
import my.app.stoma.repository.PictureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */
@Service
public class PictureService {

    @Autowired
    PictureRepository pictureRepository;


    @Transactional(readOnly = true)
    public List<Picture> findAll() {
        return pictureRepository.findAll();
    }

    @Transactional(readOnly = false)
    public Picture save(Picture picture) {
        return pictureRepository.save(picture);
    }

    @Transactional(readOnly = false)
    public void deleteListFromHDD(List<Picture> pictures, String path){
        if(pictures.size()>0){
            for (Picture picture : pictures){
                pictureRepository.customDelete(picture.getId());
                String destination=path.replace("\\","/") + "resources/uploadedPictures/" + picture.getPath();
                File file=new File(destination);
                if (file.exists() && !picture.getPath().equals("default.jpg")){
                    file.delete();
                }
            }
        }
    }

    public Picture findOne(long id){
        return pictureRepository.findOne(id);
    }


}
