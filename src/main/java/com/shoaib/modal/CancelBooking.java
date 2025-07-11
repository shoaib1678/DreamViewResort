package com.shoaib.modal;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class CancelBooking {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private String booking_id;
	private String cancellation_charge;
	private String booking_status;
	private String payment_mode;
	private String remarks;
	@Temporal(TemporalType.DATE)
	private Date cancellation_date;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}
	public String getCancellation_charge() {
		return cancellation_charge;
	}
	public void setCancellation_charge(String cancellation_charge) {
		this.cancellation_charge = cancellation_charge;
	}
	public String getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}
	public String getPayment_mode() {
		return payment_mode;
	}
	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Date getCancellation_date() {
		return cancellation_date;
	}
	public void setCancellation_date(Date cancellation_date) {
		this.cancellation_date = cancellation_date;
	}
}
