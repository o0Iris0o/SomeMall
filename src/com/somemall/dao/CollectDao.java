package com.somemall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.somemall.entity.Collect;
import com.somemall.entity.Item;
import com.somemall.vo.Page;

@SomeMallRepository
public interface CollectDao {
	public List<Collect> findCollectByUserid(Integer userid);
	public List<Collect> findItemByPage(@Param(value="userid")Integer userid,@Param(value="page")Page page);
	public void delCollect(Integer collectid);
	public void addToCollect(Integer itemid,Integer userid);
	public Collect findCollect(Integer itemid,Integer userid);
	public List<Collect> findItemByItemnameAndPage(@Param(value="userid")Integer userid,@Param(value="searchContext")String searchContext,@Param(value="page")Page page);
	public List<Collect> findItemByItemname(@Param(value="userid")Integer userid,@Param(value="searchContext")String searchContext,@Param(value="page")Page page);
}
