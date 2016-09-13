package com.somemall.entity;

public class UserOperateLog {
	private Integer userid;
	private Integer itemid;
	
	public String getUserid() {
		return String.valueOf(userid);
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getItemid() {
		return String.valueOf(itemid);
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
}