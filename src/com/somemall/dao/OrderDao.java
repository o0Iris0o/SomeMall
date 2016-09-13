package com.somemall.dao;

@SomeMallRepository
public interface OrderDao {
	public void createOrder(String ordershowid,Integer userid,double ordertotalprice,Integer addrid, String orderdate);
	public Integer findDefaultAddrIDByUserID(Integer userid);
	public void insertOrderItem(Integer itemid,String itemname,String displayname,double price,Integer amount,double itemtotalprice,Integer orderid,Integer userid);    
	public Integer findNewestID();
	public void updateTotalprice(double ordertotalprice,int orderid);
}