package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Enquiry;

@Service
public class EnquiryService {

	@Autowired
	CommonDao commonDao;
	@Autowired
	EmailService emailService;

	public Map<String, Object> add_enquiry(Enquiry enquiry) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			 String email = "info.dreamviewheritage@gmail.com";
             String subject = "New enquiry from contact form";
             String message =
             	    "<!DOCTYPE html>" +
             	    "<html><head>" +
             	    "<style>" +
             	    "  body { font-family: Arial, sans-serif; line-height: 1.6; }" +
             	    "  .container { max-width: 600px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; margin: auto; }" +
             	    "  h2 { color: #2c3e50; text-align: center; }" +
             	    "  table { width: 100%; border-collapse: collapse; }" +
             	    "  td { padding: 8px 0; vertical-align: top; }" +
             	    "  .label { font-weight: bold; width: 160px; }" +
             	    "  .footer { margin-top: 20px; font-size: 14px; color: #555; text-align: center; }" +
             	    "  .logo { display: block; margin: 0 auto 20px; max-height: 80px; }" +
             	    "</style>" +
             	    "</head><body>" +
             	    "<div class='container'>" +
             	    "<img src='https://dreamviewresortmadhai.com/assets/img/1723011694.png' alt='Resort Logo' class='logo'>" +
             	    "<h2>Booking Confirmation</h2>" +
             	    "<table>" +
             	    "  <tr><td class='label'>Name:</td><td>" + enquiry.getName() + "</td></tr>" +
             	    "  <tr><td class='label'>Email:</td><td>" + enquiry.getEmail() + "</td></tr>" +
             	    "  <tr><td class='label'>Contact Number:</td><td>" + enquiry.getMobile_number() + "</td></tr>" +
             	    "  <tr><td class='label'>Message:</td><td>" + enquiry.getMessage() + "</td></tr>" +
             	    "</table>" +
             	    "</div></body></html>";


             emailService.sendEmailMessage(email, subject, message);
			enquiry.setCreatedAt(new Date());
			int i = commonDao.addDataToDb(enquiry);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("message", "Internal server Error"+e);
		}
		return response;
	}

	public Map<String, Object> get_enquiry(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("name", search);
				or_map.put("email", search);
				or_map.put("mobile_number", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<Enquiry> list = (List<Enquiry>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Enquiry(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Enquiry(), "sno", "asc");
			if(list.size()>0) {
				response.put("data", list);
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);
				response.put("status", "Success");
			}else {
				response.put("data", new ArrayList());
				response.put("recordsFiltered", 0);
				response.put("recordsTotal", 0);
				response.put("status","Failed");
				return response;
			}
		} catch (Exception e) {
			response.put("data", new ArrayList());
			response.put("recordsFiltered", 0);
			response.put("recordsTotal", 0);
			response.put("message", "Internal server Error"+e);
			e.printStackTrace();
			return response;
		}
		return response;
	}
}
