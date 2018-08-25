package service.service.imp;

import mapper.IBookMapper;
import model.Book;
import model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.IBookService;

import java.util.List;

@Service
@Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
public class BookService implements IBookService {

    @Autowired
    private IBookMapper mapper;

    public int addBook(Book book) throws Exception {
        return mapper.insert(book);
    }

    public int removeBook(Book book) throws Exception {
        return mapper.delete(book);
    }

    public int modifyBook(Book book) throws Exception {
        return mapper.update(book);
    }

    @Transactional(readOnly = true)
    public Book finfById(Book book) throws Exception {
        return mapper.selectById(book);
    }

    @Transactional(readOnly = true)
    public Book findByName(Book book) throws Exception {
        return mapper.selectByName(book);
    }

    @Transactional(readOnly = true)
    public List<Book> findByCon(Book book) throws Exception {
        return mapper.selectByCon(book);
    }

    public void batchRemove(int[] bids) throws Exception {

        mapper.batchDelete(bids);
    }

    @Transactional(readOnly = true)
    public List<Book> findByPage(Page page) throws Exception {
        return mapper.selectByPage(page);
    }

    @Transactional(readOnly = true)
    public int getCount() throws Exception {
        return mapper.selectCount();
    }

    @Transactional(readOnly = true)
    public int findCountByCon(Book book) throws Exception {
        return mapper.selectCountByCon(book);
    }

    @Transactional(readOnly = true)
    public List<Book> findAll() throws Exception {
        return mapper.selectAll();
    }
}
