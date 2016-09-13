package com.somemall.dao;

import com.somemall.entity.User;
@SomeMallRepository
public interface UserDao {
	public User findByUserid(Integer integer);
	public User findUserByEmail(String email);
	public User findByUsernameAndPassword(String username,String password);
	public void addUser(String username,String password,String email);
	public User findUserByUsername(String username);
	public void updateUserNameByID(String name,Integer id);
	public void updateEmail(Integer id,String email);
	public void updateUserPwd(Integer userid, String newPwd);
	public void addUserInitAddr(Integer userid,String username,String phone);
}