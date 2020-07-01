package com.acts.opencv.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acts.opencv.dao.UserDao;
import com.acts.opencv.entity.User;
import com.acts.opencv.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao dao;
	@Override
	public int save(User user) {
		return  dao.save(user);
	}
	@Override
	public List<User> selectAll() {
		return 	dao.selectAll();
	}

}
