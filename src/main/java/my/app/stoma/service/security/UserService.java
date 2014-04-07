package my.app.stoma.service.security;


import my.app.stoma.domain.security.User;
import my.app.stoma.repository.security.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by bmatragociu on 2/25/14.
 */


@Service
public class UserService {


    private static final Logger LOGGER = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private ShaPasswordEncoder shaPasswordEncoder;
    @Autowired
    private UserRepository userRepository;


    /**
     * Find a user using it's database id;
     *
     * @param userId User id
     * @return User corresponding to specified id
     */
    @Transactional(readOnly = true)
    public User findById(Long userId) {
        return userRepository.findOne(userId);
    }

    /**
     * Saves to the database a specific user
     *
     * @param user The desired role to be saved
     * @return The reattached user.
     */
    @Transactional(readOnly = false)
    public User save(User user) {
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {

            String hashedPassword = shaPasswordEncoder.encodePassword(
                    user.getPassword(), user.getUsername());

            user.setPassword(hashedPassword);
        } else if (user.getPassword() == null || user.getPassword().isEmpty()) {
            User userToEdit = findById(user.getId());
            user.setPassword(userToEdit.getPassword());
        }
        return userRepository.save(user);
    }

    /**
     * List all the Users from the database
     *
     * @return List of all Users
     */
    @Transactional(readOnly = true)
    public List<User> findAll() {
        return userRepository.findAll();
    }


    /**
     * List all the Users from the database pageable
     *
     * @return page of all Users
     */
    @Transactional(readOnly = true)
    public Page<User> findAllPageable(int pageNumber) {
        return userRepository.findAllPageable(new PageRequest(pageNumber, 5, new Sort(
                Sort.Direction.DESC, "updatedDate")));
    }




    /**
     * Find a user using it's username
     *
     * @param username Desired username to be searched for
     * @return user corresponding to specified username
     */
    @Transactional(readOnly = true)
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    /**
     * Find a user using it's email
     *
     * @param email Desired email to be searched for
     * @return user corresponding to specified email
     */
    @Transactional(readOnly = true)
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    /**
     * Deletes a specific user from the database
     *
     * @param user The desired user to be deleted
     * @return if the operation succeeded
     */
    @Transactional(readOnly = false)
    public boolean delete(User user) {
        try {
            userRepository.delete(user);
            return true;
        } catch (InvalidDataAccessApiUsageException e) {
            return false;
        }
    }

    @Transactional(readOnly = false)
    public List<User> findAllWithRole(String role) {
        return userRepository.findAllWithRole(role);
    }


}

