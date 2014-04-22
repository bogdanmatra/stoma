package my.app.stoma.controller;

import my.app.stoma.service.EventService;
import my.app.stoma.utils.LocaleUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by bmatragociu on 3/14/14.
 */
@Controller
@RequestMapping(value = "events")
public class EventsController {

    @Autowired
    EventService eventService;

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

}
