package com.somemall.dao;

import java.util.List;

import com.somemall.entity.Item;


@SomeMallRepository
public interface FindHotestDao {
	
	
	public List<Item> findHotest();
	
	public List<Item> findMostSold();
	public List<Item> findhotcollect();
	public List<Item> findhotcomment();
	public List<Item> findnewitem();
}