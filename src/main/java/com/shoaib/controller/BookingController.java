package com.shoaib.controller;

import java.util.HashMap;
import java.util.Map;

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
}
