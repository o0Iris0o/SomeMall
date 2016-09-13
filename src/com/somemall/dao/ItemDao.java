package com.somemall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.somemall.entity.Item;
import com.somemall.vo.Page;

@SomeMallRepository
public interface ItemDao {
	public List<Item> findItemByItemname(String searchContext);
	public Item findItemByItemid(Integer itemid);
	public List<Item> findItemByItemnameAndPage(@Param(value="searchContext")String searchContext,@Param(value="page")Page page); 
}
