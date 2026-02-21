package com.shoaib.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class StockEntry {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int item_id;
	@Transient
	private String item_name;
	@Transient
	private String unit;
	private float rem_qty;
	private float las_qty;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
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
	public float getRem_qty() {
		return rem_qty;
	}
	public void setRem_qty(float rem_qty) {
		this.rem_qty = rem_qty;
	}
	public float getLas_qty() {
		return las_qty;
	}
	public void setLas_qty(float las_qty) {
		this.las_qty = las_qty;
	}
}
