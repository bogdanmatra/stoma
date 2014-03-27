package my.app.stoma.controller;

import my.app.stoma.domain.Answer;
import my.app.stoma.domain.Question;
import my.app.stoma.domain.security.User;
import my.app.stoma.service.AnswerService;
import my.app.stoma.service.MailService;
import my.app.stoma.service.QuestionService;
import my.app.stoma.service.security.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by bmatragociu on 2/26/14.
 */
@Controller
@RequestMapping(value = "askus")
public class AskUsController {

    @Autowired
    QuestionService questionService;
    @Autowired
    AnswerService answerService;
    @Autowired
    UserService userService;
    @Autowired
    MailService mailService;

    private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String redirect(HttpServletRequest request) {
        return "redirect:askus/0";
    }

    @RequestMapping(value = "/{currentPage}", method = RequestMethod.GET)
    public ModelAndView questions(@PathVariable int currentPage, Model model, HttpServletRequest request) {
        Page<Question> page = questionService.findAllPage(currentPage);
        if (page.getTotalPages() == 0) {
            model.addAttribute("Empty", true);
            return new ModelAndView("/askus", model.asMap());
        }
        if (page.getNumberOfElements() == 0) {
            currentPage = currentPage - 1;
            return new ModelAndView("redirect:/askus/" + currentPage);
        }
        List<Question> questions = page.getContent();
        model.addAttribute("allQuestions", questions);
        model.addAttribute("noOfPages", page.getTotalPages());
        model.addAttribute("currentPage,", currentPage);
        return new ModelAndView("/askus", model.asMap());
    }

    @Secured({"ROLE_USER"})
    @RequestMapping(value = "/addTopic", method = RequestMethod.GET)
    String addTopic(Model model, HttpServletRequest request) {

        model.addAttribute("question", new Question());
        return "/addTopic";
    }

    @Secured({"ROLE_USER"})
    @RequestMapping(value = "/save", method = {RequestMethod.POST, RequestMethod.GET})
    public String saveQuestion(Model model, @ModelAttribute(value = "question") @Valid Question question, BindingResult bindingResult, HttpServletRequest request) throws UnsupportedEncodingException {
        if (!bindingResult.hasErrors()) {
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User currentUser = userService.findByUsername(userDetails.getUsername());
            question.setUser(currentUser);
            questionService.save(question);
            mailService.sendToAllAdmin("New Answer!", "New question posted: " + question.getContent());
            return "redirect:/askus";
        } else {
            return "/addTopic";
        }
    }

    @Secured({"ROLE_USER"})
    @RequestMapping(value = "/saveAnswer", method = RequestMethod.POST)
    public String saveAnswer(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {

        String content = request.getParameter("content");
        if (content == null || content.equals("") || content.length() > 400) {
            redirectAttributes.addFlashAttribute("error", true);
            return "redirect:/askus/" + request.getParameter("currentPage");
        }

        Answer answer = new Answer();
        answer.setContent(request.getParameter("content"));
        Question question = questionService.findById(Long.parseLong(request.getParameter("questionId")));
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = userService.findByUsername(userDetails.getUsername());
        answer.setQuestion(question);
        answer.setUser(currentUser);
        answerService.save(answer);
        mailService.sendToAllAdmin("New Answer!", "New answer posted: " + answer.getContent());
        return "redirect:/askus/" + request.getParameter("currentPage");

    }

    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/deleteQuestion", method = RequestMethod.POST)
    public String deleteQuestion(Model model, HttpServletRequest request) {
        Long id = Long.parseLong(request.getParameter("id"));
        questionService.deleteById(id);
        return "redirect:/askus/" + request.getParameter("currentPage");
    }

    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/deleteAnswer", method = RequestMethod.POST)
    public String deleteAnswer(Model model, HttpServletRequest request) {
        Long id = Long.parseLong(request.getParameter("id"));
        answerService.deleteById(id);
        return "redirect:/askus/" + request.getParameter("currentPage");
    }
}