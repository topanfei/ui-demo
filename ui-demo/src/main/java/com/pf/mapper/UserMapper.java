package com.pf.mapper;

import java.util.List;

import com.pf.entity.User;

public interface UserMapper {

	/**
	 * 1.查看用户列表信息
	 * @return
	 */
	public List<User> getUserList();
}
