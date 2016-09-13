package com.somemall.dao;

import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.CloudSolrServer;  
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Repository;

import com.somemall.entity.Item;
import com.somemall.vo.Page;

@Repository
public class ItemDaoSolrCloud {
	
	 private static CloudSolrServer cloudSolrServer;    
     
	    private  static synchronized CloudSolrServer getCloudSolrServer(final String zkHost) throws MalformedURLException {    
	        if(cloudSolrServer == null) {    
	            try {    
	                cloudSolrServer = new CloudSolrServer(zkHost);    
	            }catch(Exception e) {    
	                e.printStackTrace();                    
	            }    
	        }    
	            
	        return cloudSolrServer;    
	    }    
	        
//	    public CloudSolrServer getSolrServer() throws Exception {
//	    	  final String zkHost = "master:2181,tom:2181,harry:2181";         
//	          final String  defaultCollection = "core";    
//	          final int  zkClientTimeout = 20000;    
//	          final int zkConnectTimeout = 1000;    
//	              
//	          CloudSolrServer cloudSolrServer = getCloudSolrServer(zkHost);           
//	          System.out.println("The Cloud SolrServer Instance has benn created!");              
//	          cloudSolrServer.setDefaultCollection(defaultCollection);    
//	          cloudSolrServer.setZkClientTimeout(zkClientTimeout);    
//	          cloudSolrServer.setZkConnectTimeout(zkConnectTimeout);                     
//	          cloudSolrServer.connect();    
//	          System.out.println("The cloud Server has been connected !!!!");
//			return cloudSolrServer;              
//		}
	    
	public List<Item> findItemByItemnameAndPage(String searchContext, Page page) throws Exception {
		  final String zkHost = "master:2181,tom:2181,harry:2181";         
          final String  defaultCollection = "core";    
          final int  zkClientTimeout = 20000;    
          final int zkConnectTimeout = 10000;    
              
          CloudSolrServer cloudSolrServer = getCloudSolrServer(zkHost);           
          System.out.println("The Cloud SolrServer Instance has benn created!");              
          cloudSolrServer.setDefaultCollection(defaultCollection);    
          cloudSolrServer.setZkClientTimeout(zkClientTimeout);    
          cloudSolrServer.setZkConnectTimeout(zkConnectTimeout);                     
          cloudSolrServer.connect();    
          System.out.println("The cloud Server has been connected !!!!");
		System.out.println("solr search for :"+searchContext);
		//CloudSolrServer solr = getSolrServer();
		List<Item>items = new ArrayList<Item>();
//		String urlString = "http://localhost:8080/solr";
//		SolrServer solr = new HttpSolrServer(urlString);
		
		//以后参数都是通过这个对象去构造...
		SolrQuery solrParams=new SolrQuery();
		if (searchContext=="") {
			solrParams.setQuery("isdel:0");  
		}else {
			solrParams.setQuery("itemname:"+searchContext+" AND isdel:0");  
		}

		//分页
		solrParams.setStart(page.getStartCount());
		solrParams.setRows(page.getPageSize());
		QueryResponse queryResponse = new QueryResponse();
		SolrDocumentList documentList = new SolrDocumentList();
		try {
			queryResponse=cloudSolrServer.query(solrParams);
			documentList=queryResponse.getResults();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("There's no such item");
		}
		
		//返回所有的结果...
		
		//System.out.println(documentList);
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
				
				//System.out.println("item : "+item);
			}
		}
		
		//System.out.println(items);
		 
		//System.out.println("itemsize"+items.size());
		//cloudSolrServer.shutdown();    
		return items;
	}
	public int findItemByItemname(String searchContext) throws Exception{
		//String urlString = "http://localhost:8080/solr";
		//SolrServer solr = new HttpSolrServer(urlString);
		//CloudSolrServer solr = getSolrServer();
		  final String zkHost = "master:2181,tom:2181,harry:2181";         
          final String  defaultCollection = "core";    
          final int  zkClientTimeout = 20000;    
          final int zkConnectTimeout = 1000;    
              
          CloudSolrServer cloudSolrServer = getCloudSolrServer(zkHost);           
          System.out.println("The Cloud SolrServer Instance has benn created!");              
          cloudSolrServer.setDefaultCollection(defaultCollection);    
          cloudSolrServer.setZkClientTimeout(zkClientTimeout);    
          cloudSolrServer.setZkConnectTimeout(zkConnectTimeout);                     
          cloudSolrServer.connect();    
          System.out.println("The cloud Server has been connected !!!!");
		
		
		
		//以后参数都是通过这个对象去构造...
		SolrQuery solrParams=new SolrQuery();
		String query;
		if (searchContext=="") {
			query = "isdel:0";
		}else {
			query = "itemname:"+searchContext+" AND isdel:0";
		}
		//分页
		solrParams.setStart(0);
		//此数值要超过数据库中最大数据数值
		solrParams.setRows(99999999);
		
		solrParams.setQuery(query);  

		QueryResponse queryResponse=cloudSolrServer.query(solrParams);
		
		//返回所有的结果...
		SolrDocumentList documentList=queryResponse.getResults();
		System.out.println("This is solr search ! ! ! ! ! ! ! ! ! " );
		System.out.println("Solr get documentsize :"+documentList.size());
		//cloudSolrServer.shutdown();    
		return documentList.size();
	}

}
