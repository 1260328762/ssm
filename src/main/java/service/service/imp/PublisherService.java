package service.service.imp;

import mapper.IPublisherMapper;
import model.Publisher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.IPublisherService;

import java.util.List;

@Service
@Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
public class PublisherService implements IPublisherService {

    @Autowired
    private IPublisherMapper mapper;

    public int addPublisher(Publisher publisher) throws Exception {
        return mapper.insert(publisher);
    }

    public int removePublisher(Publisher publisher) throws Exception {
        return mapper.delete(publisher);
    }

    public int modifyPublisher(Publisher publisher) throws Exception {
        return mapper.update(publisher);
    }

    @Transactional(readOnly = true)
    public List<Publisher> findAll() throws Exception {
        return mapper.selectAll();
    }
}
