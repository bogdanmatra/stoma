package my.app.stoma.service;

import my.app.stoma.domain.Domain;
import my.app.stoma.repository.DomainRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Transactional(readOnly = false)
    public Map<String,List<Domain>> getTwoListsStAndGen(String locale) {
        Map<String,List<Domain>> twoLists = new HashMap<>();
        twoLists.put("st",domainRepository.findDomainsByLocaleAndMedD("st",locale));
        twoLists.put("ge",domainRepository.findDomainsByLocaleAndMedD("ge",locale));
        return twoLists;
    }

    @Transactional(readOnly = true)
    public Domain findById(Long id) {
        return domainRepository.findOne(id);
    }


}
