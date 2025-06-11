package com.shoaib.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.razorpay.RazorpayException;
import com.shoaib.service.PaymentService;


@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
//	@RequestMapping("/add_Payment")
//	public ResponseEntity<Map<String,Object>> add_Payment(@RequestBody Payment payment){
//		Map<String,Object> response = new HashMap<String,Object>();
//		response = paymentService.add_Payment(payment);
//		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
//	}
	
	@RequestMapping("/get_Payment")
	public ResponseEntity<Map<String,Object>> get_Payment(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = paymentService.get_Payment(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@PostMapping("/create_order")
	public ResponseEntity<Map<String, Object>> CreateOrder(@RequestBody Map<String,Object> data) throws RazorpayException {
		Map<String, Object> response = new HashMap<String,Object>();
		 response = paymentService.create_order(data);
		 return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/get_payment_details",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> get_payment_details(HttpServletRequest request ){
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		Map<String, Object> response = paymentService.get_payment_details(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
