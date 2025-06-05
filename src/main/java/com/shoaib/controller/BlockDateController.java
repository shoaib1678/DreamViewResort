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

import com.shoaib.modal.BlockDate;
import com.shoaib.modal.BookingDate;
import com.shoaib.service.BlockDateService;

@Controller
public class BlockDateController {

	@Autowired
	BlockDateService blockDateService;
	
	@RequestMapping("/add_blockdate")
	public ResponseEntity<Map<String,Object>> add_blockdate(@RequestBody BlockDate blockdate){
		Map<String,Object> response = new HashMap<String,Object>();
		response = blockDateService.add_blockdate(blockdate);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_blockdate")
	public ResponseEntity<Map<String,Object>> get_blockdate(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = blockDateService.get_blockdate(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/edit_blockdate")
	public ResponseEntity<Map<String,Object>> edit_blockdate(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno =request.getParameter("sno");
		response = blockDateService.edit_blockdate(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/add_bookdate")
	public ResponseEntity<Map<String,Object>> add_bookdate(@RequestBody BookingDate bookingDate){
		Map<String,Object> response = new HashMap<String,Object>();
		response = blockDateService.add_bookdate(bookingDate);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_bookdate")
	public ResponseEntity<Map<String,Object>> get_bookdate(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = blockDateService.get_bookdate(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/edit_bookdate")
	public ResponseEntity<Map<String,Object>> edit_bookdate(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno =request.getParameter("sno");
		response = blockDateService.edit_bookdate(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
