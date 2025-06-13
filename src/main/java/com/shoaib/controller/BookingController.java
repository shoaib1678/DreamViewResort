package com.shoaib.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoaib.modal.Booking;
import com.shoaib.service.BookingService;

@Controller
public class BookingController {

	@Autowired
	BookingService bookingService;
	
	@RequestMapping(value="/reserve_room", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> reserve_room(@RequestBody Booking booking){
		Map<String, Object> resposne = new HashMap<String,Object>();
		resposne = bookingService.reserve_room(booking);
		return new ResponseEntity<Map<String,Object>>(resposne,HttpStatus.OK);
	}
	@RequestMapping("/get_booking")
	public ResponseEntity<Map<String,Object>> get_booking(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = bookingService.get_booking(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/getBdata")
	public ResponseEntity<Map<String,Object>> getBdata(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String booking_id = request.getParameter("booking_id");
		response = bookingService.getBdata(booking_id);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
