package com.controller.admin;

import com.entity.Book;
import com.entity.Sysuser;
import com.service.BookService;
import com.service.SysuserServier;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ==文章==
 */
@Controller
public class BookController {
    @Resource
    private BookService bookService;
    @Resource
    private SysuserServier userService;


    /**
     * ===后台管理===
     *
     * @param request
     * @param session
     * @return
     */

    // 添加
    @RequestMapping("admin/addBook.do")
    public String addBook(HttpServletRequest request, Book book, HttpSession session) {
        Sysuser user = (Sysuser) session.getAttribute("auser");
        if (user == null) {
            return "admin/login";
        } else {
            book.setUid(user.getId());
            Sysuser user1=userService.getById(user.getId());
            if (user1.getBnum()==null){
                user1.setBnum(1);
            }else {
                user1.setBnum(user1.getBnum()+1);
            }
            userService.update(user1);
            bookService.add(book);
            return "redirect:bookList.do";
        }
    }


    /*处理修改*/
    @RequestMapping("admin/doUpdateBook.do")
    public String doUpdateBook(HttpServletRequest request, int id, ModelMap map) {
        map.put("book", bookService.getById(id));
        return "admin/book_update";
    }

    /*保存*/
    @RequestMapping("admin/updateBook.do")
    public String updateBook(HttpServletRequest request, Book book, HttpSession session) {
        bookService.update(book);
        return "redirect:bookList.do";
    }


    /*c查看*/
    @RequestMapping("admin/lookBook.do")
    public String lookBook(HttpServletRequest request, int id, ModelMap map) {
        map.put("book", bookService.getById(id));
        return "admin/bookx";
    }


    // 分页查询信息的列表
    @RequestMapping("admin/bookList.do")
    public String bookList(@RequestParam(value = "page", defaultValue = "0") Integer page, ModelMap map,
                           HttpSession session) {
        Sysuser sysuser = (Sysuser) session.getAttribute("auser");
        if (sysuser == null) {
            return "admin/login";
        } else {
            Map<String, Object> bMap = new HashMap<>();
            if (sysuser.getUtype().equals("用户")) {
                bMap.put("uid", sysuser.getId());
            }
            List<Book> list = bookService.getAll(bMap);
            map.put("list", list);
            map.put("ulist", userService.getAll(null));
            map.put("user",userService.getById(sysuser.getId()));
            return "admin/book_list";
        }
    }

    // 分页查询信息的列表--模糊查询
    @RequestMapping("admin/bookListSearch.do")
    public String bookListSearch(@RequestParam(value = "page", defaultValue = "0") Integer page, ModelMap map,
                                 HttpSession session, Book book) {
        Map<String, Object> bMap = new HashMap<>();
        Sysuser sysuser = (Sysuser) session.getAttribute("auser");
        if (sysuser == null) {
            return "admin/login";
        } else {
            if (sysuser.getUtype().equals("用户")) {
                bMap.put("uid", sysuser.getId());
            }
            map.put("user",userService.getById(sysuser.getId()));
            if (book.getId() != null && !book.getId().equals("")) {
                bMap.put("id", book.getId());
            }
            if (book.getName() != null && !book.getName().equals("")) {
                bMap.put("name", book.getName());
            }
            if (book.getUid() != null && !book.getUid().equals("")) {
                bMap.put("uid", book.getUid());
                map.put("user",userService.getById(book.getUid()));
            }
            if (book.getNote() != null && !book.getNote().equals("")) {
                bMap.put("note", book.getNote());
            }
            if (book.getPubtime() != null && !book.getPubtime().equals("")) {
                bMap.put("pubtime", book.getPubtime());
            }
            List<Book> list = bookService.getAll(bMap);
            map.put("list", list);
            map.put("ulist", userService.getAll(null));
            return "admin/book_list";
        }
    }

    /*删除*/
    @RequestMapping("admin/deleteBook.do")
    public String deleteBook(int id) {
        Book book = bookService.getById(id);
        Sysuser user1=userService.getById(book.getUid());
        if (user1.getBnum()==null||user1.getBnum()==0){
            user1.setBnum(0);
        }else {
            user1.setBnum(user1.getBnum()-1);
        }
        userService.update(user1);
        bookService.delete(id);
        return "redirect:bookList.do";
    }




    /*处理统计*/
    @RequestMapping("admin/bookList_tj.do")
    public String doBookTJ(ModelMap map) {
        Map<String,Object> uMap = new HashMap<>();
        uMap.put("utype","用户");
        map.put("list",userService.getAll(uMap));
        return "admin/user_list_tj";
    }

    // 统计分析
    @RequestMapping("admin/tj.do")
    public void selectTongji(ModelMap map, Book goods, HttpSession session, String stime, String etime,
                             HttpServletResponse response) {

        Sysuser sysuser = (Sysuser) session.getAttribute("auser");
        Map<String, Object> cmap = new HashMap<String, Object>();
        if (sysuser!=null){
        }
        cmap.put("utype", "用户");
        List<Sysuser> tjlist = userService.getAll(cmap);
        map.put("list",tjlist);
        System.out.println("aaaaaaaaaaa==" + tjlist.size());
        String stu = "[";
        String account = "[";
        for (Sysuser tj : tjlist) {
            stu += "'" + tj.getTname() + "',";
            account += "" + tj.getBnum() + ",";
        }
        int n=stu.length();
        stu=stu.substring(0, n-1);
        int n2=account.length();
        account=account.substring(0, n2-1);
        stu += "]";
        account += "]";
        System.out.println(stu);
        System.out.println(account);
        JSONObject obj = new JSONObject();
        obj.put("stu", stu);
        obj.put("account", account);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}

