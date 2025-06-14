package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.PackagePlan;
import com.shoaib.modal.Rooms;

@Service
public class PlanService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_plan(PackagePlan packagePlan) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object>mapdata = new HashMap<String, Object>();
			mapdata.put("sno", packagePlan.getSno());
			List<PackagePlan> list = (List<PackagePlan>)commonDao.getDataByMapOr(mapdata, new PackagePlan(), null, null, 0, -1);
			if(list.size() > 0) {
				list.get(0).setRoom_id(packagePlan.getRoom_id());
				list.get(0).setPlan_name(packagePlan.getPlan_name());
				list.get(0).setBase_price(packagePlan.getBase_price());
				list.get(0).setFinal_price(packagePlan.getFinal_price());
				list.get(0).setGst(packagePlan.getGst());
				list.get(0).setRoom_id(packagePlan.getRoom_id());
				commonDao.updateDataToDb(list.get(0));
				response.put("status", "Success");
				response.put("message", "Package Plan Updated Successfully");
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("room_id", packagePlan.getRoom_id());
				map.put("plan_name", packagePlan.getPlan_name());
				List<PackagePlan> data = (List<PackagePlan>)commonDao.getDataByMap(map, new PackagePlan(), null, null, 0, -1);
				if(data.size() > 0) {
					response.put("status", "Already_Exist");
					response.put("message", "Package Plan Already Exist");
				}else {
					packagePlan.setStatus("Active");
					packagePlan.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(packagePlan);
					if(i > 0) {
						response.put("status", "Success");
						response.put("message", "Package Plan Added Successfully");
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

	public Map<String, Object> get_plan(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("plan_name", search);
			}
			
			List<PackagePlan> list = (List<PackagePlan>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new PackagePlan(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new PackagePlan(), "sno", "asc");
			if(list.size()>0) {
				for(PackagePlan p : list) {
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("sno", p.getSno());
					List<Rooms> r = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
					p.setTitle(r.get(0).getTitle());
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

	public Map<String, Object> get_plandata(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<PackagePlan> list = (List<PackagePlan>) commonDao.getDataByMap(map, new PackagePlan(), null, null, 0, -1);	
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
