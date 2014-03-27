package my.app.stoma.service;

import my.app.stoma.domain.Domain;
import my.app.stoma.repository.DomainRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by bmatragociu on 3/27/2014.
 */
@Service
public class DomainService {

    @Autowired
    DomainRepository domainRepository;

    @Transactional(readOnly = true)
    public List<Domain> findAll() {
        return domainRepository.findAll();
    }

    @Transactional(readOnly = false)
    public Domain save(Domain domain) {
        return domainRepository.save(domain);
    }


}
