package com.somemall.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.somemall.dao.UserDao;
import com.somemall.entity.User;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserInfoController {
	@Resource
	private UserDao userDao;
	
	@RequestMapping("/modifyusername.do")
	@ResponseBody
	public User updateUserName(Integer userid,String newname,Model model){
		System.out.println("aaaa");
		System.out.println(newname);
		System.out.println(userid);
		userDao.updateUserNameByID(newname,userid);
		User user = userDao.findByUserid(userid);
		model.addAttribute("user", user);
		return user;
	}
	
	
	@RequestMapping("/emailupdate.do")
	@ResponseBody
	public User updateUserEmail(Integer userid,String email,Model model){
		
		userDao.updateEmail(userid, email);
		User user = userDao.findByUserid(userid);
		model.addAttribute("user",user);
		return user;
	}
	
	@RequestMapping("/pwdupdate.do")
	@ResponseBody
	public String updateUserPwd(Integer userid,String oldPwd,String newPwd,Model model){
		User user = userDao.findByUserid(userid);
		if (user.getPassword().equals(oldPwd)) {
			userDao.updateUserPwd(userid,newPwd);
			user = userDao.findByUserid(userid);
			model.addAttribute("user",user);
			return "1";
		}else {
			return "0";
		}
	}
}