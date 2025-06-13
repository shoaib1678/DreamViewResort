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
import com.shoaib.modal.Blogs;
import com.shoaib.modal.Category;
import com.shoaib.utils.Utils;

@Service
public class BlogService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_blog(Blogs blogs, MultipartFile image) {
		 Map<String, Object> response = new HashMap<String, Object>();
		 try {
			 Utils utils = new Utils();
			 Map<String,Object> mapdata = new HashMap<String, Object>();
			 mapdata.put("sno", blogs.getSno());
			 List<Blogs> pk = (List<Blogs>)commonDao.getDataByMap(mapdata, new Blogs(), null, null, 0, -1);
			 if(pk.size() > 0) {
				 if(image != null) {
					 String title_img = utils.uploadImage(image);
					 pk.get(0).setImage(title_img);
				 }
				pk.get(0).setTitle(blogs.getTitle());
				pk.get(0).setCategory_id(blogs.getCategory_id());
				pk.get(0).setSummery(blogs.getSummery());
				pk.get(0).setDescription(blogs.getDescription());
				pk.get(0).setMeta_keywords(blogs.getMeta_keywords());
				pk.get(0).setMeta_description(blogs.getMeta_description());
				commonDao.updateDataToDb(pk.get(0));
				
				response.put("status", "Success");
				response.put("message", "Blogs Details Updated Successfully");
			 }else {
				 Map<String,Object> map = new HashMap<String, Object>();
					map.put("category_id", blogs.getCategory_id());
					map.put("title", blogs.getTitle());
					List<Blogs> par = (List<Blogs>)commonDao.getDataByMap(map, new Blogs(), null, null, 0, -1);
					if(par.size() > 0) {
						response.put("status", "Already_Exist");
						response.put("message", "Blogs Name Already Exist");
					}else {
						 if(image != null) {
							 String title_img = utils.uploadImage(image);
							 blogs.setImage(title_img);
						 }
						 blogs.setStatus("Active");
						 blogs.setCreatedAt(new Date());
						 int i = commonDao.addDataToDb(blogs);
						 if(i > 0) {
							response.put("status", "Success");
							response.put("message", "Blogs Details Added Successfully");
						 }else {
							response.put("status", "Failed");
							response.put("message", "Something went wrong"); 
						 }
					} 
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return response;
	}

	public Map<String, Object> get_blogs(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> or_map = new HashMap<String,Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("title", search);
			}
			List<Blogs> list = (List<Blogs>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Blogs(), "sno", "desc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Blogs(), "sno", "desc");
			if(list.size()>0) {
				for(Blogs b: list) {
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

	public Map<String, Object> get_blogs_for_edit(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Blogs> list = (List<Blogs>) commonDao.getDataByMap(map, new Blogs(), null, null, 0, -1);	
			if(list.size()>0) {
				response.put("data", list);
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
			}else {
				response.put("status","Failed");
				response.put("message", "Something went wrong");
				return response;
			}
		} catch (Exception e) {
			response.put("message", "Internal server Error"+e);
			e.printStackTrace();
			return response;
		}
		return response;
	}

	public Map<String, Object> delete_blogs(String sno) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Utils utils = new Utils();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Blogs> data = (List<Blogs>)commonDao.getDataByMap(map, new Blogs(), null, null, 0, -1);
			utils.deleteImage(data.get(0).getImage());
			commonDao.delete(new Blogs(), sno);
			response.put("status", "Success");
			response.put("message", "Deleted Successfully");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status","Failed");
			response.put("message", "Something Went Wrong " +e);
		}
		return response;
	}
}
