package com.bobo.cms.service;

import com.bobo.cms.domain.Article;
import com.github.pagehelper.PageInfo;

public interface ArticleService {

	/**
	 * 
	 * @Title: insert 
	 * @Description: 增加文章
	 * @param article
	 * @return
	 * @return: int
	 */
	int insert(Article article);
	
	/**
	 * 
	 * @Title: selects 
	 * @Description: 根据条件查询文章
	 * @param article
	 * @return
	 * @return: List<Article>
	 */
	PageInfo<Article> selects(Article article,Integer page,Integer pageSize);
	
	/**
	 * 
	 * @Title: select 
	 * @Description: 单个文章查询
	 * @param id
	 * @return
	 * @return: Article
	 */
	Article select(Integer id);
	
	/**
	 * 
	 * @Title: update 
	 * @Description: 修改文章
	 * @param article
	 * @return
	 * @return: int
	 */
	int update(Article article); 
}
