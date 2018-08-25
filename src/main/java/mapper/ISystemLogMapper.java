package mapper;

import model.SystemLog;

import java.util.List;

public interface ISystemLogMapper {

    int insert (SystemLog log) throws Exception;

    List<SystemLog> selectByPage(SystemLog log) throws Exception;

    int selectCount(SystemLog log) throws Exception;
}
