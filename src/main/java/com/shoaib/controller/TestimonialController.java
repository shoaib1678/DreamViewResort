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
import com.shoaib.modal.Testimonial;
import com.shoaib.service.TestimonialService;

@Controller
public class TestimonialController {

	@Autowired
	TestimonialService testimonialService;
	
	@RequestMapping(value="/add_testimonial", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_testimonial(@RequestParam(value ="testimonialdata") String testimonialdata,
			@RequestParam(value="image",required = false) MultipartFile  image){
		Map<String, Object> response = new HashMap<String,Object>();
		Gson gson = new Gson();
		Testimonial testimonial = gson.fromJson(testimonialdata, Testimonial.class);
		response =  testimonialService.add_testimonial(testimonial,image);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_testimonial")
	public ResponseEntity<Map<String,Object>> get_testimonial(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = testimonialService.get_testimonial(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
