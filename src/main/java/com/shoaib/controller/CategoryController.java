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
import com.shoaib.modal.Category;
import com.shoaib.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("/add_category")
	public ResponseEntity<Map<String,Object>> add_category(@RequestBody Category category){
		Map<String,Object> response = new HashMap<String,Object>();
		response = categoryService.add_category(category);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_category")
	public ResponseEntity<Map<String,Object>> get_category(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		String type = request.getParameter("type");
		response = categoryService.get_category(start,length,search,type);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/edit_category")
	public ResponseEntity<Map<String,Object>> edit_category(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno =request.getParameter("sno");
		response = categoryService.edit_category(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
