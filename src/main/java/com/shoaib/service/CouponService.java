package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Coupon;
import com.shoaib.utils.Utils;

@Service
public class CouponService {

	@Autowired
	CommonDao commonDao;
	
	public Map<String, Object> add_coupon(Coupon coupon) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object>mapdata = new HashMap<String, Object>();
			mapdata.put("sno", coupon.getSno());
			List<Coupon> list = (List<Coupon>)commonDao.getDataByMapOr(mapdata, new Coupon(), null, null, 0, -1);
			if(list.size() > 0) {
				list.get(0).setCoupon_name(coupon.getCoupon_name());
				commonDao.updateDataToDb(list.get(0));
				response.put("status", "Success");
				response.put("message", "Coupon Updated Successfully");
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("coupon_name", coupon.getCoupon_name());
				List<Coupon> data = (List<Coupon>)commonDao.getDataByMap(map, new Coupon(), null, null, 0, -1);
				if(data.size() > 0) {
					response.put("status", "Already_Exist");
					response.put("message", "Coupon Already Exist");
				}else {
					String coupon_code = Utils.generateCouponCode(10);
					coupon.setCoupon_Code(coupon_code);
					coupon.setStatus("Active");
					coupon.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(coupon);
					if(i > 0) {
						response.put("status", "Success");
						response.put("message", "Coupon Added Successfully");
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

	public Map<String, Object> get_coupon(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("coupon_name", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<Coupon> list = (List<Coupon>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Coupon(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Coupon(), "sno", "asc");
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

	public Map<String, Object> edit_coupon(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Coupon> list = (List<Coupon>) commonDao.getDataByMap(map, new Coupon(), null, null, 0, -1);	
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

	public Map<String, Object> get_data(String coupon_code) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("coupon_Code", coupon_code);
			map.put("status", "Active");
			List<Coupon> list = (List<Coupon>) commonDao.getDataByMap(map, new Coupon(), null, null, 0, -1);	
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
