package com.shoaib.modal;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
public class ManualBooking {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private String room_ids;
	private int plan_id;
	private String room_title;
	@Transient
	private String plan_name;
	private String room_number;
	private String name;
	private String city;
	private String mobile_number;
	private int noroom;
	private int extrabed;
	private int night;
	private int adult;
	private int child;
	private float room_charge;
	private float bed_charge;
	private float room_gst;
	private float bed_gst;
	private float total_room_charge;
	private float total_bed_charge;
	private float total_amount;
	private float base_price;
	private float final_price;
	private float total_price;
	private float net_amount;
	private float taxable_amount;
	private float advance_amount;
	private float balance_amount;
	@Temporal(TemporalType.DATE)
	private Date booking_date;
	@Temporal(TemporalType.DATE)
	private Date check_date;
	@Temporal(TemporalType.DATE)
	private Date final_payment_date;
	private Date createdAt;
	@Transient
	private String type;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getRoom_ids() {
		return room_ids;
	}
	public void setRoom_ids(String room_ids) {
		this.room_ids = room_ids;
	}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}
	public int getNoroom() {
		return noroom;
	}
	public void setNoroom(int noroom) {
		this.noroom = noroom;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getExtrabed() {
		return extrabed;
	}
	public void setExtrabed(int extrabed) {
		this.extrabed = extrabed;
	}
	public int getNight() {
		return night;
	}
	public void setNight(int night) {
		this.night = night;
	}
	public float getAdvance_amount() {
		return advance_amount;
	}
	public void setAdvance_amount(float advance_amount) {
		this.advance_amount = advance_amount;
	}
	public float getBalance_amount() {
		return balance_amount;
	}
	public void setBalance_amount(float balance_amount) {
		this.balance_amount = balance_amount;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public float getRoom_charge() {
		return room_charge;
	}
	public float getTaxable_amount() {
		return taxable_amount;
	}
	public void setTaxable_amount(float taxable_amount) {
		this.taxable_amount = taxable_amount;
	}
	public void setRoom_charge(float room_charge) {
		this.room_charge = room_charge;
	}
	public float getBed_charge() {
		return bed_charge;
	}
	public void setBed_charge(float bed_charge) {
		this.bed_charge = bed_charge;
	}
	public float getRoom_gst() {
		return room_gst;
	}
	public void setRoom_gst(float room_gst) {
		this.room_gst = room_gst;
	}
	public float getBed_gst() {
		return bed_gst;
	}
	public void setBed_gst(float bed_gst) {
		this.bed_gst = bed_gst;
	}
	public float getTotal_room_charge() {
		return total_room_charge;
	}
	public void setTotal_room_charge(float total_room_charge) {
		this.total_room_charge = total_room_charge;
	}
	public float getTotal_bed_charge() {
		return total_bed_charge;
	}
	public void setTotal_bed_charge(float total_bed_charge) {
		this.total_bed_charge = total_bed_charge;
	}
	public float getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(float total_amount) {
		this.total_amount = total_amount;
	}
	public float getBase_price() {
		return base_price;
	}
	public void setBase_price(float base_price) {
		this.base_price = base_price;
	}
	public float getFinal_price() {
		return final_price;
	}
	public void setFinal_price(float final_price) {
		this.final_price = final_price;
	}
	public float getTotal_price() {
		return total_price;
	}
	public void setTotal_price(float total_price) {
		this.total_price = total_price;
	}
	public float getNet_amount() {
		return net_amount;
	}
	public void setNet_amount(float net_amount) {
		this.net_amount = net_amount;
	}
	public Date getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	public Date getCheck_date() {
		return check_date;
	}
	public void setCheck_date(Date check_date) {
		this.check_date = check_date;
	}
	public Date getFinal_payment_date() {
		return final_payment_date;
	}
	public void setFinal_payment_date(Date final_payment_date) {
		this.final_payment_date = final_payment_date;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
