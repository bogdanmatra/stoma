package my.app.stoma.controller;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.Domain;
import my.app.stoma.domain.News;
import my.app.stoma.domain.Picture;
import my.app.stoma.domain.security.Role;
import my.app.stoma.domain.security.User;
import my.app.stoma.service.ArticleService;
import my.app.stoma.service.DomainService;
import my.app.stoma.service.NewsService;
import my.app.stoma.service.PictureService;
import my.app.stoma.service.security.RoleService;
import my.app.stoma.service.security.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.data.domain.Page;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by bmatragociu on 4/4/2014.
 */
@Controller
@Secured("ROLE_ADMIN")
public class AdminMenuController {

    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Autowired
    DomainService domainService;
    @Autowired
    NewsService newsService;
    @Autowired
    ArticleService articleService;
    @Autowired
    PictureService pictureService;



    //User edit
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

    @RequestMapping(value = "edituser/promote", method = RequestMethod.POST)
    @ResponseBody
    public void promote(Model model, HttpServletRequest request) {
        Long id=Long.parseLong(request.getParameter("id"));
        User selectedUser=userService.findById(id);
        Role adminRole=roleService.getRoleByAuthority("ROLE_ADMIN");
        List<Role> roles = selectedUser.getRoles();
        roles.add(adminRole);
        selectedUser.setRoles(roles);
        userService.save(selectedUser);
    }

    @RequestMapping(value = "edituser/delete", method = RequestMethod.POST)
    @ResponseBody
    public void delete(Model model, HttpServletRequest request) {
        Long id=Long.parseLong(request.getParameter("id"));
        if(userService.findAllWithRole("ROLE_ADMIN").size()>=1  ){
            userService.delete(userService.findById(id));
        }
    }





    //Add news or articles
    @RequestMapping(value = "addNorA/{newsOrArticle}")
    public String add(@PathVariable String newsOrArticle, Model model, HttpServletRequest request) {
        if(newsOrArticle.equals("n")){
            model.addAttribute("nOrA", new News());
            model.addAttribute("action", "saveNews");
        }else if(newsOrArticle.equals("a")){
            model.addAttribute("nOrA", new Article());
            model.addAttribute("action", "saveArticle");
        }
        return "/addNorA";
    }


    @RequestMapping(value = "addNorA/saveArticle", method = {RequestMethod.POST, RequestMethod.GET})
    public String saveArticle(Model model,@ModelAttribute(value = "nOrA") @Valid Article article, BindingResult bindingResult, HttpServletRequest request, HttpSession session) throws IOException {
        if (bindingResult.hasErrors()) {
            model.addAttribute("action", "saveArticle");
            return "/addNorA";
        }else{
            String path = session.getServletContext().getRealPath("/");
            List<Picture> pictureList=new ArrayList<Picture>();
            List<MultipartFile> files = article.getFiles();
            Article savedArticle = articleService.save(article);
            if (null != files && files.size() > 0) {
                for (MultipartFile multipartFile : files) {
                    String fileName = multipartFile.getOriginalFilename();
                    if (!"".equalsIgnoreCase(fileName) && multipartFile.getContentType().startsWith("image")) {
                        Picture picture =new Picture(multipartFile, path);
                        picture.setArticle(savedArticle);
                        pictureService.save(picture);
                    }
                }
            }
        }
        return "redirect:/articles/";
    }

    @RequestMapping(value = "addNorA/saveNews", method = {RequestMethod.POST, RequestMethod.GET})
    public String saveNews(Model model,@ModelAttribute(value = "nOrA") @Valid News news, BindingResult bindingResult, HttpServletRequest request, HttpSession session) throws IOException {
        if (bindingResult.hasErrors()) {
            model.addAttribute("action", "saveNews");
            return "/addNorA";
        }else{
            String path = session.getServletContext().getRealPath("/");
            List<Picture> pictureList=new ArrayList<Picture>();
            List<MultipartFile> files = news.getFiles();
            News savedNews = newsService.save(news);
            if (null != files && files.size() > 0) {
                for (MultipartFile multipartFile : files) {
                    String fileName = multipartFile.getOriginalFilename();
                    if (!"".equalsIgnoreCase(fileName) && multipartFile.getContentType().startsWith("image")) {
                        Picture picture =new Picture(multipartFile, path);
                        picture.setNews(savedNews);
                        pictureService.save(picture);
                    }
                }
            }
        }
        return "redirect:/news/";
    }

    @RequestMapping(value = "fetchDomainList", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<Domain> fetchDomains(Model model, HttpServletRequest request) {
        String deomMed=request.getParameter("domMed");
        String locale=request.getParameter("locale");
        return domainService.getByLocaleAndDomMed(locale,deomMed);
    }



    @InitBinder
    protected void binder(HttpServletRequest request,
                          ServletRequestDataBinder binder) {
        binder.registerCustomEditor(List.class, "domains",
                new CustomCollectionEditor(List.class) {
                    @Override
                    protected Object convertElement(Object element) {
                        Domain domain = new Domain();
                        if (element != null) {
                            Long id = Long.valueOf(element.toString());
                            domain = domainService.findById(id);
                        }
                        return domain;
                    }
                });
    }




    //Contact Edit
    @RequestMapping(value = "contactEdit", method = RequestMethod.GET)
    public String contact(Model model, HttpServletRequest request) {

        return "/contactEdit";
    }

    //Contact Edit
    @RequestMapping(value = "addDomain", method = RequestMethod.GET)
    public String addDomain(Model model, HttpServletRequest request) {
        Domain domain =  new Domain();
        domain.setLocale("ro");
        domain.setDomMedical("st");
        model.addAttribute("domain", domain);
        return "/addDomain";
    }

    @RequestMapping(value = "saveDomain", method = {RequestMethod.POST, RequestMethod.GET})
    public String saveDomain(Model model,@ModelAttribute(value = "domain") @Valid Domain domain, BindingResult bindingResult, HttpServletRequest request, HttpSession session) throws IOException {

        if (bindingResult.hasErrors()) {
            return "/addDomain";
        }else{
            domainService.save(domain);
            return "redirect:/stoma";
        }
    }
}
