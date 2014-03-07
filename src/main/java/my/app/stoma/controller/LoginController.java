package my.app.stoma.controller;

/**
 * Created by bmatragociu on 3/6/14.
 */

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;


@Controller
public class LoginController {



    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, Boolean invalidData, Boolean applicationError) {
        // TO-DO
        return "/index";
    }

    @RequestMapping(value = "/loginfailed")
    public String loginerror(Model model, HttpServletRequest request) {
        model.addAttribute("error", "true");
        return "/index";
    }

}