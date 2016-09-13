package com.somemall.entity;

import java.io.Serializable;

import org.apache.solr.client.solrj.beans.Field;

public class Item implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;
	@Field
	private int itemid;
	@Field
	private String itemname;
	@Field
	private int catid;
	@Field
	private String catname;
	@Field
	private double price;
	@Field
	private int num;
	@Field
	private char status;

	
	private String datajson;
	
	@Field
	private String sellpoint;
	@Field
	private String image;
	
	
	private String itemdescrip;
	
	@Field
	private char isdel;
	@Field
	private String displayname;
	
	public Item() {
	}
	public Item(int itemid, String itemname, int catid, String catname, double price, int num, char status,
			String datajson, String sellpoint, String image, String itemdescrip, char isdel, String displayname) {
		this.itemid = itemid;
		this.itemname = itemname;
		this.catid = catid;
		this.catname = catname;
		this.price = price;
		this.num = num;
		this.status = status;
		this.datajson = datajson;
		this.sellpoint = sellpoint;
		this.image = image;
		this.itemdescrip = itemdescrip;
		this.isdel = isdel;
		this.displayname = displayname;
	}
	public String getDisplayname() {
		return displayname;
	}
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}
	public String getCatname() {
		return catname;
	}
	public void setCatname(String catname) {
		this.catname = catname;
	}
	public char getIsdel() {
		return isdel;
	}
	public void setIsdel(char isdel) {
		this.isdel = isdel;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public String getDatajson() {
		return datajson;
	}
	public void setDatajson(String datajson) {
		this.datajson = datajson;
	}
	public String getSellpoint() {
		return sellpoint;
	}
	public void setSellpoint(String sellpoint) {
		this.sellpoint = sellpoint;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getItemdescrip() {
		return itemdescrip;
	}
	public void setItemdescrip(String itemdescrip) {
		this.itemdescrip = itemdescrip;
	}
	@Override
	public String toString() {
		return "Item [itemid=" + itemid + ", itemname=" + itemname
				+ ", catid=" + catid + ", price=" + price + ", num=" + num
				+ ", status=" + status + ", datajson=" + datajson
				+ ", sellpoint=" + sellpoint + ", image=" + image
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + itemid;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		if (itemid != other.itemid)
			return false;
		return true;
	}	
}