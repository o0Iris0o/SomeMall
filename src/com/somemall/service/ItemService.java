package com.somemall.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.somemall.entity.Item;
import com.somemall.vo.Page;

public interface ItemService {
	public Page searchItemByName(String searchContext,String currentPage,HttpSession session) throws Exception;
	public Item findItemByItemid(Integer itemid);
}
