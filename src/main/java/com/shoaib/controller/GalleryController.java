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
import com.shoaib.service.GalleryService;

@Controller
public class GalleryController {

	@Autowired
	GalleryService galleryService;
	
	@RequestMapping(value="/add_gallery", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_gallery(@RequestParam(value ="category_id") String category_id,
			@RequestParam(value="image",required = false) MultipartFile  image){
		Map<String, Object> response = new HashMap<String,Object>();
		response =  galleryService.add_gallery(category_id,image);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_gallery")
	public ResponseEntity<Map<String,Object>> get_gallery(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = galleryService.get_gallery(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/add_banner", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_banner(@RequestParam(value="image",required = false) MultipartFile  image){
		Map<String, Object> response = new HashMap<String,Object>();
		response =  galleryService.add_banner(image);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_banner")
	public ResponseEntity<Map<String,Object>> get_banner(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = galleryService.get_banner(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/delete_gallery")
	public ResponseEntity<Map<String,Object>> delete_gallery(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno = request.getParameter("sno");
		response = galleryService.delete_gallery(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/delete_banner")
	public ResponseEntity<Map<String,Object>> delete_banner(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno = request.getParameter("sno");
		System.out.println("sno-=="+sno);
		response = galleryService.delete_banner(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
