package my.app.stoma.controller;

import my.app.stoma.domain.Comment;
import my.app.stoma.domain.Domain;
import my.app.stoma.domain.News;
import my.app.stoma.domain.security.User;
import my.app.stoma.service.CommentService;
import my.app.stoma.service.DomainService;
import my.app.stoma.service.NewsService;
import my.app.stoma.service.security.UserService;
import my.app.stoma.utils.LocaleUtils;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by bmatragociu on 3/7/14.
 */
@Controller
@RequestMapping(value = "news")
public class NewsController {

    @Autowired
    NewsService newsService;
    @Autowired
    DomainService domainService;
    @Autowired
    CommentService commentService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView index(Model model, HttpServletRequest request) {

        Map<String,List<Domain>> map= domainService.getTwoListsStAndGen(LocaleUtils.getLanguage(request));
        model.addAttribute("st",map.get("st"));
        model.addAttribute("gen",map.get("ge"));
        model.addAttribute("newsOrArticles","getNews");
        return new ModelAndView("/news",model.asMap());
    }


    @RequestMapping(value = "/getNews/{id}/{pageNumber}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<News> getNews(@PathVariable Long id,@PathVariable int pageNumber, HttpServletRequest request) {
        if (id==-1){
            return newsService.findAllByLanguage(LocaleUtils.getLanguage(request),pageNumber);
        }
        Page<News> page = newsService.findAllByDomain(domainService.findById(id),pageNumber);
        return page;
    }


    @RequestMapping(value = "/getNews/view/{id}", method = RequestMethod.GET)
    public ModelAndView getNews(@PathVariable Long id, HttpServletRequest request, Model model) {
        model.addAttribute("news", newsService.findById(id));
        return new ModelAndView("/view",model.asMap());
    }

    @Secured("ROLE_USER")
    @RequestMapping(value = "/saveComment/{id}", method = RequestMethod.POST)
    public String saveComment(@PathVariable Long id, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

        String content = request.getParameter("content");

        if (content == null || content.equals("") || content.length() > 400) {
            redirectAttributes.addFlashAttribute("error", true);
            return "redirect:/news/getNews/view/" + id;
        }

            Comment comment = new Comment();
            comment.setContent(content);
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User currentUser = userService.findByUsername(userDetails.getUsername());
            comment.setUser(currentUser);
            comment.setNews(newsService.findById(id));
            commentService.save(comment);

        return "redirect:/news/getNews/view/" + id;

    }


}
