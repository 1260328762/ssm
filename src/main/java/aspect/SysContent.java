package aspect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 使用本地线程绑定系统常量
 */
public class SysContent {
    private static ThreadLocal<HttpServletRequest> requestLocal = new ThreadLocal<>();
    private static ThreadLocal<HttpServletResponse> responseLocal = new ThreadLocal<>();
    private static ThreadLocal<HttpSession> sessionLocal = new ThreadLocal<>();


    public static void setRequest(HttpServletRequest request){
        requestLocal.set(request);
    }

    public static HttpServletRequest getRequest(){
        return requestLocal.get();
    }




    public static void setResponse(HttpServletResponse response){
        responseLocal.set(response);
    }

    public static HttpServletResponse getResponse(){
        return responseLocal.get();
    }




    public static void setSession(HttpSession session){
        sessionLocal.set(session);
    }

    public static HttpSession getSession(){
        return sessionLocal.get();
    }
}
