package com.shoaib.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import net.sf.ehcache.config.PersistenceConfiguration.Strategy;

@Entity
public class SliderImage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int room_id;
	private String image;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
