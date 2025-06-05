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
import com.shoaib.modal.Rooms;
import com.shoaib.service.RoomService;

@Controller
public class RoomController {

	@Autowired
	RoomService roomService;
	
	@RequestMapping(value="/add_rooms",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> add_rooms(@RequestParam(value="roomdata") String roomdata,@RequestParam(value="sliderImages") MultipartFile[] sliderImages,@RequestParam(value="image") MultipartFile image){
		Gson  gson = new Gson();
		Rooms rooms =gson.fromJson(roomdata, Rooms.class);
		Map<String, Object> response = roomService.add_rooms(rooms,sliderImages,image);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_rooms")
	public ResponseEntity<Map<String,Object>> get_rooms(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = roomService.get_rooms(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
}
