package com.bobo.cms.service.impl;

import javax.annotation.Resource;

import org.junit.Test;

import com.bobo.cms.domain.Article;
import com.bobo.cms.service.ArticleService;
import com.github.pagehelper.PageInfo;


public class ArticleServiceImplTest extends SpringJunit {

	@Resource
	private ArticleService articleService;
	@Test
	public void testInsert() {
	}

	@Test
	public void testSelects() {
		
		PageInfo<Article> info = articleService.selects(null, 1, 10);
		System.out.println(info);
	}

}
