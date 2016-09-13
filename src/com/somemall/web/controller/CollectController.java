package com.somemall.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somemall.entity.User;
import com.somemall.service.CollectService;
import com.somemall.vo.Page;

@Controller
@RequestMapping("/user")
public class CollectController {
	
	@Resource
	private CollectService collectServiceImpl;
	
	@RequestMapping("/toCollect.do")
	public String toCollect(Integer userid,String searchContext,String currentPage,HttpSession session){
		
		System.out.println(userid+":"+currentPage+":"+searchContext);
		if (searchContext==null) {
			searchContext="";
		}
		if (currentPage==null) {
			User user = (User) session.getAttribute("user");
			
			if (session.getAttribute("currentPage")!=null) {
				
				findCollectByPage(user.getUserid(),searchContext,session.getAttribute("currentPage").toString(), session);
			}
			findCollectByPage(user.getUserid(),searchContext,"1", session);
			
		}else {
			findCollectByPage(userid,searchContext,currentPage, session);
		}
		return "user/collect";
	}

	@RequestMapping("/findCollect.do")
	@ResponseBody
	public Page findCollectByPage(Integer userid,String searchContext,String currentPage,HttpSession session) {
		
		Page page = collectServiceImpl.findCollectByPage(userid, searchContext, currentPage, session);
		System.out.println(page);
		session.setAttribute("page", page);
		session.setAttribute("currentPage", currentPage);
		return page;
	}
	

	@RequestMapping("/delectCollect.do")
	@ResponseBody
	public void delectCollect(Integer collectid) {
		System.out.println("delectCollect "+collectid);
		collectServiceImpl.delectCollect(collectid);
	}
	@RequestMapping("/addToCollect.do")
	@ResponseBody
	public String addToCollect(Integer itemid,Integer userid) {
		System.out.println("addToCollect "+itemid+":"+userid);
		return collectServiceImpl.addToCollect(itemid, userid);
	}
}
