package com.bobo.cms.controller;

import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bobo.cms.domain.Article;
import com.bobo.cms.domain.Category;
import com.bobo.cms.domain.Channel;
import com.bobo.cms.domain.Collect;
import com.bobo.cms.domain.Comment;
import com.bobo.cms.domain.Slide;
import com.bobo.cms.domain.User;
import com.bobo.cms.service.ArticleService;
import com.bobo.cms.service.ChannelService;
import com.bobo.cms.service.CollectService;
import com.bobo.cms.service.CommentService;
import com.bobo.cms.service.SlideService;
import com.github.pagehelper.PageInfo;

/**
 * 
 * @ClassName: IndexController
 * @Description: cms首页控制器
 * @author: charles
 * @date: 2020年4月7日 上午10:39:01
 */
@Controller
public class IndexController {

	@Resource
	private ChannelService channelService;

	@Resource
	private ArticleService articleService;

	@Resource
	private SlideService slideService;

	@Resource
	private CollectService collectService;//收藏
	
	@Resource
	private CommentService commentService;//评论
	@Resource
	private ThreadPoolTaskExecutor threadPoolTaskExecutor;

	/**
	 * 
	 * @Title: index
	 * @Description: 进入首页
	 * @return
	 * @return: String
	 * @throws InterruptedException 
	 */
	@RequestMapping(value = { "", "/", "index" })
	public String index(Model model, Article article, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer pageSize) throws InterruptedException {
		// 封装查询条件
		article.setStatus(1);// 只查询审核通过文章
		article.setDeleted(0);// 只查询未删除的文章
		model.addAttribute("article", article);
		// 1声明线程
		Thread t1;
		Thread t2;
		Thread t3;
		Thread t4;
		Future<?> f1 = threadPoolTaskExecutor.submit(new Runnable() {
			
			@Override
			public void run() {
				// 1查询所有的栏目
				List<Channel> channels = channelService.selects();
				model.addAttribute("channels", channels);
				
			}
		});
		
		Future<?> f2 =	threadPoolTaskExecutor.submit(new Runnable() {
			
			@Override
			public void run() {
				// 2.如果栏目不为空则查询栏目下的分类
				if (article.getChannelId() != null) {
					// 2.1 根据栏目ID 查询其下分类
					List<Category> categorys = channelService.selectsByChannelId(article.getChannelId());
					model.addAttribute("categorys", categorys);
					// 2.2查询该栏目下的所有文章或者分类下的文章
					PageInfo<Article> info = articleService.selects(article, page, pageSize);
					model.addAttribute("info", info);
				}
				
			}
		});
		
		Future<?> f3 =threadPoolTaskExecutor.submit(new Runnable() {
		
		@Override
		public void run() {
			// 3 如果栏目为空则查询广告 和热点文章
			if (article.getChannelId() == null) {
				// 查询广告
				List<Slide> slides = slideService.selects();
				model.addAttribute("slides", slides);
				// 查询热点文章
				Article hotArticle = new Article();
				hotArticle.setStatus(1);
				hotArticle.setDeleted(0);
				hotArticle.setHot(1);// 1：热点文章
				PageInfo<Article> info = articleService.selects(hotArticle, page, pageSize);
				model.addAttribute("info", info);
			}
			
		}
	});
		
		Future<?> f4 =threadPoolTaskExecutor.submit(new Runnable() {
		
		@Override
		public void run() {
			// 右侧边栏显示最新的5篇文章
			Article lastArticle = new Article();
			lastArticle.setStatus(1);
			lastArticle.setDeleted(0);
			PageInfo<Article> lastArticles = articleService.selects(lastArticle, 1, 5);
			model.addAttribute("lastArticles", lastArticles);
		}
	});

 
		try {
			f1.get();
			f2.get();
			f3.get();
			f4.get();
		} catch (ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "index/index";

	}

	/**
	 * 
	 * @Title: detail
	 * @Description: 文章详情
	 * @param id
	 * @return
	 * @return: String
	 */
	@RequestMapping("detail")
	public String detail(Model model, Integer id, HttpSession session, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer pageSize) {
		Article article = articleService.select(id);
		model.addAttribute("article", article);

		// 查询该文章是否收藏过
		User user = (User) session.getAttribute("user");
		if (null != user) {// 如果用户已经登录则查询是否收藏
			int isCollect = collectService.selectCount(article.getTitle(), user.getId());
			model.addAttribute("isCollect", isCollect);
		}
		
		//查询该文章的评论
		PageInfo<Comment> info = commentService.selects(id, page, pageSize);
		model.addAttribute("info", info);

		return "index/article";
	}

	/**
	 * 
	 * @Title: collect
	 * @Description: 收藏文章
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@RequestMapping("collect")
	public boolean collect(Collect collect, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {// 如果已经登录则执行收藏
			collect.setUserId(user.getId());// 收藏人
			collect.setCreated(new Date());// 收藏时间
			return collectService.insert(collect);
		}
		return false;// 没有登录则不执行收藏

	}
	
	/**
	 * 
	 * @Title: collect
	 * @Description: 评论文章
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@RequestMapping("addComment")
	public boolean addComment(Comment comment, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {// 如果已经登录则才能评论
			comment.setUserId(user.getId());// 评论人
			comment.setCreated(new Date());// 收藏时间
			return commentService.insert(comment) >0;
		}
		return false;// 没有登录则不能评论

	}
	

}
