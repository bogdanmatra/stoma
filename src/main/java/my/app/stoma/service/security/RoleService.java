package my.app.stoma.service.security;

import my.app.stoma.domain.security.Role;
import my.app.stoma.repository.security.RoleRepository;
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
