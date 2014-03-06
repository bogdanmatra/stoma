package my.app.stoma.service;

import my.app.stoma.domain.Role;
import my.app.stoma.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityMessageSource;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by bmatragociu on 2/26/14.
 */
@Service("stomaUserDetailsService")
@Transactional(readOnly = true)
public class StomaUserDetailsService implements UserDetailsService {

    private static final Logger LOGGER = LoggerFactory
            .getLogger(StomaUserDetailsService.class);
    protected final MessageSourceAccessor messages = SpringSecurityMessageSource.getAccessor();
    @Autowired
    private UserService userService;

    /**
     * Converts a list with @see{Role}s into a list of @see{GrantedAuthority}es. Only the authority of each Role is used
     * in the creation of the final list
     *
     * @param roles List of Roles to be converted
     * @return List of GrantedAuthorities.
     * @see Role
     * @see org.springframework.security.core.GrantedAuthority
     */
    private static List<GrantedAuthority> getGrantedAuthorities(List<Role> roles) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (Role role : roles) {
            authorities.add(new SimpleGrantedAuthority(role.getAuthority()));
        }
        return authorities;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userService.findByUsername(username);

        LOGGER.debug(">------------------------" + user.getRoles().get(0) + "-----------------------------------<");

        if (user == null) {
            throw new UsernameNotFoundException("No such user: " + username);
        } else if (user.getRoles() == null || user.getRoles().isEmpty()) {
            throw new InternalAuthenticationServiceException(messages.getMessage("JdbcDaoImpl.noAuthority", new Object[]{username}, "User {0} has no GrantedAuthority"));
        }


        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
                true, true, true, true, getGrantedAuthorities(user.getRoles()));
    }
}
