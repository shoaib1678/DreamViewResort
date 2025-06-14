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
import com.shoaib.modal.PackagePlan;
import com.shoaib.service.PlanService;

@Controller
public class PlanController {

	@Autowired
	PlanService planService;
	
	@RequestMapping("/add_plan")
	public ResponseEntity<Map<String,Object>> add_plan(@RequestBody PackagePlan packagePlan){
		Map<String,Object> response = new HashMap<String,Object>();
		response = planService.add_plan(packagePlan);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping("/get_plan")
	public ResponseEntity<Map<String,Object>> get_plan(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String search = request.getParameter("search[value]");
		response = planService.get_plan(start,length,search);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/get_plandata")
	public ResponseEntity<Map<String,Object>> get_plandata(HttpServletRequest request){
		Map<String,Object> response = new HashMap<String,Object>();
		String sno =request.getParameter("sno");
		response = planService.get_plandata(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
