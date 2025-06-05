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
import com.shoaib.modal.Gallery;
import com.shoaib.modal.Category;
import com.shoaib.utils.Utils;

@Service
public class GalleryService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_gallery(String category_id, MultipartFile image) {
		 Map<String, Object> response = new HashMap<String, Object>();
		 try {
			 String img = Utils.uploadImage(image);
			 Gallery gallery = new Gallery();
			 gallery.setCategory_id(Integer.parseInt(category_id));
			 gallery.setImage(img);
			 gallery.setStatus("Active");
			 gallery.setCreatedAt(new Date());
			 int i = commonDao.addDataToDb(gallery);
			 if(i > 0) {
					response.put("status", "Success");
					response.put("message", "Gallery Image uploaded Successfully");
				 }else {
					response.put("status", "Failed");
					response.put("message", "Something went wrong"); 
				 }
			 
		 } catch (Exception e) {
				e.printStackTrace();
		}
			 
			 return response;
	}

	public Map<String, Object> get_gallery(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> or_map = new HashMap<String,Object>();
			List<Gallery> list = (List<Gallery>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Gallery(), "sno", "desc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Gallery(), "sno", "desc");
			if(list.size()>0) {
				for(Gallery b: list) {
					Map<String, Object> mp = new HashMap<String,Object>();
					mp.put("sno", b.getCategory_id());
					List<Category> c = (List<Category>)commonDao.getDataByMap(mp, new Category(), null, null, 0, -1);
					b.setCategory_name(c.get(0).getCategory_name());
				}
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
