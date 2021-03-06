package my.app.stoma.controller;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.Comment;
import my.app.stoma.domain.Domain;
import my.app.stoma.domain.News;
import my.app.stoma.domain.security.User;
import my.app.stoma.service.*;
import my.app.stoma.service.security.UserService;
import my.app.stoma.utils.JSoupStripClass;
import my.app.stoma.utils.LocaleUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * Created by bmatragociu on 3/14/14.
 */
@Controller
@RequestMapping(value = "articles")
public class ArticlesController {


    @Autowired
    ArticleService articleService;

    @Autowired
    DomainService domainService;

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;
    @Autowired
    PictureService pictureService;
    @Autowired
    MailService mailService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView index(Model model, HttpServletRequest request) {

        Map<String,List<Domain>> map= domainService.getTwoListsStAndGen(LocaleUtils.getLanguage(request));
        model.addAttribute(map);
        model.addAttribute("newsOrArticles","getArticles");
        return new ModelAndView("/news",model.asMap());
    }


    @RequestMapping(value = "/getArticles/{id}/{pageNumber}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<Article> getArticles(@PathVariable Long id,@PathVariable int pageNumber, HttpServletRequest request) {
        if (id==-1){
            Page<Article> pagesAll=articleService.findAllByLanguage(LocaleUtils.getLanguage(request),pageNumber);
            for (Article n : pagesAll.getContent()){
                n.setContent(JSoupStripClass.jsoupStrip(n.getContent()));
            }
            return pagesAll;
        }
        Page<Article> page = articleService.findAllByDomain(domainService.findById(id),pageNumber);
        for (Article n : page.getContent()){
            n.setContent(JSoupStripClass.jsoupStrip(n.getContent()));
        }
        return page;
    }



    @RequestMapping(value = "/getArticles/view/{id}", method = RequestMethod.GET)
    public ModelAndView getArticles(@PathVariable Long id, HttpServletRequest request, Model model) {
        model.addAttribute("news", articleService.findById(id));
        return new ModelAndView("/view",model.asMap());
    }

    @Secured("ROLE_USER")
    @RequestMapping(value = "/saveComment/{id}", method = RequestMethod.POST)
    public String saveComment(@PathVariable Long id, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {

        String content = request.getParameter("content");

        if (content == null || content.equals("") || content.length() > 400) {
            redirectAttributes.addFlashAttribute("error", true);
            return "redirect:/articles/getArticles/view/" + id;
        }

        Comment comment = new Comment();
        comment.setContent(content);
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = userService.findByUsername(userDetails.getUsername());
        comment.setUser(currentUser);
        comment.setArticle(articleService.findById(id));
        commentService.save(comment);
        mailService.sendToAllAdmin("New article comment!", "New article comment: " + comment.getContent() + "\nhttp://www.medbox.info/stoma/articles/getArticles/view/" + id);
        return "redirect:/articles/getArticles/view/" + id;

    }

    @Secured("ROLE_ADMIN")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Long id, HttpServletRequest request, Model model, HttpSession session) {
        String path = session.getServletContext().getRealPath("/");
        pictureService.deleteListFromHDD(articleService.findById(id).getPictures(),path);
        articleService.delete(id);
        articleService.delete(id);
        return "redirect:/articles/";
    }

    @Secured("ROLE_ADMIN")
    @RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
    public String deleteComment(HttpServletRequest request, Model model) {
        String commentId =request.getParameter("id");
        String articleId = request.getParameter("theId");
        commentService.delete(Long.parseLong(commentId));
        return "redirect:/articles/getArticles/view/" + articleId;
    }





}
