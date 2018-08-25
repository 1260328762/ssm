package service;

import model.User;

import java.util.List;

public interface IUserService {
    User findByusername(User user) throws Exception;

    List<User> findAll() throws Exception;

    User findById(User user) throws Exception;

    void modifyUser(User user) throws Exception;

    void removeUser(User user) throws Exception;

    List<User> findByCon(User user) throws Exception;

    void addUser(User user)throws Exception;
}
