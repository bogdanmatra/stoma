package my.app.stoma.controller;

import my.app.stoma.domain.Question;
import my.app.stoma.domain.User;
import my.app.stoma.repository.QuestionRepository;
import my.app.stoma.service.QuestionService;
import my.app.stoma.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Locale;

/**
 * Created by bmatragociu on 2/26/14.
 */
@Controller
@RequestMapping(value = "askus")
public class AskUsController {

    @Autowired
    QuestionService questionService;

    @Autowired
    UserService userService;

    private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);


    @RequestMapping(value = "/{currentPage}", method = RequestMethod.GET)
    public ModelAndView questions(@PathVariable int currentPage, Model model, HttpServletRequest request) {


        Page<Question> page = questionService.findAllPage(currentPage);
        List<Question> questions= page.getContent();
        model.addAttribute("allQuestions", questions);
        model.addAttribute("noOfPages", page.getTotalPages());
        model.addAttribute("currentPage,", currentPage);

        return new ModelAndView("/askus", model.asMap());

    }

    @Secured({"ROLE_USER"})
    @RequestMapping(value = "/addTopic", method = RequestMethod.GET)
    public String addTopic(Model model, HttpServletRequest request) {
        return "/addTopic";
    }

    @Secured({"ROLE_USER"})
    @RequestMapping(value = "/save", method = RequestMethod.POST )
    public String saveQuestion(Model model, HttpServletRequest request) {

            UserDetails userDetails= (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User currentUser = userService.findByUsername(userDetails.getUsername());
            Question question=new Question();
            question.setContent(request.getParameter("content"));
            question.setUser(currentUser);
            questionService.save(question);
            return "redirect:0";

    }



}