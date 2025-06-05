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
import com.shoaib.modal.Rooms;
import com.shoaib.modal.Category;
import com.shoaib.modal.SliderImage;
import com.shoaib.utils.Utils;

@Service
public class RoomService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_rooms(Rooms rooms, MultipartFile[] sliderImages, MultipartFile image) {
		 Map<String, Object> response = new HashMap<String, Object>();
		 try {
			 Utils utils = new Utils();
			 Map<String,Object> mapdata = new HashMap<String, Object>();
			 mapdata.put("sno", rooms.getSno());
			 List<Rooms> pk = (List<Rooms>)commonDao.getDataByMap(mapdata, new Rooms(), null, null, 0, -1);
			 if(pk.size() > 0) {
				 if(image != null) {
					 String title_img = utils.uploadImage(image);
					 pk.get(0).setTitle_image(title_img);
				 }
				pk.get(0).setTitle(rooms.getTitle());
				pk.get(0).setCategory_id(rooms.getCategory_id());
				pk.get(0).setAmenity_ids(rooms.getAmenity_ids());
				pk.get(0).setPrice(rooms.getPrice());
				pk.get(0).setBed(rooms.getBed());
				pk.get(0).setBath(rooms.getBath());
				pk.get(0).setSummery(rooms.getSummery());
				pk.get(0).setGuest(rooms.getGuest());
				pk.get(0).setDescription(rooms.getDescription());
				pk.get(0).setMeta_keywords(rooms.getMeta_keywords());
				pk.get(0).setMeta_description(rooms.getMeta_description());
				commonDao.updateDataToDb(pk.get(0));
				
				response.put("status", "Success");
				response.put("message", "Rooms Updated Successfully");
			 }else {
				 Map<String,Object> map = new HashMap<String, Object>();
					map.put("category_id", rooms.getCategory_id());
					map.put("title", rooms.getTitle());
					List<Rooms> par = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
					if(par.size() > 0) {
						response.put("status", "Already_Exist");
						response.put("message", "Room Already Exist");
					}else {
						 if(image != null) {
							 String title_img = utils.uploadImage(image);
							 rooms.setTitle_image(title_img);
						 }
						 rooms.setStatus("Active");
						 rooms.setCreatedAt(new Date());
						 int i = commonDao.addDataToDb(rooms);
						 if(i > 0) {
							 SliderImage slider = new SliderImage();
							 if(sliderImages.length >0) {
									for(int j = 0; j<sliderImages.length; j++) {
										String img = utils.uploadImage(sliderImages[j]);
										slider.setRoom_id(i);
										slider.setImage(img);
										commonDao.addDataToDb(slider);
									}
								}
							response.put("status", "Success");
							response.put("message", "Rooms Details Added Successfully");
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

	public Map<String, Object> get_rooms(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> or_map = new HashMap<String,Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("title", search);
			}
			List<Rooms> list = (List<Rooms>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Rooms(), "sno", "desc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Rooms(), "sno", "desc");
			if(list.size()>0) {
				for(Rooms b: list) {
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
