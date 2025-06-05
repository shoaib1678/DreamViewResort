package com.shoaib.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.shoaib.modal.Blogs;
import com.shoaib.service.AvailabilityService;

@Controller
public class AvailabilityController {
	
	@Autowired
	AvailabilityService availabilityService;
	
	@RequestMapping(value="/check_availability", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> check_availability(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		String room_id = request.getParameter("room_id");
		response =  availabilityService.check_availability(Integer.parseInt(room_id));
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}

}
