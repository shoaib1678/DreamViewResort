package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.BlockDate;
import com.shoaib.modal.BookingDate;
import com.shoaib.modal.Rooms;

@Service
public class BlockDateService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_blockdate(BlockDate blockdate) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object>mapdata = new HashMap<String, Object>();
			mapdata.put("sno", blockdate.getSno());
			List<BlockDate> list = (List<BlockDate>)commonDao.getDataByMapOr(mapdata, new BlockDate(), null, null, 0, -1);
			if(list.size() > 0) {
				list.get(0).setRoom_id(blockdate.getRoom_id());
				list.get(0).setBlock_date(blockdate.getBlock_date());
				list.get(0).setRemarks(blockdate.getRemarks());
				commonDao.updateDataToDb(list.get(0));
				response.put("status", "Success");
				response.put("message", "Block Date Updated Successfully");
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("room_id", blockdate.getRoom_id());
				map.put("block_date", blockdate.getBlock_date());
				List<BlockDate> data = (List<BlockDate>)commonDao.getDataByMap(map, new BlockDate(), null, null, 0, -1);
				if(data.size() > 0) {
					response.put("status", "Already_Exist");
					response.put("message", "Date Already Bloked");
				}else {
					blockdate.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(blockdate);
					if(i > 0) {
						response.put("status", "Success");
						response.put("message", "Block Date Added Successfully");
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

	public Map<String, Object> get_blockdate(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("block_date", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<BlockDate> list = (List<BlockDate>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new BlockDate(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new BlockDate(), "sno", "asc");
			if(list.size()>0) {
				for(BlockDate b : list) {
					Map<String,Object> mp = new HashMap<String, Object>();
					mp.put("sno", b.getRoom_id());
					List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(mp, new Rooms(), null, null, 0, -1);
					b.setRoom_title(room.get(0).getTitle());
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

	public Map<String, Object> edit_blockdate(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<BlockDate> list = (List<BlockDate>) commonDao.getDataByMap(map, new BlockDate(), null, null, 0, -1);	
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

	public Map<String, Object> add_bookdate(BookingDate bookingDate) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object>mapdata = new HashMap<String, Object>();
			mapdata.put("sno", bookingDate.getSno());
			List<BookingDate> list = (List<BookingDate>)commonDao.getDataByMapOr(mapdata, new BookingDate(), null, null, 0, -1);
			if(list.size() > 0) {
				list.get(0).setRoom_id(bookingDate.getRoom_id());
				list.get(0).setBooking_date(bookingDate.getBooking_date());
				commonDao.updateDataToDb(list.get(0));
				response.put("status", "Success");
				response.put("message", "Booking Date Updated Successfully");
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("room_id", bookingDate.getRoom_id());
				map.put("booking_date", bookingDate.getBooking_date());
				List<BookingDate> data = (List<BookingDate>)commonDao.getDataByMap(map, new BookingDate(), null, null, 0, -1);
				if(data.size() > 0) {
					Map<String,Object> mp = new HashMap<String, Object>();
					mp.put("sno", data.get(0).getRoom_id());
					List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(mp, new Rooms(), null, null, 0, -1);
					if(data.size() == room.get(0).getNo_of_rooms()) {
						response.put("status", "Already_Exist");
						response.put("message", "Room Not Available");
					}else {
						int i = commonDao.addDataToDb(bookingDate);
						if(i > 0) {
							response.put("status", "Success");
							response.put("message", "Booking Date Added Successfully");
						}else {
							response.put("status", "Failed");
							response.put("message", "Something went wrong");
						}
					}
				}else {
					bookingDate.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(bookingDate);
					if(i > 0) {
						response.put("status", "Success");
						response.put("message", "Booking Date Added Successfully");
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

	public Map<String, Object> get_bookdate(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("booking_date", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("type", "Manual");
			List<BookingDate> list = (List<BookingDate>) commonDao.getDataByMapSearchAnd(map,or_map, new BookingDate(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(map, or_map, new BookingDate(), "sno", "asc");
			if(list.size()>0) {
				for(BookingDate b : list) {
					Map<String,Object> mp = new HashMap<String, Object>();
					mp.put("sno", b.getRoom_id());
					List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(mp, new Rooms(), null, null, 0, -1);
					b.setRoom_title(room.get(0).getTitle());
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

	public Map<String, Object> edit_bookdate(String sno) {
		// TODO Auto-generated method stub
		return null;
	}
}
