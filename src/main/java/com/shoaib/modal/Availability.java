package com.shoaib.modal;

import java.time.LocalDate;

public class Availability {

	private String title;
	private int available_rooms;
	private String available_date;
	private String room_number;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getAvailable_rooms() {
		return available_rooms;
	}
	public void setAvailable_rooms(int available_rooms) {
		this.available_rooms = available_rooms;
	}
	public String getAvailable_date() {
		return available_date;
	}
	public void setAvailable_date(String nextDate) {
		this.available_date = nextDate;
	}
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	
}
