package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Testimonial;
import com.shoaib.utils.Utils;

@Service
public class TestimonialService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_testimonial(Testimonial testimonial, MultipartFile image) {
		Map<String, Object> response = new HashMap<String, Object>();
		 try {
			 Utils utils = new Utils();
			 Map<String,Object> mapdata = new HashMap<String, Object>();
			 mapdata.put("sno", testimonial.getSno());
			 List<Testimonial> pk = (List<Testimonial>)commonDao.getDataByMap(mapdata, new Testimonial(), null, null, 0, -1);
			 if(pk.size() > 0) {
				 if(image != null) {
					 String title_img = utils.uploadImage(image);
					 pk.get(0).setImage(title_img);
				 }
				pk.get(0).setName(testimonial.getName());
				pk.get(0).setReview(testimonial.getReview());
				commonDao.updateDataToDb(pk.get(0));
				
				response.put("status", "Success");
				response.put("message", "Testimonial Details Updated Successfully");
			 }else {
				 if(image != null) {
					 String title_img = utils.uploadImage(image);
					 testimonial.setImage(title_img);
				 }
				 testimonial.setStatus("Active");
				 testimonial.setCreatedAt(new Date());
				 int i = commonDao.addDataToDb(testimonial);
				 if(i > 0) {
					response.put("status", "Success");
					response.put("message", "Testimonial Details Added Successfully");
				 }else {
					response.put("status", "Failed");
					response.put("message", "Something went wrong"); 
				 }
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return response;
	}

	public Map<String, Object> get_testimonial(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> or_map = new HashMap<String,Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("name", search);
			}
			List<Testimonial> list = (List<Testimonial>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Testimonial(), "sno", "desc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Testimonial(), "sno", "desc");
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
