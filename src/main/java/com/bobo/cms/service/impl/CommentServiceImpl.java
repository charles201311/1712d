package com.bobo.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bobo.cms.dao.CommentMapper;
import com.bobo.cms.domain.Comment;
import com.bobo.cms.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class CommentServiceImpl  implements CommentService{
	@Resource
	private CommentMapper commentMapper;

	@Override
	public int insert(Comment comment) {
		try {
			commentMapper.insert(comment);//增加评论
			commentMapper.updateAritlce(comment.getArticleId());//让评论数量增加1
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("评论失败");
		}
		
	}

	@Override
	public PageInfo<Comment> selects(Integer articleId, Integer page, Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Comment> list = commentMapper.selects(articleId);
		return new PageInfo<Comment>(list);
	}

}
