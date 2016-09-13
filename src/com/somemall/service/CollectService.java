package com.somemall.service;

import javax.servlet.http.HttpSession;

import com.somemall.entity.Collect;
import com.somemall.vo.Page;

public interface CollectService {
	public Page findCollectByPage(Integer userid,String searchContext,String currentPage,HttpSession session);
	public void delectCollect(Integer collectid);
	public Collect findCollect(Integer itemid,Integer userid);
	public String addToCollect(Integer itemid,Integer userid);
}
