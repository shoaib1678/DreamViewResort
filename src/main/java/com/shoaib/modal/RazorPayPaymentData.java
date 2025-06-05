package com.shoaib.modal;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class RazorPayPaymentData {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;	
	private String order_number;
	private String orderId;
	private String paymentid;
	private String transactionId;
	private String amount;
	private String name;
	private String email;
	private String phone;
	private String signature;	
	private String paymentType;	
	private String status;
	@Temporal(TemporalType.DATE)
	private Date createdAt;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getPaymentid() {
		return paymentid;
	}
	public void setPaymentid(String paymentid) {
		this.paymentid = paymentid;
	}
	
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
}
