package com.somemall.entity;

import java.sql.Date;

public class Order {
	private Integer orderid;
	private String ordershowid;
	private float ordertotalprice;
	private Integer addrid;
	private String ispay;
	private String state;
	private String isdel;
	private Date orderdate;
	
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public String getOrdershowid() {
		return ordershowid;
	}
	public void setOrdershowid(String ordershowid) {
		this.ordershowid = ordershowid;
	}
	public float getOrdertotalprice() {
		return ordertotalprice;
	}
	public void setOrdertotalprice(float ordertotalprice) {
		this.ordertotalprice = ordertotalprice;
	}
	public Integer getAddrid() {
		return addrid;
	}
	public void setAddrid(Integer addrid) {
		this.addrid = addrid;
	}
	public String getIspay() {
		return ispay;
	}
	public void setIspay(String ispay) {
		this.ispay = ispay;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIsdel() {
		return isdel;
	}
	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	
}