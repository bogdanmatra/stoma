package my.app.stoma.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by bmatragociu on 2/26/14.
 */
@Controller

public class IndexController {

    private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {
        return "/index";
    }

}