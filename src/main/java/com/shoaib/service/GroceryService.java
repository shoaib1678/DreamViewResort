package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Items;

@Service
public class GroceryService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_item(Items items) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object>mapdata = new HashMap<String, Object>();
			mapdata.put("sno", items.getSno());
			List<Items> list = (List<Items>)commonDao.getDataByMapOr(mapdata, new Items(), null, null, 0, -1);
			if(list.size() > 0) {
				list.get(0).setItem_name(items.getItem_name());
				commonDao.updateDataToDb(list.get(0));
				response.put("status", "Success");
				response.put("message", "Item Name Updated Successfully");
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("item_name", items.getItem_name());
				List<Items> data = (List<Items>)commonDao.getDataByMap(map, new Items(), null, null, 0, -1);
				if(data.size() > 0) {
					response.put("status", "Already_Exist");
					response.put("message", "Item Name Already Exist");
				}else {
					items.setStatus("Active");
					items.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(items);
					if(i > 0) {
						response.put("status", "Success");
						response.put("message", "Item Name Added Successfully");
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

	public Map<String, Object> get_items(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("item_name", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<Items> list = (List<Items>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Items(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Items(), "sno", "asc");
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

	public Map<String, Object> edit_item(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Items> list = (List<Items>) commonDao.getDataByMap(map, new Items(), null, null, 0, -1);	
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
