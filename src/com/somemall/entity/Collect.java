package com.somemall.entity;

import java.io.Serializable;

public class Collect implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer collectid;
	private Integer userid;
	private Integer itemid;
	private String itemname;
	private String image;
	private char catid;
	private String catname;
	private double price;
	private char isdel;
	private String displayname;
	
	public String getDisplayname() {
		return displayname;
	}
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}
	public char getIsdel() {
		return isdel;
	}
	public void setIsdel(char isdel) {
		this.isdel = isdel;
	}
	public Integer getCollectid() {
		return collectid;
	}
	public void setCollectid(Integer collectid) {
		this.collectid = collectid;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public char getCatid() {
		return catid;
	}
	public void setCatid(char catid) {
		this.catid = catid;
	}
	public String getCatname() {
		return catname;
	}
	public void setCatname(String catname) {
		this.catname = catname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CollectG [collectid=" + collectid + ", userid=" + userid
				+ ", itemid=" + itemid + ", itemname=" + itemname + ", image="
				+ image + ", catid=" + catid + ", catname=" + catname
				+ ", price=" + price + ", isdel=" + isdel + "]";
	}
	
}
