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
import com.shoaib.service.BlogService;

@Controller
public class BlogsController {

	@Autowired
	BlogService blogService;
	
	@RequestMapping(value="/add_blog", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_blog(@RequestParam(value ="blogdata") String blogdata,
			@RequestParam(value="image",required = false) MultipartFile  image){
		Map<String, Object> response = new HashMap<String,Object>();
		Gson gson = new Gson();
		Blogs blogs = gson.fromJson(blogdata, Blogs.class);
		response =  blogService.add_blog(blogs,image);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_blogs")
	public ResponseEntity<Map<String,Object>> get_blogs(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = blogService.get_blogs(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_blogs_for_edit")
	public ResponseEntity<Map<String,Object>> get_blogs_for_edit(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno = request.getParameter("sno");
		response = blogService.get_blogs_for_edit(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/delete_blogs")
	public ResponseEntity<Map<String,Object>> delete_blogs(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno = request.getParameter("sno");
		response = blogService.delete_blogs(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
