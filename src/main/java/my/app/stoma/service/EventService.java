package my.app.stoma.service;

import my.app.stoma.domain.Event;
import my.app.stoma.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */

@Service
public class EventService {

    @Autowired
    EventRepository eventRepository;

    @Transactional(readOnly = true)
    public List<Event> findAll() {
        return eventRepository.findAll(new Sort(
                Sort.Direction.DESC, "createdDate"));
    }

    @Transactional(readOnly = true)
    public List<Event> findByLocale(String locale) {
        return eventRepository.findByLocale(locale);
    }


    @Transactional(readOnly = false)
    public Event save(Event event) {
        return eventRepository.save(event);
    }

    @Transactional(readOnly = true)
    public Event findOne(Long id) {
        return eventRepository.findOne(id);
    }

    @Transactional(readOnly = false)
    public void delete(Long id) {
         eventRepository.delete(id);
    }

}
