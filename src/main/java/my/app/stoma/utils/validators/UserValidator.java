package my.app.stoma.utils.validators;

import my.app.stoma.domain.security.User;
import my.app.stoma.service.security.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {

    private String invalidName = "addUser.invalidName";

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.isAssignableFrom(User.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        validateFirstName(user.getFirstName(), errors);
        validateLastName(user.getLastName(), errors);
        validateEmail(user.getEmail(), user.getId(), errors);
        validateUsername(user.getUsername(), user.getId(), errors);
        validatePassword(user.getPassword(), user.getId(), errors);
    }

    /**
     * Validates the first name of the added/edited user.
     */
    private void validateFirstName(String name, Errors errors) {
        if (!isValidString(name)) {
            errors.rejectValue("firstName", invalidName);
            return;
        }
        final String regex = "[a-zA-Z]*[0-9]+[a-zA-Z]*";
        if (name.matches(regex)) {
            errors.rejectValue("firstName", invalidName);
            return;
        }

        if (name.length() > 20) {
            errors.rejectValue("firstName", "addUser.tooLongName");
        }
    }

    /**
     * Validates the last name of the added/edited user.
     */
    private void validateLastName(String name, Errors errors) {
        if (!isValidString(name)) {
            errors.rejectValue("lastName", invalidName);
            return;
        }
        final String regex = "[a-zA-Z]*[0-9]+[a-zA-Z]*";
        if (name.matches(regex)) {
            errors.rejectValue("lastName", invalidName);
            return;
        }
        if (name.length() > 20) {
            errors.rejectValue("lastName", "addUser.tooLongName");
        }
    }

    /**
     * Validates the email of the added/edited user.
     */
    private void validateEmail(String email, Long id, Errors errors) {
        if (!isValidString(email)) {
            errors.rejectValue("email", "addUser.invalidEmail");
            return;
        }
        final String regex = "^[a-zA-Z0-9.]+@[a-zA-Z]+\\.[a-zA-Z]{2,6}$";
        if (!email.matches(regex)) {
            errors.rejectValue("email", "addUser.invalidEmail");
            return;
        }

        User user = userService.findByEmail(email);
        if (user != null && id == null) {
            errors.rejectValue("email", "addUser.duplicateEmail");
        }
    }

    /**
     * Validates the username of the added/edited user.
     */
    private void validateUsername(String username, Long id, Errors errors) {
        if (id != null && username.equals("")) {
            errors.rejectValue("username", "addUser.invalidUser");
            return;
        }
        if (!isValidString(username) && id == null) {
            errors.rejectValue("username", "addUser.invalidUser");
            return;
        }
        User user = userService.findByUsername(username);
        String current=null;
        if ( SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {

            if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails)
                current = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();

            if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof String)
                current = (String)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        }

        if (user != null && current!=null && !current.equals(user.getUsername()) && !(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof String)) {
            errors.rejectValue("username", "addUser.duplicateUser");
        }
        if (user != null && current!=null && current.equals("anonymousUser") ) {
            errors.rejectValue("username", "addUser.duplicateUser");
        }
    }

    /**
     * Validates the password of the added/edited user.
     */
    private void validatePassword(String password, Long id, Errors errors) {
        if (id != null && password.equals("")) {
            errors.rejectValue("password", "addUser.invalidPassword");
        }
        if (id == null && !isValidString(password)) {
            errors.rejectValue("password", "addUser.invalidPassword");
        }
    }

    private boolean isValidString(String str) {
        return (str != null) && (str.length() > 0);
    }
}