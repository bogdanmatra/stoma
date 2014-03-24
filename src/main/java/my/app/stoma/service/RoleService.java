package my.app.stoma.service;

import my.app.stoma.domain.Role;
import my.app.stoma.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by bmatragociu on 3/24/2014.
 */
@Service
public class RoleService {

    @Autowired
    RoleRepository roleRepository;


    public Role getRoleByAuthority(String auth){
        return roleRepository.findByAuthority(auth);
    }

}
