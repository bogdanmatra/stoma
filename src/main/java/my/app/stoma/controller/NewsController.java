package my.app.stoma.controller;

import my.app.stoma.domain.Domain;
import my.app.stoma.domain.News;
import my.app.stoma.service.DomainService;
import my.app.stoma.service.NewsService;
import my.app.stoma.utils.LocaleUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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




}
