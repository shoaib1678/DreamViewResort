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
public class BlockDate {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int room_id;
	@Transient
	private String room_title;
	private String remarks;
	@Temporal(TemporalType.DATE)
	private Date block_date;
	private Date createdAt;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Date getBlock_date() {
		return block_date;
	}
	public void setBlock_date(Date block_date) {
		this.block_date = block_date;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
}
