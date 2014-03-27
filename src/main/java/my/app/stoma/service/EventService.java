package my.app.stoma.service;

import my.app.stoma.domain.Event;
import my.app.stoma.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
        return eventRepository.findAll();
    }

    @Transactional(readOnly = false)
    public Event save(Event event) {
        return eventRepository.save(event);
    }

}
