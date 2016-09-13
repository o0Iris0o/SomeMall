package com.somemall.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somemall.dao.UserDao;
import com.somemall.entity.User;
import com.somemall.util.JavaMailSendUtil;

@Controller
@RequestMapping("/home")
public class ForgetPwdMailController {
	@Resource
	private UserDao userDao;
	@RequestMapping("/sendemail.do")
	@ResponseBody
	public String sendEmail(String email) {
		System.out.println("Send to email : "+email);
		String title = "测试邮件";// 所发送邮件的标题
		String from = "java_mail_003@163.com";// 从那里发送
		String sendTo[] = {email};// 发送到那里
		// 邮件的文本内容，可以包含html标记则显示为html页面
		User user = userDao.findUserByEmail(email);
		if (user==null) {
			return "0";
		}else {
			String password = user.getPassword();
			String content = "<br>your code is : "+password +"<br>";
			// 所包含的附件，及附件的重新命名
			String fileNames[] = { "/Users/o0iris0o/Desktop/navlogo.png;logo.jpg" };
			JavaMailSendUtil sendemail = new JavaMailSendUtil();
			try {
				// MailSender mailsender = new MailSender();
				sendemail.sendmail(title, from, sendTo, content, fileNames,
						"text/html;charset=gb2312");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return "1";
		}
		
	}
}
