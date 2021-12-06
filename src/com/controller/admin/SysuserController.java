package com.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.BookService;
import com.util.Info;
import com.util.Mail_java;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Sysuser;
import com.service.SysuserServier;

import net.sf.json.JSONObject;

@Controller
public class SysuserController {
	@Resource
	private SysuserServier userService;
	@Resource
	private BookService bookService;



	
	/**
	 * 
	 * ===后台信息管理===
	 * @return
	 */

	
	
	// 验证码是否正确
	@RequestMapping("admin/checkCode.do")
	public void checkCode(String email, HttpSession session, HttpServletResponse response) {
		System.out.println("email===" + email);
		String emailCode = "";
		try {
			emailCode =Mail_java.getMail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject obj = new JSONObject();
		System.out.println("emailCode===" + emailCode);
		if (emailCode!=null&&!emailCode.equals("")) {
			session.setAttribute("emailCode",emailCode);
			obj.put("res", "ok");
		} else {
			obj.put("res", "ng");
		}
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

	@RequestMapping("admin/showUserInfo.do")
	public String showUserInfo(ModelMap map, HttpSession session) {
		if (session.getAttribute("auser") == null) {
			return "admin/login";
		}
		Sysuser u = (Sysuser) session.getAttribute("auser");
		map.put("user", userService.getById(u.getId()));
		return "admin/user_update_person";
	}

	@RequestMapping("admin/updatePersonUser.do")
	public String updateUserInfo(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Sysuser user, HttpSession session, String img,ModelMap map) {
		img=Info.fileUpload(file, request, img);
		user.setImg(img);
		userService.update(user);
		map.put("user", userService.getById(user.getId()));
		session.setAttribute("suc", "cc");
		return "redirect:showUserInfo.do";
	}



	/*处理修改密码*/
	@RequestMapping("admin/doUpdatePwd.do")
	public String doUpdatePwd(ModelMap map, HttpSession session) {
		if (session.getAttribute("auser") == null) {
			return "admin/login";
		}
		Sysuser u = (Sysuser) session.getAttribute("auser");
		map.put("user", userService.getById(u.getId()));
		return "admin/user_update_pwd";
	}

	/*更新密码*/
	@RequestMapping("admin/updateUserPwd.do")
	public String updateUserPwd( HttpServletRequest request, Sysuser user, HttpSession session) {
		userService.update(user);
		return "admin/success";
	}


	// 后台登录
	@RequestMapping("admin/alogin.do")
	public void checkLogin(Sysuser user, HttpServletResponse response,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uname", user.getUname());
		map.put("utype", user.getUtype());
		map.put("pwd", user.getPwd());
		System.out.println("uname===" + user.getUname());
		System.out.println("utype=="+user.getUtype());
		System.out.println("pwd=="+user.getPwd());
		System.out.println("uname222===" + userService.adminLogin(map));
		JSONObject obj = new JSONObject();
		Sysuser sysuser = userService.adminLogin(map);
		if (sysuser != null) {
			session.setAttribute("auser", sysuser);
			obj.put("info", "ok");
		} else {
			obj.put("info", "ng");
		}
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


	// 后台注销登录
	@RequestMapping("admin/loginOut.do")
	public String adminLoginOut(HttpSession session) {
		session.removeAttribute("auser");
		session.setAttribute("info", "");
		return "admin/login";
	}

	// 验证用户名是否存在
	@RequestMapping("admin/checkUname.do")
	public void checkUname(Sysuser user, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uname", user.getUname());
		System.out.println("uname===" + user.getUname());
		System.out.println("uname222===" + userService.checkUname(map));
		JSONObject obj = new JSONObject();
		if (userService.checkUname(map) != null) {

			obj.put("info", "ng");
		} else {
			obj.put("info", "用户名可以用！");

		}
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

	// 添加用户
	@RequestMapping("admin/addUser.do")
	public String addUser(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Sysuser user, HttpSession session, String img) {
		img = Info.fileUpload(file, request, img);
		user.setImg(img);
        user.setBnum(0);
        user.setUtype("用户");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString().substring(0, 19));
		userService.add(user);
		return "redirect:userList.do";
	}


	/*用户注册*/
	@RequestMapping("admin/addRegister.do")
	public String addRegister(@RequestParam(value = "file", required = false) MultipartFile file,
						  HttpServletRequest request, Sysuser user, HttpSession session, String img) {
		img = Info.fileUpload(file, request, img);
		user.setImg(img);
		user.setBnum(0);
		user.setUtype("用户");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString().substring(0, 19));
		userService.add(user);
		return "admin/login";
	}

	// 处理更新用户的信息
	@RequestMapping("admin/doUpdateUser.do")
	public String doUpdateUser(ModelMap map, int id) {
		System.out.println("id==" + id);
		map.put("user", userService.getById(id));
		return "admin/user_update";
	}

	// 更新用户的信息
	@RequestMapping("admin/updateUser.do")
	public String updateUser(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Sysuser user, HttpSession session, String img) {
		img = Info.fileUpload(file, request, img);
		if (img!="zanwu.jgp"){
            user.setImg(img);
        }
        user.setPwd(user.getPwd());
		userService.update(user);
		return "admin/success";
	}

	// 查询所有用户的信息
	@RequestMapping("admin/userList.do")
	public String userList(ModelMap map) {
        Map<String,Object> bMap = new HashMap<>();
        bMap.put("utype","用户");
        List<Sysuser> list = userService.getAll(bMap);
		map.put("list", list);
		return "admin/user_list";
	}

	// 模糊查询并分页
	@RequestMapping("admin/userListQuery.do")
	public String useListQuery(ModelMap map, Sysuser user) {
		Map<String, Object> pmap = new HashMap<String, Object>();
		if (user.getUname() != null && !user.getUname().equals("")) {
			pmap.put("uname", user.getUname());
		}
		if (user.getTname() != null && !user.getTname().equals("")) {
			pmap.put("tname", user.getTname());
		}
		if (user.getUtype() != null && !user.getUtype().equals("")) {
			pmap.put("utype", user.getUtype());
		}
        pmap.put("utype","用户");
		List<Sysuser> list = userService.getAll(pmap);
		map.put("list", list);
		return "admin/user_list";
	}

	@RequestMapping("admin/deleteUser.do")
	public String deleteUser(int id) {
		userService.delete(id);
		return "admin/success";
	}



}
