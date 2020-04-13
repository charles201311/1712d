package com.bobo.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bobo.cms.domain.Article;
import com.bobo.cms.domain.User;
import com.bobo.cms.service.ArticleService;
import com.bobo.cms.service.UserService;
import com.github.pagehelper.PageInfo;

/**
 * 
 * @ClassName: Adminontroller
 * @Description: 管理员中心
 * @author: charles
 * @date: 2020年4月3日 上午10:58:11
 */
@RequestMapping("admin")
@Controller
public class Adminontroller {
	
	@Resource
	private ArticleService articleService;
	
	
	@Resource
	private UserService userService;
	
	/**
	 * 
	 * @Title: index
	 * @Description: 管理员的首页
	 * @return
	 * @return: String
	 */
	@RequestMapping(value = { "", "/", "index" })
	public String index() {

		return "admin/index";

	}
	/**
	 * 
	 * @Title: articles 
	 * @Description: 文章列表
	 * @param model
	 * @param article
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@RequestMapping("articles")
	public String articles(Model model,Article article,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "6")Integer pageSize) {
		 //第一次查询文章的状态默认待审
		if(null==article.getStatus())
			article.setStatus(0);//默认待审
		PageInfo<Article> info = articleService.selects(article, page, pageSize)	;
		model.addAttribute("info",info);
		model.addAttribute("article",article);
		
		return "admin/articles";
		
	}
	/**
	 * 
	 * @Title: article 
	 * @Description: 单个文章
	 * @param id
	 * @return
	 * @return: Article
	 */
	@ResponseBody
	@RequestMapping("article")
	public Article article(Integer id) {
		return articleService.select(id);
	}

	/**
	 * 
	 * @Title: update 
	 * @Description: 修改文章
	 * @param article
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@RequestMapping("article/update")
	public boolean update(Article article) {
		return articleService.update(article) >0;
	}
	
	/**
	 * 
	 * @Title: update 
	 * @Description: 修改用户
	 * @param user
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@RequestMapping("user/update")
	public boolean update(User user) {
		return userService.update(user) >0;
	}
	
	/**
	 * 
	 * @Title: users 
	 * @Description: 用户列表
	 * @param model
	 * @param user
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@RequestMapping("users")
	public String users(Model model,User user,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "6")Integer pageSize) {
		//默认查询没有禁用的用户
		if(user.getLocked()==null) {
			user.setLocked(0);
		}
		
		PageInfo<User> info = userService.selects(user, page, pageSize);
		
		
		
		model.addAttribute("info", info);
		model.addAttribute("user", user);
		
		return "admin/users";
	}
}
