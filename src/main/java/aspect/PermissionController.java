package aspect;

import model.User;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import java.io.IOException;


@Component
@Aspect
public class PermissionController {


    /**
     * 权限控制
     * @throws ServletException
     * @throws IOException
     */
    @Before("execution(public * controller.BookController.bookFilter(..))")
    public void checkUserLevel() throws ServletException, IOException {
      /* User user = (User) SysContent.getSession().getAttribute("sessionUser");
       if(user.getIsadmin()==1){
           SysContent.getRequest().getRequestDispatcher("/WEB-INF/error/fail.jsp").
                   forward(SysContent.getRequest(),SysContent.getResponse() );
       }*/
    }
}
