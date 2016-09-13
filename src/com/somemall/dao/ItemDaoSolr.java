package com.somemall.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Repository;

import com.somemall.entity.Item;
import com.somemall.vo.Page;
//@Repository
public class ItemDaoSolr {

	public List<Item> findItemByItemnameAndPage(String searchContext, Page page) throws SolrServerException {
		List<Item>items = new ArrayList<Item>();
		String urlString = "http://localhost:8080/solr";
		SolrServer solr = new HttpSolrServer(urlString);
		
		//以后参数都是通过这个对象去构造...
		SolrQuery solrParams=new SolrQuery();
		
		solrParams.setQuery("itemname:"+searchContext+" AND isdel:0");  

		//分页
		solrParams.setStart(page.getStartCount());
		solrParams.setRows(page.getPageSize());
		
		QueryResponse queryResponse=solr.query(solrParams);
		
		//返回所有的结果...
		SolrDocumentList documentList=queryResponse.getResults();
		System.out.println(documentList);
		if (documentList.size()==0) {
			
		}else {
			for(SolrDocument solrDocument:documentList){
				int itemid=(int) solrDocument.get("itemid");
				String itemname=(String)solrDocument.get("itemname");
				int catid=(int) solrDocument.get("catid");
				String catname=(String)solrDocument.get("catname");
				double price=(double) solrDocument.get("price");
				int num=(int) solrDocument.get("num");
				String image=(String) solrDocument.get("image");
				char status='1';
				String datajson="";
				String sellpoint=(String) solrDocument.get("sellpoint");
				String itemdescrip="";
				char isdel='0';
				String displayname=(String) solrDocument.get("displayname");
				
				Item item = new Item(itemid, itemname, catid, catname, price, num, status, datajson, sellpoint, image, itemdescrip, isdel, displayname);
				items.add(item);
				
				System.out.println("item : "+item);
			}
		}
		
		System.out.println(items);
		
		return items;
	}
	public int findItemByItemname(String searchContext) throws SolrServerException{
		String urlString = "http://localhost:8080/solr";
		SolrServer solr = new HttpSolrServer(urlString);
		
		//以后参数都是通过这个对象去构造...
		SolrQuery solrParams=new SolrQuery();
		
		solrParams.setQuery("isdel:0");
		String query = "itemname:"+searchContext;
		solrParams.setQuery(query);  

		QueryResponse queryResponse=solr.query(solrParams);
		
		//返回所有的结果...
		SolrDocumentList documentList=queryResponse.getResults();
		System.out.println("This is solr search ! ! ! ! ! ! ! ! ! " );
		
		return documentList.size();
	}

}
