package com.shoaib.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoaib.dao.CommonDao;
import com.shoaib.modal.LoginCredentials;

@Service
public class LoginService {

	@Autowired
	CommonDao commonDao;
	@Autowired
	EmailService emailService;
	
	public Map<String, Object> checklogin(String email, String password, String user_type) {

		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("email", email);
			map.put("password", password);
			map.put("user_type", user_type);
			map.put("status", "Active");
			System.out.println("map"+map);
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			System.out.println("size="+data.size());
			if (data.size() > 0) {
				response.put("status", "Success");
			} else {
				System.out.println("service failure");
				response.put("status", "Failed");
				response.put("message", "Something Went Wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> send_link(String email) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("email", email);
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			System.out.println("size="+data.size());
			if (data.size() > 0) {
				String message = "http://localhost:8081/safariBooking/reset_password?id="+data.get(0).getUser_id()+"";
				 Map<String, Object> emailResponse = emailService.sendEmailMessage(email, "Reset Password", message);
				response.put("status", "Success");
				response.put("message", "Link sent successfully");
			} else {
				response.put("status", "Failed");
				response.put("message", "Invalid Email");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> reset_password(String sno, String password) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_id", Integer.parseInt(sno));
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			System.out.println("size="+data.size());
			if (data.size() > 0) {
				data.get(0).setPassword(password);
				commonDao.updateDataToDb(data.get(0));
				Map<String,Object> map1 = new HashMap<String, Object>();
				map1.put("sno", Integer.parseInt(sno));
//				List<Customer> cus = (List<Customer>)commonDao.getDataByMap(map1, new Customer(), null, null, 0, -1);
//				cus.get(0).setPassword(password);
//				commonDao.updateDataToDb(cus.get(0));
				response.put("status", "Success");
				response.put("message", "Password Changed Successfully");
			} else {
				response.put("status", "Failed");
				response.put("message", "Something went wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> change_password(String sno, String password) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sno", Integer.parseInt(sno));
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			if (data.size() > 0) {
				Map<String, Object> search = new HashMap<String, Object>();
				search.put("sno", data.get(0).getSno());
				ObjectMapper mapObject = new ObjectMapper();
				Map<String, Object> mapObj = mapObject.convertValue(new LoginCredentials(), Map.class);
				mapObj.put("password", password);
				int id = commonDao.updateMethodForAll(mapObj, "LoginCredentials", search);
				if (id > 0) {
					response.put("status", "Success");
					response.put("message", "Password Changed Successfully");
					return response;
				}
			} else {
				System.out.println("Failure");
				response.put("status", "Failure");
				response.put("message", "Something went wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> validate_password(String sno, String password) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sno", Integer.parseInt(sno));
			map.put("password", password);
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			if (data.size() > 0) {
					response.put("status", "Success");
					response.put("message", "Password validate Successfully");
			
			} else {
				response.put("status", "Failed");
				response.put("message", "Invalid Current Password");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}
	
}
