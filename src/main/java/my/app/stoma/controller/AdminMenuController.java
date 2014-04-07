package my.app.stoma.controller;

import my.app.stoma.domain.security.User;
import my.app.stoma.repository.security.UserRepository;
import my.app.stoma.service.security.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by bmatragociu on 4/4/2014.
 */
@Controller
@Secured("ROLE_ADMIN")
public class AdminMenuController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "fetch/{pageNumber}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<User> fetch(@PathVariable int pageNumber, Model model, HttpServletRequest request) {
        Page<User> allusers = userService.findAllPageable(pageNumber);
        return allusers;
    }

    @RequestMapping(value = "edituser", method = RequestMethod.GET)
    public String edituser( Model model, HttpServletRequest request) {
        return "/edituser";
    }

    @RequestMapping(value = "addNorA", method = RequestMethod.GET)
    public String add(Model model, HttpServletRequest request) {

        return "/addNorA";
    }

    @RequestMapping(value = "contactEdit", method = RequestMethod.GET)
    public String contact(Model model, HttpServletRequest request) {

        return "/contactEdit";
    }


}
