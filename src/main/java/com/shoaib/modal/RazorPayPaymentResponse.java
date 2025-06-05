package com.shoaib.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RazorPayPaymentResponse {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private String razorpay_payment_id;
	private String razorpay_order_id;
	private String razorpay_signature;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getRazorpay_payment_id() {
		return razorpay_payment_id;
	}
	public void setRazorpay_payment_id(String razorpay_payment_id) {
		this.razorpay_payment_id = razorpay_payment_id;
	}
	public String getRazorpay_order_id() {
		return razorpay_order_id;
	}
	public void setRazorpay_order_id(String razorpay_order_id) {
		this.razorpay_order_id = razorpay_order_id;
	}
	public String getRazorpay_signature() {
		return razorpay_signature;
	}
	public void setRazorpay_signature(String razorpay_signature) {
		this.razorpay_signature = razorpay_signature;
	}

}
