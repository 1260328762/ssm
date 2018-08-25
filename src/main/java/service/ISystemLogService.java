package service;

import model.SystemLog;

import java.util.List;

public interface ISystemLogService {

    int addLog(String content) throws Exception;

    List<SystemLog> selectByPage(SystemLog log) throws Exception;

    int getCount(SystemLog log) throws Exception;
}
