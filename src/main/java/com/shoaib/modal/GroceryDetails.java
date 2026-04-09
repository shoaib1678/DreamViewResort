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
	private int vid;
	@Transient
	private String vendor_name;
	@Transient
	private String address;
	@Transient
	private String gstin;
	@Transient
	private String hsn_code;
	@Transient
	private String vendor_code;
	private String po_number;
	private String category_name;
	private String purchase_for;
	@Temporal(TemporalType.DATE)
	private Date po_date;
	@Transient
	private List<GroceryItems> gi;
	private float total_qty;
	private float taxable_amount;
	private float total_gst;
	private float total_tax;
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
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getPurchase_for() {
		return purchase_for;
	}
	public void setPurchase_for(String purchase_for) {
		this.purchase_for = purchase_for;
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
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getVendor_name() {
		return vendor_name;
	}
	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGstin() {
		return gstin;
	}
	public void setGstin(String gstin) {
		this.gstin = gstin;
	}
	public String getHsn_code() {
		return hsn_code;
	}
	public void setHsn_code(String hsn_code) {
		this.hsn_code = hsn_code;
	}
	public String getVendor_code() {
		return vendor_code;
	}
	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
	}
	public float getTaxable_amount() {
		return taxable_amount;
	}
	public void setTaxable_amount(float taxable_amount) {
		this.taxable_amount = taxable_amount;
	}
	public float getTotal_tax() {
		return total_tax;
	}
	public void setTotal_tax(float total_tax) {
		this.total_tax = total_tax;
	}
	public List<GroceryItems> getGi() {
		return gi;
	}
	public void setGi(List<GroceryItems> gi) {
		this.gi = gi;
	}
	public float getTotal_gst() {
		return total_gst;
	}
	public void setTotal_gst(float total_gst) {
		this.total_gst = total_gst;
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
