package com.shoaib.modal;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Rooms {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno; 
	private int category_id; 
	private String title; 
	private double price; 
	private String title_image; 
	@Transient
	private String category_name; 
	@Transient
	private String amenities_name; 
	private String summery; 
	private int bed; 
	private int bath; 
	private int no_of_rooms; 
	private int guest; 
	@Transient
	private List<SliderImage> simg;
	private String amenity_ids; 
	private String status; 
	private String description; 
	private String meta_keywords;
	private String meta_description;
	private Date createdAt;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNo_of_rooms() {
		return no_of_rooms;
	}
	public void setNo_of_rooms(int no_of_rooms) {
		this.no_of_rooms = no_of_rooms;
	}
	public String getTitle_image() {
		return title_image;
	}
	public void setTitle_image(String title_image) {
		this.title_image = title_image;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getSummery() {
		return summery;
	}
	public void setSummery(String summery) {
		this.summery = summery;
	}
	public String getAmenities_name() {
		return amenities_name;
	}
	public void setAmenities_name(String amenities_name) {
		this.amenities_name = amenities_name;
	}
	public int getBed() {
		return bed;
	}
	public void setBed(int bed) {
		this.bed = bed;
	}
	public int getBath() {
		return bath;
	}
	public void setBath(int bath) {
		this.bath = bath;
	}
	public int getGuest() {
		return guest;
	}
	public void setGuest(int guest) {
		this.guest = guest;
	}
	public List<SliderImage> getSimg() {
		return simg;
	}
	public void setSimg(List<SliderImage> simg) {
		this.simg = simg;
	}
	public String getAmenity_ids() {
		return amenity_ids;
	}
	public void setAmenity_ids(String amenity_ids) {
		this.amenity_ids = amenity_ids;
	}
	public String getMeta_keywords() {
		return meta_keywords;
	}
	public void setMeta_keywords(String meta_keywords) {
		this.meta_keywords = meta_keywords;
	}
	public String getMeta_description() {
		return meta_description;
	}
	public void setMeta_description(String meta_description) {
		this.meta_description = meta_description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
