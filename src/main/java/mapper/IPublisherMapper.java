package mapper;

import model.Publisher;

import java.util.List;

public interface IPublisherMapper {

    int insert(Publisher publisher) throws Exception;

    int delete(Publisher publisher) throws Exception;

    int update(Publisher publisher) throws Exception;

    List<Publisher> selectAll() throws Exception;
}
