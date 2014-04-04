package my.app.stoma.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by bmatragociu on 4/4/2014.
 */
@Controller
@Secured("ROLE_ADMIN")
public class AdminMenuController {


    @RequestMapping(value = "edituser", method = RequestMethod.GET)
    public String edituser(Model model, HttpServletRequest request) {

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
