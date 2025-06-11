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

import com.shoaib.modal.Coupon;
import com.shoaib.service.CouponService;

@Controller
public class CouponController {

	@Autowired
	CouponService couponService;
	
	@RequestMapping("/add_coupon")
	public ResponseEntity<Map<String,Object>> add_coupon(@RequestBody Coupon coupon){
		Map<String,Object> response = new HashMap<String,Object>();
		response = couponService.add_coupon(coupon);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_coupon")
	public ResponseEntity<Map<String,Object>> get_coupon(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = couponService.get_coupon(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/edit_coupon")
	public ResponseEntity<Map<String,Object>> edit_coupon(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno =request.getParameter("sno");
		response = couponService.edit_coupon(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_data")
	public ResponseEntity<Map<String,Object>> get_data(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String coupon_code =request.getParameter("coupon_code");
		response = couponService.get_data(coupon_code);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
}
