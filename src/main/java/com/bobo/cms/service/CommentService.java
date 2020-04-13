package com.bobo.cms.service;

import java.util.List;

import com.bobo.cms.domain.Comment;
import com.github.pagehelper.PageInfo;

public interface CommentService {

	
	/**
	 * 
	 * @Title: insert 
	 * @Description: 增加评论
	 * @param comment
	 * @return
	 * @return: int
	 */
	int insert(Comment comment);
	/**
	 * 
	 * @Title: selects 
	 * @Description: 根据文章id 查询评论
	 * @param articleId
	 * @return
	 * @return: List<Comment>
	 */
	PageInfo<Comment> selects(Integer articleId,Integer page,Integer pageSize);
}
