package com.somemall.dao;

@SomeMallRepository
public interface InsDao {
	public void insertIntoDB(String itemname,Integer catid,double price,Integer num,String displayname);
}