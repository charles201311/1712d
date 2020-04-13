package com.bobo.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bobo.cms.domain.Category;
import com.bobo.cms.domain.Channel;
import com.bobo.cms.service.ChannelService;

/**
 * 
 * @ClassName: ChannelController 
 * @Description: 栏目及分类
 * @author: charles
 * @date: 2020年4月2日 上午10:54:06
 */
@RequestMapping("channel")
@Controller
public class ChannelController {
	@Resource
	private ChannelService channelService;
	
	/**
	 * 
	 * @Title: channels 
	 * @Description: 返回所有栏目的json
	 * @return
	 * @return: List<Channel>
	 */
	@ResponseBody
	@RequestMapping("channels")
	public List<Channel> channels(){
		return channelService.selects();
	}
	/**
	 * 
	 * @Title: categorys 
	 * @Description: 根据栏目查询分类
	 * @param channelId
	 * @return
	 * @return: List<Category>
	 */
	@ResponseBody
	@RequestMapping("categorys")
	public List<Category> categorys(Integer channelId){
		return channelService.selectsByChannelId(channelId);
	}

}
