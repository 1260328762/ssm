package mapper;

import model.User;

import java.util.List;

public interface IUserMapper {

    User selectByName(User user);

    User selectById(User user);

    List<User> selectAll();

    void update(User user);

    void delete(User user);

    List<User> selectByCon(User user);

    void insert(User user);


}
