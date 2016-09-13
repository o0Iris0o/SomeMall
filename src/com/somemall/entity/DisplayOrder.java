package com.somemall.entity;


public class DisplayOrder {
	private String orderdate;
	private String ordershowid;
	private String itemlist;
	private float ordertotalprice;
	private String addr;
	private String state;
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrdershowid() {
		return ordershowid;
	}
	public void setOrdershowid(String ordershowid) {
		this.ordershowid = ordershowid;
	}
	public String getItemlist() {
		return itemlist;
	}
	public void setItemlist(String itemlist) {
		this.itemlist = itemlist;
	}
	public float getOrdertotalprice() {
		return ordertotalprice;
	}
	public void setOrdertotalprice(float ordertotalprice) {
		this.ordertotalprice = ordertotalprice;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "DisplayOrder [orderdate=" + orderdate + ", ordershowid="
				+ ordershowid + ", itemlist=" + itemlist + ", ordertotalprice="
				+ ordertotalprice + ", addr=" + addr + ", state=" + state + "]";
	}
	
	
	
	
}