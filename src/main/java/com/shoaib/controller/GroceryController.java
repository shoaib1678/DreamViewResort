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

import com.shoaib.modal.GroceryDetails;
import com.shoaib.modal.Items;
import com.shoaib.service.GroceryService;

@Controller
public class GroceryController {

	@Autowired
	GroceryService groceryService;
	
	@RequestMapping("/add_item")
	public ResponseEntity<Map<String,Object>> add_item(@RequestBody Items items){
		Map<String,Object> response = new HashMap<String,Object>();
		response = groceryService.add_item(items);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_items")
	public ResponseEntity<Map<String,Object>> get_items(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = groceryService.get_items(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/edit_item")
	public ResponseEntity<Map<String,Object>> edit_item(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno =request.getParameter("sno");
		response = groceryService.edit_item(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/add_groceries")
	public ResponseEntity<Map<String,Object>> add_groceries(@RequestBody GroceryDetails groceryDetails){
		Map<String,Object> response = new HashMap<String,Object>();
		response = groceryService.add_groceries(groceryDetails);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_groceries")
	public ResponseEntity<Map<String,Object>> get_groceries(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = groceryService.get_groceries(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_grocery_items")
	public ResponseEntity<Map<String,Object>> get_grocery_items(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		String sno = request.getParameter("sno");
		response = groceryService.get_grocery_items(start,length,search,sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}

