package my.app.stoma.controller;

import my.app.stoma.domain.Event;
import my.app.stoma.service.EventService;
import my.app.stoma.service.PictureService;
import my.app.stoma.utils.LocaleUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {
        model.addAttribute("events",eventService.findByLocale(LocaleUtils.getLanguage(request)));
        return "/events";
    }

    @RequestMapping(value = "show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable Long id, Model model, HttpServletRequest request) {
        model.addAttribute("event",eventService.findOne(id));
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


}
