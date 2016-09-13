package com.somemall.service;

import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.solr.client.solrj.SolrServerException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.somemall.dao.ItemDao;
import com.somemall.dao.ItemDaoSolr;
import com.somemall.dao.ItemDaoSolrCloud;
import com.somemall.entity.Item;
import com.somemall.vo.Page;
@Service
public class ItemServiceImplMySQL implements ItemService {
	@Resource
	private ItemDao itemDao;
	@Resource
	private ItemDaoSolrCloud itemDaoSolrCloud;
	//private ItemDaoSolr itemDaoSolr;
	@Override
	public Page searchItemByName(String searchContext, String currentPage,
			HttpSession session) throws Exception {
		
//		如果使用Get方法传入参数乱码，则可以只用此语句转码List<ItemG>
//		try {
//			searchContext = new String(searchContext.getBytes("iso8859-1"),"utf-8");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		if (searchContext == "" ||searchContext == null ) {
			String serContext = (String) session.getAttribute("searchContext");
			searchContext = serContext==null?"":serContext;
		} 

		int currPage;
		if (currentPage == "" ||currentPage == null ) {
			currPage =session.getAttribute("currentPage")==null||"".equals(session.getAttribute("currentPage")) 
					?1:Integer.parseInt(session.getAttribute("currentPage").toString());
		} else {
			currPage = Integer.parseInt(currentPage);
		}
		Page page = new Page();
		page.setCurrentPage(currPage);
		int pageSize=9;
		page.setPageSize(pageSize);
		page.setStartCount();
		
		List<Item> items = new ArrayList<Item>();
		int totalCount=0;
		try {
//			items = itemDao.findItemByItemnameAndPage(searchContext, page);
			items = itemDaoSolrCloud.findItemByItemnameAndPage(searchContext, page);
//			totalCount = itemDao.findItemByItemname(searchContext).size();
			totalCount = itemDaoSolrCloud.findItemByItemname(searchContext);
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int totalPage=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
		
		if (items.size()==0) {
			System.out.println("nullitems");
			System.out.println("items:"+items);
		}
		page.setData(items);
		page.setTotalCount(totalCount);
		page.setTotalPage(totalPage);
		
				
		
		if (items.size()==0) {
			items.add(new Item());
		}
		System.out.println(items);
		System.out.println(page);
		System.out.println(currPage+":"+searchContext);
		return page;
	}

	@Override
	public Item findItemByItemid(Integer itemid) {
		Item item = itemDao.findItemByItemid(itemid);
		return item;
	}

}
