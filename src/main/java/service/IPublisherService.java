package service;

import model.Publisher;

import java.util.List;

public interface IPublisherService {

    int addPublisher(Publisher publisher) throws Exception;

    int removePublisher(Publisher publisher) throws Exception;

    int modifyPublisher(Publisher publisher) throws Exception;

    List<Publisher> findAll() throws Exception;
}
