package com.shoaib.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RazorPayOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private String amount;
	private String amountPaid;
	private String createdAt;
	private String amountDue;
	private String currency;
	private String receipt;
	private String id;
	private String entity;
	private	String offerId;
	private String status;
	private String attempts;
	private String merchantKey;
	private String secretKey;
	
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(String amountPaid) {
		this.amountPaid = amountPaid;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getAmountDue() {
		return amountDue;
	}
	public void setAmountDue(String amountDue) {
		this.amountDue = amountDue;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEntity() {
		return entity;
	}
	public void setEntity(String entity) {
		this.entity = entity;
	}
	public String getOfferId() {
		return offerId;
	}
	public void setOfferId(String offerId) {
		this.offerId = offerId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAttempts() {
		return attempts;
	}
	public void setAttempts(String attempts) {
		this.attempts = attempts;
	}
	public String getMerchantKey() {
		return merchantKey;
	}
	public void setMerchantKey(String merchantKey) {
		this.merchantKey = merchantKey;
	}
	public String getSecretKey() {
		return secretKey;
	}
	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}
	
	
}
