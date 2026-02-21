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
import com.shoaib.modal.Vendor;
import com.shoaib.service.VendorService;

@Controller
public class VendorController {

	@Autowired
	VendorService vendorService;
	
	@RequestMapping("/add_vendor")
	public ResponseEntity<Map<String,Object>> add_vendor(@RequestBody Vendor vendor){
		Map<String,Object> response = new HashMap<String,Object>();
		response = vendorService.add_vendor(vendor);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_vendor")
	public ResponseEntity<Map<String,Object>> get_vendor(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = vendorService.get_vendor(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_vendorById")
	public ResponseEntity<Map<String,Object>> get_vendorById(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno =request.getParameter("sno");
		response = vendorService.get_vendorById(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
