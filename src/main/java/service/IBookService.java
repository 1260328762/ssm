package service;

import model.Book;
import model.Page;

import java.util.List;

public interface IBookService {
    int addBook(Book book) throws Exception;

    int removeBook(Book book) throws Exception;

    void batchRemove(int[] bids) throws Exception;

    int modifyBook(Book book) throws Exception;

    Book finfById(Book book) throws Exception;

    Book findByName(Book book) throws Exception;

    List<Book> findByCon(Book book) throws Exception;

    List<Book> findAll() throws Exception;

    int getCount() throws Exception;

    List<Book> findByPage(Page page) throws Exception;

    int findCountByCon(Book book) throws Exception;
}
