package my.app.stoma.service;


import my.app.stoma.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import my.app.stoma.domain.User;
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
     * @param userId
     *            User id
     * @return User corresponding to specified id
     */
    @Transactional(readOnly = true)
    public User findById(Long userId) {
        return userRepository.findById(userId);
    }

    /**
     * Saves to the database a specific user
     *
     * @param user
     *            The desired role to be saved
     * @return The reattached user.
     */
    public User save(User user) {
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {

            String hashedPassword = shaPasswordEncoder.encodePassword(
                    user.getPassword(), user.getUsername());

            LOGGER.debug("<----------------------------" + hashedPassword + "--------------------------------------->");

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
    @Transactional(readOnly = false)
    public List<User> findAll() {
        return userRepository.findAll();
    }

    /**
     * Find a user using it's username
     *
     * @param username
     *            Desired username to be searched for
     * @return user corresponding to specified username
     */
    @Transactional(readOnly = false)
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    /**
     * Find a user using it's email
     *
     * @param email
     *            Desired email to be searched for
     * @return user corresponding to specified email
     */
    @Transactional(readOnly = false)
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    /**
     * Deletes a specific user from the database
     *
     * @param user
     *            The desired user to be deleted
     * @return if the operation succeeded
     */
    public boolean delete(User user) {
        try {
            userRepository.delete(user);
            return true;
        } catch (InvalidDataAccessApiUsageException e) {
            return false;
        }
    }


}

