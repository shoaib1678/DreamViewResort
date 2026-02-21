package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Vendor;

@Service
public class VendorService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_vendor(Vendor vendor) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			String[] vc = vendor.getVendor_name().split("");
			Map<String,Object>mapdata = new HashMap<String, Object>();
			mapdata.put("sno", vendor.getSno());
			List<Vendor> list = (List<Vendor>)commonDao.getDataByMapOr(mapdata, new Vendor(), null, null, 0, -1);
			if(list.size() > 0) {
				list.get(0).setVendor_name(vendor.getVendor_name());
				list.get(0).setMobile_number(vendor.getMobile_number());
				list.get(0).setGstin(vendor.getGstin());
				list.get(0).setState_code(vendor.getState_code());
				list.get(0).setAddress(vendor.getAddress());
				commonDao.updateDataToDb(list.get(0));
				response.put("status", "Success");
				response.put("message", "Vendor Details Updated Successfully");
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("vendor_name", vendor.getVendor_name());
				List<Vendor> data = (List<Vendor>)commonDao.getDataByMap(map, new Vendor(), null, null, 0, -1);
				if(data.size() > 0) {
					response.put("status", "Already_Exist");
					response.put("message", "Vendor Name Already Exist");
				}else {
					vendor.setStatus("Active");
					vendor.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(vendor);
					if(i > 0) {
						int c = 1000+i;
						String vcode = vc[0]+"-"+c;
						Map<String, Object> mp = new HashMap<String, Object>();
						mp.put("sno", i);
						List<Vendor> v = (List<Vendor>)commonDao.getDataByMap(mp, new Vendor(), null, null, 0, -1);
						v.get(0).setVendor_code(vcode);
						commonDao.updateDataToDb(v.get(0));
						response.put("status", "Success");
						response.put("message", "Vendor Deatails Added Successfully");
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

	public Map<String, Object> get_vendor(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("vendor_name", search);
				or_map.put("mobile_number", search);
				or_map.put("gstin", search);
				or_map.put("state_code", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<Vendor> list = (List<Vendor>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Vendor(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Vendor(), "sno", "asc");
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

	public Map<String, Object> get_vendorById(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Vendor> list = (List<Vendor>) commonDao.getDataByMap(map, new Vendor(), null, null, 0, -1);	
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
