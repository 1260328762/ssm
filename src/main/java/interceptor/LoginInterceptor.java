package interceptor;

import aspect.SysContent;
import model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o)
            throws Exception {
       boolean flag =  request.getRequestURI().endsWith("tologin");
       boolean flag2 = request.getRequestURI().endsWith("login.do");
       if(flag || flag2){
           return true;
       }else{
          User user = (User) request.getSession().getAttribute("sessionUser");
          if(user!=null){
              return true;
          }
       }
        response.sendRedirect(request.getContextPath()+"/user/tologin");
        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
