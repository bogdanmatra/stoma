package my.app.stoma.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by bmatragociu on 3/26/2014.
 */


@Controller
public class ErrorController {

    private final static Logger LOGGER = LoggerFactory
            .getLogger(ErrorController.class);

    @RequestMapping("/error")
    public String displayError(HttpServletRequest request,
                               HttpServletResponse response, Model model) {
        // Retrieve error code
        Integer statusCode = (Integer) request
                .getAttribute("javax.servlet.error.status_code");
        LOGGER.debug("Error code: " + statusCode + " Trace: " + request.getAttribute("javax.servlet.error.exception"));
        model.addAttribute("errorCode", statusCode);
        return "/error";
    }

}
