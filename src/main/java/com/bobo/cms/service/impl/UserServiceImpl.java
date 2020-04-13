package com.bobo.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bobo.cms.dao.UserMapper;
import com.bobo.cms.domain.User;
import com.bobo.cms.service.UserService;
import com.bobo.cms.util.CMSException;
import com.bobo.cms.util.Md5Util;
import com.bobo.common.utils.StringUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	@Override
	public PageInfo<User> selects(User user ,Integer page, Integer pageSize) {
		
		PageHelper.startPage(page, pageSize);
		List<User> list = userMapper.selects(user);
		return new PageInfo<User>(list);
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return userMapper.update(user);
	}

	@Override
	public boolean insert(User user) {
		//使用工具类处理注册业务逻辑
		//1用户名不能为空
		if(!StringUtil.hasText(user.getUsername()))
		throw new CMSException("用户名不能为空");
		//2用户名的长度
		if(!(user.getUsername().length()>=2 && user.getUsername().length()<=6) )
			throw new CMSException("用户名的长度应该在2-6之间");
		//2.2检查用户名是否已经被注册
		 if(selectByName(user.getUsername())!=null)
			 throw new CMSException("此用户已经被注册"); 
		//3.密码
		if(!StringUtil.hasText(user.getPassword()))
			throw new CMSException("密码不能为空");
		//4密码长度
		if(!(user.getPassword().length()>=6 && user.getPassword().length()<=10) )
			throw new CMSException("密码长度6-10之间");
		//5确认密码是否为空
		if(!StringUtil.hasText(user.getRepassword()))
			throw new CMSException("确认密码不能为空");
		//6两次密码是否一致
		if(!user.getRepassword().equals(user.getPassword()))
			throw new CMSException("两次密码是不一致");
		//7.对注册用户的密码进行加密
		user.setPassword(Md5Util.encode(user.getPassword()));
		return userMapper.insert(user)>0;
	}

	@Override
	public User selectByName(String name) {
		return userMapper.selectByName(name);
	}

	@Override
	public User login(User user) {
		//1用户名不能为空
		if(!StringUtil.hasText(user.getUsername()))
		throw new CMSException("用户名不能为空");	
		//2.密码
		if(!StringUtil.hasText(user.getPassword()))
			throw new CMSException("密码不能为空");
		//3.先根据用户查询是否有该用户
		User u = this.selectByName(user.getUsername());
	   if(null ==u)
			throw new CMSException("用户名不正确"); 
	   //4.比较密码. 对登录的密码进行加密再和数据库密码进行比较
		if(!u.getPassword().equals(Md5Util.encode(user.getPassword())))
			throw new CMSException("密码不正确"); 
		if(u.getLocked()==1)
			throw new CMSException("账户被禁用"); 	
		return u;
	}

}
