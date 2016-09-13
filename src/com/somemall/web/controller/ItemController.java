package com.somemall.web.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somemall.dao.ItemDao;
import com.somemall.entity.Item;
import com.somemall.entity.User;
import com.somemall.service.ItemService;
import com.somemall.vo.Page;

@Controller
@RequestMapping("/item")
public class ItemController {
	@Resource
	private ItemService itemServiceImpl;
	@RequestMapping("/toSearch.do")
	public  String toSearch(String searchContext,HttpSession session,Model model) throws Exception {
		try {
			searchContext = new String(searchContext.getBytes("iso8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println("indexSearch:"+searchContext);
		Page page =  searchItemByName(searchContext,"1", session);
//		model.addAttribute("page", page);
		return "/basic/search";
	}
	@RequestMapping("/search.do")
	@ResponseBody
	public  Page searchItemByName(String searchContext,String currentPage,HttpSession session) throws Exception {
		Page page = itemServiceImpl.searchItemByName(searchContext, currentPage, session);
		session.setAttribute("page", page);
//		session.setAttribute("items", items);
		session.setAttribute("searchContext", searchContext);
		session.setAttribute("currentPage", page.getCurrentPage());
		return page;
	}
	@RequestMapping("/toItem.do")
	public String toItem(Integer itemid, Model model) {
		System.out.println(itemid);
		Item item = itemServiceImpl.findItemByItemid(itemid);
		System.out.println(item);
		if (item==null) {
			System.out.println("no such item");
		}
		model.addAttribute("item", item);
		return "basic/item";
	}
}
