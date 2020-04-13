package com.bobo.cms.controller;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bobo.cms.domain.User;
import com.bobo.cms.service.UserService;
import com.bobo.cms.util.CMSException;
import com.bobo.cms.util.CMSResult;

@RequestMapping("passport")
@Controller
public class PassportController {
	@Resource
	private UserService userService;
	
	/**
	 * 
	 * @Title: reg 
	 * @Description: 去注册
	 * @return
	 * @return: String
	 */
	@GetMapping("reg")
	public String reg() {
		
		return "passport/reg";
	}
	/**
	 * 
	 * @Title: reg 
	 * @Description: 执行注册
	 * @param user
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@PostMapping("reg")
	public CMSResult<User> reg(Model model,User user) {
		CMSResult<User> result =new CMSResult<User>();
		try {
			userService.insert(user);
			result.setCode(200);//状态码
			result.setMsg("恭喜注册成功,请登录");//错误消息
		} catch (CMSException e) {//捕获自定义异常
			e.printStackTrace();
			result.setCode(300);//状态码
			result.setMsg(e.message);//错误消息
			
		}catch (Exception e) {
			e.printStackTrace();
			result.setCode(400);//状态码
			result.setMsg("未知错误，请联系管理员");//错误消息
		}
		
		
		return result;
	}
	/**
	 * 
	 * @Title: login 
	 * @Description: 注册用户去登录
	 * @return
	 * @return: String
	 */
	@GetMapping("login")
	public String login() {
		
		return "passport/login";
	}
	
	/**
	 * 
	 * @Title: login 
	 * @Description: 注册用户执行登录
	 * @param user
	 * @return
	 * @return: CMSResult<User>
	 */
	@ResponseBody
	@PostMapping("login")
	public CMSResult<User> login(User user,HttpSession session){
		CMSResult<User> result =new CMSResult<User>();
		try {
			User u = userService.login(user);
			result.setCode(200);
			result.setMsg("登录成功");
			//result.setData(u);
			//登录成功 存session
			session.setAttribute("user", u);
		} catch (CMSException e) {//捕获自定义异常
			e.printStackTrace();
			result.setCode(300);//状态码
			result.setMsg(e.message);//错误消息
			
		}catch (Exception e) {
			e.printStackTrace();
			result.setCode(400);//状态码
			result.setMsg("未知错误，请联系管理员");//错误消息
		}
		return result;
	
		
		
	}
	
	/**
	 * 
	 * @Title: logout 
	 * @Description: 注销
	 * @param session
	 * @return
	 * @return: String
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	/**
	 * 
	 * @Title: checkUsername 
	 * @Description: 注册时检查用户是否被注册
	 * @param username
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@RequestMapping("checkUsername")
	public boolean checkUsername(String username) {
		User user = userService.selectByName(username);
		return user ==null;
	}
	
	/**
	 * 
	 * @Title: loginAdmin 
	 * @Description: 跳转到管理员的登录页面
	 * @return
	 * @return: String
	 */
	@RequestMapping(value = {"admin/login","admin/","admin"})
	public String loginAdmin() {
		return  "passport/login_admin";
		
	}
	
	
	/**
	 * 
	 * @Title: login 
	 * @Description: 注册用户执行登录
	 * @param user
	 * @return
	 * @return: CMSResult<User>
	 */
	@ResponseBody
	@PostMapping("admin/login")
	public CMSResult<User> loginAdmin(User user,HttpSession session){
		CMSResult<User> result =new CMSResult<User>();
		try {
			User u = userService.login(user);
			result.setCode(200);
			result.setMsg("登录成功");
			//如果是普通用户
			if(u.getRole().equals("0")) {//role：1:管理员  0：普通用户
			throw new CMSException("没有登录权限");
			}
			session.setAttribute("admin", u);
		} catch (CMSException e) {//捕获自定义异常
			e.printStackTrace();
			result.setCode(300);//状态码
			result.setMsg(e.message);//错误消息
			
		}catch (Exception e) {
			e.printStackTrace();
			result.setCode(400);//状态码
			result.setMsg("未知错误，请联系管理员");//错误消息
		}
		return result;
	
		
		
	}
	
}

