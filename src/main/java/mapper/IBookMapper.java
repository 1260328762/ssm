package mapper;

import model.Book;
import model.Page;

import java.util.List;

public interface IBookMapper {

    int insert(Book book) throws Exception;

    int delete(Book book) throws Exception;

    void batchDelete(int[] bids) throws Exception;

    int update(Book book) throws Exception;

    Book selectById(Book book) throws Exception;

    Book selectByName(Book book) throws Exception;

    List<Book> selectByCon(Book book) throws Exception;

    List<Book> selectAll() throws Exception;

    int selectCount() throws Exception;

    List<Book> selectByPage(Page page) throws Exception;

    int selectCountByCon(Book book) throws Exception;

}
