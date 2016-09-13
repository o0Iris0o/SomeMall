package com.somemall.dao;

import java.util.List;

import com.somemall.entity.CartItem;

@SomeMallRepository
public interface ToCartDao {
	public List<CartItem> findCartItemByUserID(Integer userid);
}