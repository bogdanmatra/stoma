package my.app.stoma.controller.security;

import my.app.stoma.domain.security.Role;
import my.app.stoma.domain.security.User;
import my.app.stoma.repository.security.RoleRepository;
import my.app.stoma.service.security.UserService;
import my.app.stoma.utils.validators.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by bmatragociu on 3/24/2014.
 */
@Controller
public class LogInSignUpController {


    @Autowired
    private UserValidator userValidator;
    @Autowired
    UserService userService;
    @Autowired
    RoleRepository roleRepository;


    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(Model model, Boolean invalidData, Boolean applicationError, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        request.getSession().setAttribute("url_prior_login", request.getHeader("Referer"));
        return "/login";
    }

    @RequestMapping(value = "previous", method = RequestMethod.GET)
    public String previous(Model model, Boolean invalidData, Boolean applicationError, HttpServletRequest request, HttpSession session) {
        String url="/";
        String prior = (String) request.getSession().getAttribute("url_prior_login");
        if (session != null && prior!=null && !prior.isEmpty() ) {
            url = prior;
        }
        return "redirect:" + url;
    }


    @RequestMapping(value = "loginfailed", method = RequestMethod.GET)
    public String loginfailed(Model model, Boolean invalidData, Boolean applicationError, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", true);
        return "redirect:/login";
    }

    @InitBinder(value = "user")
    public void binder(HttpServletRequest request,
                       ServletRequestDataBinder binder) {
        binder.setValidator(userValidator);
    }


    @RequestMapping(value = "signup")
    public static String signUp(Model model, HttpServletRequest request) {
        model.addAttribute("user", new User());
        return "/signUp";
    }

    @RequestMapping(value = "editme/{username}")
    public String signUp(@PathVariable String username, Model model, HttpServletRequest request) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = userService.findByUsername(userDetails.getUsername());
        if(currentUser.getUsername().equals(username)) {
            model.addAttribute("user", userService.findByUsername(username));
        }else{
            return null;
        }
        return "/signUp";
    }


    @RequestMapping(value = "signup/saveUser", method = {RequestMethod.POST, RequestMethod.GET})
    public String saveUser(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult bindingResult, HttpServletRequest request) {

        if (bindingResult.hasErrors()) {
            return "/signUp";
        }
        if (user.getId()!=null){
            user.setRoles(userService.findById(user.getId()).getRoles());
        }else{
            List < Role > list = new ArrayList<Role>();
            list.add(roleRepository.findByAuthority("ROLE_USER"));
            user.setRoles(list);
        }
        userService.save(user);
        return "redirect:/";
    }

}
