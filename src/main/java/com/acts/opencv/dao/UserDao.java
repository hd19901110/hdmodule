package com.acts.opencv.dao;
import com.acts.opencv.entity.User;
@MyBatisDao
public interface UserDao {
	int save(User user);
}
