package com.acts.opencv.service;

import java.util.List;

import com.acts.opencv.entity.User;

public interface UserService {
  int save(User user);
  List<User> selectAll();
	
}
