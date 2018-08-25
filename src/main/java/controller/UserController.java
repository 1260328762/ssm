package controller;

import aspect.SysContent;
import model.SystemLog;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ISystemLogService;
import service.IUserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService service;
    @Autowired
    private ISystemLogService logService;
    private static String path = null;

    /**
     * 跳转到登录界面
     * @return 返回视图
     */
    @RequestMapping("/tologin")
    public String toLogin(){
        return "login/login";
    }




    /**
     * 跳转到用户添加界面
     * @return
     */
    @RequestMapping("/touseradd")
    public String toUserAdd(){
        return "user/useradd";
    }




    /**
     * 登录成功后跳转到主页面
     * @return
     */
    @RequestMapping("/toindex")
    public String toIndex(){
        return "main/index";
    }




    /**
     * 跳转到frame框架中的左边页面
     * @return
     */
    @RequestMapping("/toleft")
    public String toLeft(){
        return "main/left";
    }




    /**
     * 跳转到frame框架中的顶部页面
     * @return
     */
    @RequestMapping("/totop")
    public String toRight(){
        return "main/top";
    }





    /**
     * 跳转到frame框架中的欢迎页面
     * @return
     */
    @RequestMapping("/towel")
    public String toWel(){
        return "main/wel";
    }




    /**
     * 跳转到修改密码界面
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/tomodifyuser")
    public String toModifyUser(User user,Model model){
        model.addAttribute("userid",user.getId());
        return "user/modipw";
    }




    /**
     * 验证用户登录
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("/login.do")
    @ResponseBody
    public int login(User user, HttpSession session,HttpServletRequest request) throws Exception {
        User findUser = service.findByusername(user);
        if(findUser!=null){
            if(findUser.getPassword().equals(user.getPassword())){
                session.setAttribute("sessionUser", findUser);
                //登录成功后将登录日志写入到数据库中
                logService.addLog(findUser.getUsername()+":登录");
                path = request.getContextPath();
                return 1;
            }
        }
        return 0;
    }




    /**
     * 显示指定用户详细信息,跳转到用户管理界面
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/userinfo.do")
    public String userInfo(User user,Model model,HttpSession session){
        //判断用户等级
        User findUser2 = (User) session.getAttribute("sessionUser");
        if(findUser2.getIsadmin()!=3){
            if (findUser2.getId()!=user.getId()) {
                return "error/permission";
            }
        }

        try {
            User findUser = service.findById(user);
            model.addAttribute("userinfo",findUser);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/userinfo";
    }




    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("/useradd.do")
    public String userAdd(User user,HttpSession session) throws Exception {
        int isadmin = CheckUser(session);
        //验证用户是否有权限添加用户
        if(isadmin!=3){
            return "error/permission";
        }

        service.addUser(user);
        user = (User) session.getAttribute("sessionUser");
        logService.addLog(user.getUsername()+":添加了一个用户");
        return "redirect:/user/userlist.do";

    }




    /**
     *  更新用户信息
     * @param user
     * @return
     */
    @RequestMapping("usermodify.do")
    public String modifyUser(User user, HttpSession session, HttpServletRequest request){
        User findUser = (User) session.getAttribute("sessionUser");
        //判断用户有没有权限修改等级
        if(findUser.getIsadmin()!=3){
            user.setIsadmin(findUser.getIsadmin());
        }

        try {
            service.modifyUser(user);
            logService.addLog(findUser.getUsername()+":更新了用户信息");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect: "+path+"/user/userinfo.do?id="+user.getId();
    }



    /**
     * 删除用户信息
     * @param user
     * @return
     */
    @RequestMapping("userdel.do")
    public String deleteUser(User user,HttpSession session){
        User findUser = (User) session.getAttribute("sessionUser");
        //判断用户是否有权限删除用户
        if(findUser.getIsadmin()!=3){
            return "error/permission";
        }else{
            if(user.getIsadmin()==findUser.getIsadmin()){
                return "error/delerror";
            }
        }

        try {
            service.removeUser(user);
            logService.addLog(findUser.getUsername()+":删除一条用户信息id为:"+user.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/user/userlist.do";
    }




    /**
     * 验证用户名是否重复
     * @param user
     * @return
     */
    @RequestMapping("/usercheck.do")
    @ResponseBody
    public boolean userCheck(User user){
        try {
            User findUser = service.findByusername(user);
            if(findUser==null){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }




    /**
     * 查询用户列表
     * @param model
     * @return
     */
    @RequestMapping("/userlist.do")
    public String userList(Model model,HttpSession session) throws Exception {
        List<User> list = null;
        int i = CheckUser(session);

        //判断是不是系统管理员,如果是,就把所有用户查出来,如果不是就只查自己
        if(i!=3){
            User user = (User) session.getAttribute("sessionUser");
            list = new ArrayList<>();
            list.add(user);
            model.addAttribute("userlist",list);
        }else{
            list = service.findAll();
            model.addAttribute("userlist",list);
        }

        return "user/userlist";
    }




    /**
     * 修改密码
     * @param user
     * @return
     */
    @RequestMapping("/modifyPw.do")
    public String modifyPw(User user,Model model,HttpSession session){
        User findUser = (User) session.getAttribute("sessionUser");
        if(findUser.getIsadmin()!=3){
            if(!findUser.getId().equals(user.getId())){
                return "error/permission";
            }else{
                try {
                    service.modifyUser(user);
                    model.addAttribute("userid",user.getId());
                    logService.addLog(findUser.getUsername()+":修改密码");
                    session.removeAttribute("sessionUser");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return "note/note2";
            }
        }else{
           if(findUser.getId().equals(user.getId())){
               try {
                   service.modifyUser(user);
                   model.addAttribute("userid",user.getId());
                   logService.addLog(findUser.getUsername()+":修改密码");
                   session.invalidate();
               } catch (Exception e) {
                   e.printStackTrace();
               }
               return "note/note2";

           }else{
               try {
                   service.modifyUser(user);
                   logService.addLog(findUser.getUsername()+":修改了其他人的密码");
               } catch (Exception e) {
                   e.printStackTrace();
               }
               model.addAttribute("userid",user.getId());
               return "note/note";
           }
        }
    }



    /**验证旧密码是否正确
     *
     * @return
     */
    @RequestMapping("/checkPw.do")
    @ResponseBody
    public boolean checkPw(User user,String opassword){

        try {
            User findUser = service.findById(user);
            if(opassword.equals(findUser.getPassword())){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("/logout.do")
    public String exit(HttpSession session) throws Exception {
        User user = (User) session.getAttribute("sessionUser");
        session.removeAttribute("sessionUser");
        logService.addLog(user.getUsername()+":退出登录");
        return "login/login";
    }



    /**
     * 筛选用户
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/userfilter.do")
    public String userFilter(User user,Model model,HttpSession session){
        User findUser = (User) session.getAttribute("sessionUser");
        if(findUser.getIsadmin()!=3){
            return "error/permission";
        }
        try {
            List<User> list = service.findByCon(user);
            model.addAttribute("userlist",list);
            model.addAttribute("username",user.getUsername());
            model.addAttribute("isadmin",user.getIsadmin());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/userlist";
    }







    /**
     * 验证用户权限
     * @return
     */
    private int CheckUser(HttpSession session){
        User user = (User) session.getAttribute("sessionUser");
        return user.getIsadmin();
    }





}


























