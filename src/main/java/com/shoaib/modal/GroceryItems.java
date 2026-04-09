package com.shoaib.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class GroceryItems {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int sno;

    private int gid;        // Grocery / Invoice ID (Foreign key)
    private int item_id;

    @Transient
    private String item_name;

    @Transient
    private String unit;
    @Transient
    private String hsn_code;

    private float qty;
    private float price;

    // Amounts
    private float taxable_amt;

    // GST
    private float gst_per;
    private float gst_amt;

    // CGST
    private float cgst_per;
    private float cgst_amt;

    // SGST
    private float sgst_per;
    private float sgst_amt;

    // CESS
    private float cess_per;
    private float cess_amt;

    // Total tax and net
    private float tax_amt;
    private float net_amt;

    // ===== Getters & Setters =====

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

    public String getHsn_code() {
		return hsn_code;
	}

	public void setHsn_code(String hsn_code) {
		this.hsn_code = hsn_code;
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

    public float getTaxable_amt() {
        return taxable_amt;
    }

    public void setTaxable_amt(float taxable_amt) {
        this.taxable_amt = taxable_amt;
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

    public float getCgst_per() {
        return cgst_per;
    }

    public void setCgst_per(float cgst_per) {
        this.cgst_per = cgst_per;
    }

    public float getCgst_amt() {
        return cgst_amt;
    }

    public void setCgst_amt(float cgst_amt) {
        this.cgst_amt = cgst_amt;
    }

    public float getSgst_per() {
        return sgst_per;
    }

    public void setSgst_per(float sgst_per) {
        this.sgst_per = sgst_per;
    }

    public float getSgst_amt() {
        return sgst_amt;
    }

    public void setSgst_amt(float sgst_amt) {
        this.sgst_amt = sgst_amt;
    }

    public float getCess_per() {
        return cess_per;
    }

    public void setCess_per(float cess_per) {
        this.cess_per = cess_per;
    }

    public float getCess_amt() {
        return cess_amt;
    }

    public void setCess_amt(float cess_amt) {
        this.cess_amt = cess_amt;
    }

    public float getTax_amt() {
        return tax_amt;
    }

    public void setTax_amt(float tax_amt) {
        this.tax_amt = tax_amt;
    }

    public float getNet_amt() {
        return net_amt;
    }

    public void setNet_amt(float net_amt) {
        this.net_amt = net_amt;
    }
}