package service.service.imp;

import mapper.IUserMapper;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.IUserService;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.REPEATABLE_READ)
public class UserService implements IUserService {

    @Autowired
    private IUserMapper mapper;


    @Transactional(readOnly = true)
    public User findByusername(User user){
        return mapper.selectByName(user);
    }




    @Transactional(readOnly = true)
    public List<User> findAll(){
        return mapper.selectAll();
    }



    public void modifyUser(User user){
        mapper.update(user);
    }


    public User findById(User user) throws Exception {
        return mapper.selectById(user);
    }

    public void addUser(User user) throws Exception {
        mapper.insert(user);
    }

    public List<User> findByCon(User user) throws Exception {
        return mapper.selectByCon(user);
    }

    public void removeUser(User user){
        mapper.delete(user);
    }
}
