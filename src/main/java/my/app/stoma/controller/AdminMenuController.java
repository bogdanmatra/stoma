package my.app.stoma.controller;

import my.app.stoma.domain.Article;
import my.app.stoma.domain.News;
import my.app.stoma.domain.security.Role;
import my.app.stoma.domain.security.User;
import my.app.stoma.repository.security.UserRepository;
import my.app.stoma.service.security.RoleService;
import my.app.stoma.service.security.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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
        if(userService.findAllWithRole("ROLE_ADMIN").size()>1){
            userService.delete(userService.findById(id));
        }
    }





    //Add news or articles
    @RequestMapping(value = "addNorA/{newsOrArticle}", method = RequestMethod.GET)
    public String add(@PathVariable String newsOrArticle, Model model, HttpServletRequest request) {
        if(newsOrArticle.equals("n")){
            model.addAttribute("nOrA", new News());
            model.addAttribute("action", "saveNews");
        }else if(newsOrArticle.equals("a")){
            model.addAttribute("nOrA", new Article());
            model.addAttribute("action", "saveArticle");
        }else{
            model.addAttribute("nOrA", null);
        }
        return "/addNorA";
    }


    @RequestMapping(value = "saveArticle", method = RequestMethod.POST)
    public String saveArticle(Model model,@ModelAttribute(value = "article") @Valid Article article, BindingResult bindingResult, HttpServletRequest request) {
        return "redirect:/";
    }
    @RequestMapping(value = "saveNews", method = RequestMethod.POST)
    public String saveNews(Model model,@ModelAttribute(value = "article") @Valid News news, BindingResult bindingResult, HttpServletRequest request) {
        return "redirect:/";
    }






    //Contact Edit
    @RequestMapping(value = "contactEdit", method = RequestMethod.GET)
    public String contact(Model model, HttpServletRequest request) {

        return "/contactEdit";
    }


}
