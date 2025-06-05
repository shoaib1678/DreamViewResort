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
import com.shoaib.service.AmenitiesService;

@Controller
public class AmenitiesController {
	
	@Autowired
	AmenitiesService amenitiesService;

	@RequestMapping("/add_amenity")
	public ResponseEntity<Map<String,Object>> add_amenity(@RequestBody Amenities amenities){
		Map<String,Object> response = new HashMap<String,Object>();
		response = amenitiesService.add_amenity(amenities);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_amenities")
	public ResponseEntity<Map<String,Object>> get_amenities(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = amenitiesService.get_amenities(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/edit_amenity")
	public ResponseEntity<Map<String,Object>> edit_amenity(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno =request.getParameter("sno");
		response = amenitiesService.edit_amenity(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
