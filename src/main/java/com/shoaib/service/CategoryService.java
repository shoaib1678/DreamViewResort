package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Category;

@Service
public class CategoryService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_category(Category category) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object>mapdata = new HashMap<String, Object>();
			mapdata.put("sno", category.getSno());
			List<Category> list = (List<Category>)commonDao.getDataByMapOr(mapdata, new Category(), null, null, 0, -1);
			if(list.size() > 0) {
				list.get(0).setCategory_name(category.getCategory_name());
				commonDao.updateDataToDb(list.get(0));
				response.put("status", "Success");
				response.put("message", "Category Name Updated Successfully");
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("category_name", category.getCategory_name());
				map.put("type", category.getType());
				List<Category> data = (List<Category>)commonDao.getDataByMap(map, new Category(), null, null, 0, -1);
				if(data.size() > 0) {
					response.put("status", "Already_Exist");
					response.put("message", "Category Name Already Exist");
				}else {
					category.setStatus("Active");
					category.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(category);
					if(i > 0) {
						response.put("status", "Success");
						response.put("message", "Category Name Added Successfully");
					}else {
						response.put("status", "Failed");
						response.put("message", "Something went wrong");
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.put("message", "Internal server Error"+e);
		}
		return response;
	}

	public Map<String, Object> get_category(int start, int length, String search, String type) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("type", type);
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("category_name", search);
			}
			List<Category> list = (List<Category>) commonDao.getDataByMapSearchAnd(map,or_map, new Category(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(map, or_map, new Category(), "sno", "asc");
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

	public Map<String, Object> edit_category(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Category> list = (List<Category>) commonDao.getDataByMap(map, new Category(), null, null, 0, -1);	
			if(list.size()>0) {
				response.put("data", list);
				response.put("status", "Success");
			}else {
				response.put("status","Failed");
				return response;
			}
		} catch (Exception e) {
			response.put("message", "Internal server Error"+e);
			e.printStackTrace();
			return response;
		}
		return response;
	}
}
