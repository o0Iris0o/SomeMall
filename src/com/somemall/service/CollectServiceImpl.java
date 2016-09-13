package com.somemall.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.somemall.dao.CollectDao;
import com.somemall.entity.Collect;
import com.somemall.vo.Page;
@Service
public class CollectServiceImpl implements CollectService {
	@Resource
	private CollectDao collectDao;
	public Page findCollectByPage(Integer userid,String searchContext,String currentPage,HttpSession session){
		
		System.out.println(userid+":"+currentPage+":"+searchContext);
		int pageSize=9;
		
		int currPage;
		
		if (currentPage == "" || currentPage ==null) {
			currPage = 1;
		} else {
			currPage = Integer.parseInt(currentPage);
		}
		Page page = new Page();
		page.setCurrentPage(currPage);
		System.out.println(currPage);
		
		page.setPageSize(pageSize);
		page.setStartCount();
		System.out.println(currentPage);
		
		List<Collect> collects=collectDao.findItemByItemnameAndPage(userid,searchContext, page);
		int totalCount = collectDao.findItemByItemname(userid,searchContext, page).size();
		int totalPage=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
		page.setData(collects);
		page.setTotalCount(totalCount);
		page.setTotalPage(totalPage);
		
//		System.out.println(collects);
		if (collects.size()==0) {
			collects.add(new Collect());
		}
		return page;
	}
	@Override
	public void delectCollect(Integer collectid) {
		collectDao.delCollect(collectid);
	}
	@Override
	public Collect findCollect(Integer itemid, Integer userid) {
		Collect collect = collectDao.findCollect(itemid, userid);
		return collect;
		
	}
	@Override
	public String addToCollect(Integer itemid, Integer userid) {
		System.out.println("addToCollect "+itemid+":"+userid);
		Collect collect = collectDao.findCollect(itemid, userid);
		
		if (collect!=null) {
			System.out.println(collect);
			System.out.println("alreadycollect");
			return "0";
		}else {
			collectDao.addToCollect(itemid, userid);
			System.out.println("addcollect");
			return "1";
		}
	}
	
}
