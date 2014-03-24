package my.app.stoma.controller;

import my.app.stoma.domain.Question;
import my.app.stoma.domain.Role;
import my.app.stoma.domain.User;
import my.app.stoma.repository.RoleRepository;
import my.app.stoma.service.UserService;
import my.app.stoma.utils.validators.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by bmatragociu on 3/24/2014.
 */
@Controller
@RequestMapping(value="signup")
public class SignUpController {


    @Autowired
    private UserValidator userValidator;
    @Autowired
    UserService userService;
    @Autowired
    RoleRepository roleRepository;



    @InitBinder(value = "user")
    public void binder(HttpServletRequest request,
                       ServletRequestDataBinder binder) {
        binder.setValidator(userValidator);
    }


    @RequestMapping(value="")
    public static String signUp(Model model, HttpServletRequest request){
        model.addAttribute("user", new User());
        return "/signUp";
    }


    @RequestMapping(value = "/saveUser", method = {RequestMethod.POST, RequestMethod.GET})
    public String saveUser (Model model, @ModelAttribute(value = "user") @Valid  User user, BindingResult bindingResult, HttpServletRequest request) {

        if (bindingResult.hasErrors()) {
            return "/signUp";
        }

        List<Role> list=new ArrayList<Role>();
        list.add(roleRepository.findByAuthority("ROLE_USER"));
        user.setRoles(list);
        userService.save(user);
        return "redirect:/";
    }

}
