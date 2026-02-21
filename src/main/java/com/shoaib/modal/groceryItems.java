package com.shoaib.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class groceryItems {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int gid;
	private int item_id;
	@Transient
	private String item_name;
	@Transient
	private String unit;
	private float qty;
	private float price;
	private float total;
	private float gst_per;
	private float gst_amt;
	private float total_amount;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public float getQty() {
		return qty;
	}
	public void setQty(float qty) {
		this.qty = qty;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getGst_per() {
		return gst_per;
	}
	public void setGst_per(float gst_per) {
		this.gst_per = gst_per;
	}
	public float getGst_amt() {
		return gst_amt;
	}
	public void setGst_amt(float gst_amt) {
		this.gst_amt = gst_amt;
	}
	public float getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(float total_amount) {
		this.total_amount = total_amount;
	}
}
