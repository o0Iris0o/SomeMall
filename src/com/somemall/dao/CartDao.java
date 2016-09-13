package com.somemall.dao;

import java.util.List;

import com.somemall.entity.CartItem;
import com.somemall.entity.Item;

@SomeMallRepository
public interface CartDao {
	public CartItem findCartItemByItemID(Integer userid,Integer itemid);
	public List<CartItem> findCartItemByUserID(Integer userid);
	public void addToCart(Integer itemid,Integer userid);
	public void updateCartItemAmount(Integer userid,Integer itemid);
	public Integer findCartExist(Integer userid,Integer itemid);
	public void deleCartItem(Integer userid,Integer itemid);
	public void changCartItemAmount(Integer userid, Integer itemid,int itemamount);	
}