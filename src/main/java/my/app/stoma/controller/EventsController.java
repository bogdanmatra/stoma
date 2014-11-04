package my.app.stoma.controller;

import my.app.stoma.domain.Comment;
import my.app.stoma.domain.Event;
import my.app.stoma.domain.security.User;
import my.app.stoma.service.CommentService;
import my.app.stoma.service.EventService;
import my.app.stoma.service.MailService;
import my.app.stoma.service.PictureService;
import my.app.stoma.service.security.UserService;
import my.app.stoma.utils.LocaleUtils;
import org.apache.poi.ss.formula.functions.Even;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

/**
 * Created by bmatragociu on 3/14/14.
 */
@Controller
@RequestMapping(value = "events")
public class EventsController {

    @Autowired
    EventService eventService;
    @Autowired
    PictureService pictureService;
    @Autowired
    UserService userService;
    @Autowired
    CommentService commentService;
    @Autowired
    MailService mailService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {
        model.addAttribute("events",eventService.findByLocale(LocaleUtils.getLanguage(request)));
        return "/events";
    }

    @RequestMapping(value = "show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable Long id, Model model, HttpServletRequest request) {
        Event chosen = eventService.findOne(id);
        chosen.incrementViewed();
        Event saved = eventService.save(chosen);
        model.addAttribute("event", saved);
        return "/showEvent";
    }

    @Secured("ROLE_ADMIN")
    @RequestMapping(value = "deleteEvent/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void deleteEvent(@PathVariable Long id, Model model, HttpServletRequest request, HttpSession session) {
        Event event = eventService.findOne(id);
        String path = session.getServletContext().getRealPath("/");
        pictureService.deleteListFromHDD(event.getPictures(),path);
        eventService.delete(id);
    }

    @Secured("ROLE_USER")
    @RequestMapping(value = "saveEventComment/{id}", method = RequestMethod.POST)
    public String saveEventComment(@PathVariable Long id, Model model, HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {
        String content = request.getParameter("content");

        if (content == null || content.equals("") || content.length() > 400) {
            redirectAttributes.addFlashAttribute("error", true);
            return "redirect:/events/show/" + id;
        }
        Comment comment = new Comment();
        comment.setContent(content);
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = userService.findByUsername(userDetails.getUsername());
        comment.setUser(currentUser);
        comment.setEvent(eventService.findOne(id));
        commentService.save(comment);
        mailService.sendToAllAdmin("New events comment!", "New events comment: " + comment.getContent() + "\nhttp://www.medbox.info/stoma/events/show/" + id);
        return "redirect:/events/show/" + id;
    }

    @Secured("ROLE_ADMIN")
    @RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
    public String deleteComment(HttpServletRequest request, Model model) {
        String commentId =request.getParameter("id");
        String eventId = request.getParameter("theId");
        commentService.delete(Long.parseLong(commentId));
        return "redirect:/events/show/" + eventId;
    }


}
