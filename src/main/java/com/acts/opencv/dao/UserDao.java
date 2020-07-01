package com.acts.opencv.dao;
import java.util.List;

import com.acts.opencv.entity.User;
@MyBatisDao
public interface UserDao {
	int save(User user);
	List<User> selectAll();
}
