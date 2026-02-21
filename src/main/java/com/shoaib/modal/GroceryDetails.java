package com.shoaib.modal;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
public class GroceryDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private String po_number;
	@Temporal(TemporalType.DATE)
	private Date po_date;
	@Transient
	private List<groceryItems> gi;
	private float total_qty;
	private float total_price;
	private float total_gst;
	private float sub_total;
	private float discount;
	private float grand_total;
	@Temporal(TemporalType.DATE)
	private Date createdAt;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getPo_number() {
		return po_number;
	}
	public void setPo_number(String po_number) {
		this.po_number = po_number;
	}
	public Date getPo_date() {
		return po_date;
	}
	public void setPo_date(Date po_date) {
		this.po_date = po_date;
	}
	public float getTotal_qty() {
		return total_qty;
	}
	public void setTotal_qty(float total_qty) {
		this.total_qty = total_qty;
	}
	public float getTotal_price() {
		return total_price;
	}
	public void setTotal_price(float total_price) {
		this.total_price = total_price;
	}
	public List<groceryItems> getGi() {
		return gi;
	}
	public void setGi(List<groceryItems> gi) {
		this.gi = gi;
	}
	public float getTotal_gst() {
		return total_gst;
	}
	public void setTotal_gst(float total_gst) {
		this.total_gst = total_gst;
	}
	public float getSub_total() {
		return sub_total;
	}
	public void setSub_total(float sub_total) {
		this.sub_total = sub_total;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getGrand_total() {
		return grand_total;
	}
	public void setGrand_total(float grand_total) {
		this.grand_total = grand_total;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
