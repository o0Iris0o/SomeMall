package com.somemall.dao;

import java.util.List;

import com.somemall.entity.Item;
import com.somemall.entity.Order;

@SomeMallRepository
public interface ToOrderDao {
	
	public String findAddrByID(Integer addrid);
	public String findAddrByUserid(Integer userid);
	public List<Order> findOrderByUserID(Integer id);
	
	public List<Item> findOrderItemByOrderID(Integer id);
	
	
	
}