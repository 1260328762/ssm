package controller;

import model.Page;
import model.SystemLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ISystemLogService;

import java.util.List;

/**
 * 系统日志处理器
 */
@Controller
@RequestMapping("/system")
public class SystemLogController {

    @Autowired
    private ISystemLogService service;


    @RequestMapping("/loglist.do")
    public String logList(Model model, Page page, SystemLog log) throws Exception {
        page.setPage(page.getPageIndex(), service.getCount(log));
        log.setPage(page);
        List<SystemLog> list = service.selectByPage(log);
        model.addAttribute("loglist",list);
        model.addAttribute("page",page);
        return "log/loglist";
    }
}
