package service.service.imp;

import aspect.SysContent;
import mapper.ISystemLogMapper;
import model.SystemLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.ISystemLogService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional(isolation = Isolation.READ_COMMITTED,propagation = Propagation.REQUIRED)
public class SystemLogService implements ISystemLogService {

    @Autowired
    private ISystemLogMapper mapper;


    public int addLog(String content) throws Exception {
        System.out.println("-----------------------"+SysContent.getRequest());
        String ip = SysContent.getRequest().getRemoteAddr();
        String agent = SysContent.getRequest().getHeader("User-Agent");
        Date date = new Date();
        SystemLog log = new SystemLog();
        log.setLogTime(date);
        log.setLogContent(content);
        log.setBrowser(agent.substring(0,35));
        log.setIp(ip);
        return mapper.insert(log);
    }


    @Transactional(readOnly = true)
    public List<SystemLog> selectByPage(SystemLog log) throws Exception {
        List<SystemLog> list = mapper.selectByPage(log);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(SystemLog l:list){
            l.setLogtime(format.format(l.getLogTime()));
        }
        return list;
    }


    @Transactional(readOnly = true)
    public int getCount(SystemLog log) throws Exception {
        return mapper.selectCount(log);
    }
}
