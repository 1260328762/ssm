package controller;

import model.Book;
import model.Page;
import model.Publisher;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.IBookService;
import service.IPublisherService;
import service.ISystemLogService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private IBookService service;

    @Autowired
    private IPublisherService service2;

    @Autowired
    private ISystemLogService logService;


    /**
     * 跳转到添加图书页面
     * @param model
     * @return
     */
    @RequestMapping("/tobookadd.do")
    public String toBookAdd(Model model,Book book,Page page){
        try {
            model.addAttribute("bname",book.getBname());
            model.addAttribute("author",book.getAuthor());
            model.addAttribute("category",book.getCategory());
            model.addAttribute("status",book.getStatus());
            model.addAttribute("page",page);
            List<Publisher> list = service2.findAll();
            model.addAttribute("publisherlist",list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "book/bookadd";
    }




    /**
     * 验证图书名是否重复
     * @param book
     * @return
     */
    @RequestMapping("/checkbookname.do")
    @ResponseBody
    public boolean checkBookName(Book book){
        try {
            book = service.findByName(book);
            if(book==null){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    /**
     * 添加图书
     * @param book
     * @return
     */
    @RequestMapping("/bookadd.do")
    public String bookAdd(Book book, HttpSession session){
        try {
            service.addBook(book);
            User user = (User) session.getAttribute("sessionUser");
            logService.addLog(user.getUsername()+":添加一条图书记录");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/book/bookfilter.do";
    }


    /**
     * 删除图书
     * @param book
     * @return
     */
    @RequestMapping("/bookdel.do")
    public String bookDel(Book book,Model model,Page page,int[] bids,HttpSession session){
        try {
            User user = (User) session.getAttribute("sessionUser");
            model.addAttribute("bname",book.getBname());
            model.addAttribute("author",book.getAuthor());
            model.addAttribute("category",book.getCategory());
            model.addAttribute("status",book.getStatus());
            model.addAttribute("page",page);
            if(null!=bids){
                //批量删除
                service.batchRemove(bids);

                logService.addLog(user.getUsername()+":进行了批量删除");
            }else{
                service.removeBook(book);
                logService.addLog(user.getUsername()+":删除了一条图书记录");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/book/bookfilter.do";
    }



    /**
     * 修改图书
     * @param book
     * @return
     */
    @RequestMapping("/modifybook.do")
    public String modifyBook(Book book, Model model, HttpServletRequest request,Page page){
        try {
            model.addAttribute("bname",request.getParameter("bname1"));
            model.addAttribute("author",request.getParameter("author1"));
            model.addAttribute("category",request.getParameter("category1"));
            model.addAttribute("status",request.getParameter("status1"));
            page.setPageIndex(Integer.parseInt(request.getParameter("pageIndex1")));
            model.addAttribute("page",page);
            User user = (User) request.getSession().getAttribute("sessionUser");
            service.modifyBook(book);
            logService.addLog(user.getUsername()+":修改了一条图书记录");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/book/bookmn.do?bid="+book.getBid()+"&pageIndex="+page.getPageIndex()+"&flg=mi";
    }


    /**
     * 验证修改图书信息时,书名是否重复
     * @return
     */
    @RequestMapping("/checkname.do")
    @ResponseBody()
    public boolean  checkName(Book book){
        try {
            Book findbook = service.finfById(book);
            if(findbook.getBname().equals(book.getBname())){
                return true;
            }else{
                findbook = service.findByName(book);
                if(findbook==null){
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    /**
     * 跳转到图书修改页面
     * @return
     */
    @RequestMapping("/bookmn.do")
    public String toBookmn(Book book,Model model,Page page,String flg){
        try {
            if(!"mi".equals(flg)){
                model.addAttribute("bname",book.getBname());
                model.addAttribute("author",book.getAuthor());
                model.addAttribute("category",book.getCategory());
                model.addAttribute("status",book.getStatus());
                model.addAttribute("page",page);
            }
            book = service.finfById(book);
            List<Publisher> list = service2.findAll();
            model.addAttribute("bookinfo",book);
            model.addAttribute("publisherlist",list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "book/bookmn";
    }



    /**
     * 过滤书籍
     * @return
     */
    @RequestMapping("/bookfilter.do")
    public String bookFilter(Book book, Model model, Page page){
        try {
            book.setPage(page);
            page.setPage(page.getPageIndex(),service.findCountByCon(book));
            List<Book> list = service.findByCon(book);
            model.addAttribute("bname",book.getBname());
            model.addAttribute("author",book.getAuthor());
            model.addAttribute("category",book.getCategory());
            model.addAttribute("status",book.getStatus());
            model.addAttribute("booklist",list);
            model.addAttribute("page",page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "book/booklist";
    }
}
