package com.bobo.cms.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bobo.cms.domain.Article;
import com.bobo.cms.domain.Collect;
import com.bobo.cms.domain.User;
import com.bobo.cms.service.ArticleService;
import com.bobo.cms.service.CollectService;
import com.bobo.cms.util.ArticleEnum;
import com.bobo.cms.vo.ArticleVO;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

/**
 * 
 * @ClassName: MyController
 * @Description: 个人中心的控制器
 * @author: charles
 * @date: 2020年4月1日 上午11:21:55
 */
@RequestMapping("my")
@Controller
public class MyController {

	@Resource
	private ArticleService articleService;
	@Resource
	private CollectService collectService;


	// 进入个人中心的首页。支持三种访问方式
	@RequestMapping(value = { "", "/", "index" })
	public String index() {
		return "my/index";

	}

	/**
	 * 
	 * @Title: publish
	 * @Description: 去发布文章页面
	 * @return
	 * @return: String
	 */
	@GetMapping("publish")
	public String publish() {

		return "my/publish";
	}

	/**
	 * 
	 * @Title: publish
	 * @Description: 执行发布
	 * @param article
	 * @return
	 * @return: boolean
	 */

	@Value(value = "${filePath}")
	private String filePath;

	@ResponseBody
	@PostMapping("publish")
	public boolean publish(MultipartFile file, Article article, HttpSession session) {
		// 判断是否上传了文件
		if (file != null && !file.isEmpty()) {
			// 文件上传
			String path = filePath;// 文件上传的路径
			// 获取原始名称 a.jpg
			String oldFileName = file.getOriginalFilename();
			// 为了防止文件重名.使用uuid产生随机数
			String fileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
			File f = new File(path, fileName);
			try {
				file.transferTo(f);// 把文件写入硬盘
				article.setPicture(fileName);// 数据库存储文件的名称
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 从session获取登录人的信息
		User user = (User) session.getAttribute("user");
		article.setUserId(user.getId()); // 文章作者
		article.setStatus(0);// 待审
		article.setCreated(new Date());// 发布时间
		article.setHits(0);// 点击量
		article.setHot(0);// 非热门
		article.setDeleted(0);// 未删除
		article.setContentType(ArticleEnum.HTML.getCode());// 普通html文本

		return articleService.insert(article) > 0;
	}


	/**
	 * 
	 * @Title: publishpic 
	 * @Description: 去发布图片集页面
	 * @return
	 * @return: String
	 */
	@RequestMapping("publishpic")
	public String publishpic() {
		return "my/publishpic";
	}
	/**
	 * 
	 * @Title: publish
	 * @Description: 增加文章/发布文章
	 * @param article
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@PostMapping("publishpic")
	public boolean publishpic(HttpServletRequest request, Article article, MultipartFile[] files,
			String[] descr) {

		String newFilename = null;
		List<ArticleVO> list = new ArrayList<ArticleVO>();// 用来存放图片的地址和描述
		int i = 0;
		for (MultipartFile file : files) {
			ArticleVO vo = new ArticleVO();
			if (!file.isEmpty()) {
				// 文件上传路径.把文件放入项目的 /resource/pic 下
				String path =filePath;
				// 为了防止文件重名.使用UUID 的方式重命名上传的文件
				String oldFilename = file.getOriginalFilename();
				// a.jpg
				newFilename = UUID.randomUUID() + oldFilename.substring(oldFilename.lastIndexOf("."));
				File f = new File(path, newFilename);
			
				vo.setUrl(newFilename);//封装的文件的名称
				vo.setDescr(descr[i]);//封装文件描述
				i++;
				list.add(vo);

				// 写入硬盘
				try {
					file.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		
		article.setPicture(newFilename);// 图片集封面
		Gson gson = new Gson();
		// 使用gson,把java对象转为json
		article.setContent(gson.toJson(list));
		// 初始化设置
		article.setStatus(1);// 
		HttpSession session = request.getSession(false);
		if (session == null) {
			return false;
		}
		User user = (User) session.getAttribute("user");
		article.setUserId(user.getId());// 发布人
		article.setHits(0);
		article.setHot(0);
		article.setDeleted(0);
		article.setCreated(new Date());
		article.setUpdated(new Date());
		// 图片集标识
		article.setContentType(ArticleEnum.IMAGE.getCode());

		return articleService.insert(article) >0;

	}
	
	
	
	
	
	// 显示我的文章
	@RequestMapping("articles")
	public String articles(Model model, Article article, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "3") Integer pageSize, HttpSession session) {

		// 从session获取登录人的信息
		User user = (User) session.getAttribute("user");
		article.setUserId(user.getId()); // 文章作者

		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("info", info);

		return "my/articles";

	}

	// 文章详情
	@ResponseBody
	@GetMapping("article")
	public Article article(Integer id) {

		return articleService.select(id);

	}
	/**
	 * 
	 * @Title: collects 
	 * @Description: 我的收藏
	 * @return
	 * @return: String
	 */
	@RequestMapping("collects")
	public String collects(Model model,Collect collect,@RequestParam(defaultValue = "1")Integer page ,@RequestParam(defaultValue = "3")Integer pageSize,HttpSession session) {
		User user = (User) session.getAttribute("user");
		collect.setUserId(user.getId());
		PageInfo<Collect> info = collectService.selects(collect, page, pageSize);
		model.addAttribute("info", info);
		return "my/collects";
	}
	/**
	 * 
	 * @Title: unCollect 
	 * @Description: 取消收藏
	 * @param id
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@RequestMapping("unCollect")
	public boolean unCollect(Integer id) {
		return collectService.deleteCollect(id) >0;
		
	}

}
