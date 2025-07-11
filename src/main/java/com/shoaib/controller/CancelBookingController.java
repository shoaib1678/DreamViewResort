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

import com.shoaib.modal.Amenities;
import com.shoaib.modal.CancelBooking;
import com.shoaib.service.CancelBookingService;

@Controller
public class CancelBookingController {

	@Autowired
	CancelBookingService cancelBookingService;
	
	@RequestMapping("/add_cancel")
	public ResponseEntity<Map<String,Object>> add_cancel(@RequestBody CancelBooking cancelBooking){
		Map<String,Object> response = new HashMap<String,Object>();
		response = cancelBookingService.add_cancel(cancelBooking);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_cancel")
	public ResponseEntity<Map<String,Object>> get_cancel(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = cancelBookingService.get_cancel(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_data_forcancel")
	public ResponseEntity<Map<String,Object>> get_data_forcancel(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String booking_id = request.getParameter("booking_id");
		response = cancelBookingService.get_data_forcancel(booking_id);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
