package com.shoaib.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import com.shoaib.modal.Gallery;
import com.shoaib.modal.ManualBooking;
import com.shoaib.modal.PackagePlan;
import com.shoaib.modal.Rooms;

@Service
public class BlockDateService {

	@Autowired
	CommonDao commonDao;
	@Autowired
	BookingService bookingService;
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

	public Map<String, Object> add_bookdate(ManualBooking bookingDate) {
	    Map<String, Object> response = new HashMap<>();

	    try {
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	        // ✅ Convert check-in and check-out to LocalDate
	        String checkInStr = sdf.format(bookingDate.getBooking_date());
	        String checkOutStr = sdf.format(bookingDate.getCheck_date());
	        LocalDate checkInDate = LocalDate.parse(checkInStr, formatter);
	        LocalDate checkOutDate = LocalDate.parse(checkOutStr, formatter);

	        // ✅ Create date range list (from check-in to day before check-out)
	        List<LocalDate> dateRange = new ArrayList<>();
	        for (LocalDate date = checkInDate; date.isBefore(checkOutDate); date = date.plusDays(1)) {
	            dateRange.add(date);
	        }

	        boolean someSkipped = false;

	        // ✅ Handle multiple room IDs (comma-separated)
	        String[] ids = bookingDate.getRoom_ids().split(",");
	        for (String idStr : ids) {
	            if (idStr == null || idStr.trim().isEmpty()) continue;
	            int roomId = Integer.parseInt(idStr.trim());

	            // ✅ Fetch room info to check capacity
	            Map<String, Object> roomMap = new HashMap<>();
	            roomMap.put("sno", roomId);
	            List<Rooms> roomList = (List<Rooms>) commonDao.getDataByMap(roomMap, new Rooms(), null, null, 0, -1);

	            if (roomList == null || roomList.isEmpty()) continue;
	            int maxRooms = roomList.get(0).getNo_of_rooms();

	            // ✅ Loop through date range for booking
	            for (LocalDate date : dateRange) {
	                Date bookingDateJava = java.sql.Date.valueOf(date);

	                Map<String, Object> checkMap = new HashMap<>();
	                checkMap.put("room_id", roomId);
	                checkMap.put("booking_date", bookingDateJava);

	                List<BookingDate> existing = (List<BookingDate>) commonDao.getDataByMap(checkMap, new BookingDate(), null, null, 0, -1);

	                // ✅ If available, add new booking entry
	                if (existing.size() < maxRooms) {
	                    BookingDate newBooking = new BookingDate();
	                    newBooking.setRoom_id(roomId);
	                    newBooking.setRoom_number(bookingDate.getRoom_number());
	                    newBooking.setBooking_date(bookingDateJava);
	                    newBooking.setCreatedAt(new Date());
	                    commonDao.addDataToDb(newBooking);
	                } else {
	                    someSkipped = true;
	                }
	            }
	        }

	        // ✅ Insert main booking entry
	        int result = commonDao.addDataToDb(bookingDate);

	        if (result > 0) {
	            // ✅ Prepare confirmation message
	            String check_in = sdf.format(bookingDate.getBooking_date());
	            String check_out = sdf.format(bookingDate.getCheck_date());

	            String msg =
	                    "📢 *Booking Confirmation*\n\n" +
	                    "*Name:* " + bookingDate.getName() + "\n" +
	                    "*Contact Number:* " + bookingDate.getMobile_number() + "\n" +
	                    "*Room:* " + bookingDate.getRoom_title() + "\n" +
	                    "*Guest:* " + bookingDate.getAdult() + " Adults, " + bookingDate.getChild() + " Children\n" +
	                    "*Room Number:* " + bookingDate.getRoom_number() + "\n" +
	                    "*Check-in Date:* " + check_in + "\n" +
	                    "*Check-out Date:* " + check_out + "\n" +
	                    "*Booking Amount:* ₹" + bookingDate.getTotal_amount() + "\n" +
	                    "*Advance Amount:* ₹" + bookingDate.getAdvance_amount() + "\n" +
	                    "*Balance Amount:* ₹" + bookingDate.getBalance_amount() + "\n\n" +
	                    "🏨 Thank you for choosing *Dream View Heritage Resort*.\n" +
	                    "📍 We look forward to hosting you!";

	            // ✅ Send WhatsApp message
	            bookingService.sendWhatsAppMessage(bookingDate.getMobile_number(), msg);

	            if (someSkipped) {
	                response.put("status", "Partial");
	                response.put("message", "Booking saved successfully, but some dates were already full.");
	            } else {
	                response.put("status", "Success");
	                response.put("message", "Booking added successfully.");
	            }

	        } else {
	            response.put("status", "Failed");
	            response.put("message", "Something went wrong while saving booking.");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Failed");
	        response.put("message", "Internal Server Error: " + e.getMessage());
	    }

	    return response;
	}




	public Map<String, Object> get_bookdate(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			Map<String,Object> map = new HashMap<String,Object>();
			or_map.put("name", search);
			or_map.put("mobile_number", search);
			or_map.put("city", search);
			List<ManualBooking> list = (List<ManualBooking>) commonDao.getDataByMapSearchAnd(map,or_map, new ManualBooking(), "sno", "desc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(map, or_map, new ManualBooking(), "sno", "desc");
			if(list.size()>0) {
				for(ManualBooking m : list) {
//					Map<String, Object> map1 = new HashMap<String, Object>();
//					map1.put("sno", m.getRoom_id());
//					List<Rooms> rm = (List<Rooms>)commonDao.getDataByMap(map1, new Rooms(), null, null, 0, -1);
//					m.setRoom_title(rm.get(0).getTitle());
					Map<String, Object> map11 = new HashMap<String, Object>();
					map11.put("sno", m.getPlan_id());
					List<PackagePlan> rm1 = (List<PackagePlan>)commonDao.getDataByMap(map11, new PackagePlan(), null, null, 0, -1);
					m.setPlan_name(rm1.get(0).getPlan_name());
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

	public Map<String, Object> cancel_booking(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			or_map.put("sno", Integer.parseInt(sno));
			List<ManualBooking> list = (List<ManualBooking>) commonDao.getDataByMap(or_map, new ManualBooking(), null, null, 0, -1);
			if(list.size() > 0) {
				String[] ids = list.get(0).getRoom_ids().split(",");
				 	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			        String checkInStr = sdf.format(list.get(0).getBooking_date());
			        String checkOutStr = sdf.format(list.get(0).getCheck_date());
			        LocalDate checkInDate = LocalDate.parse(checkInStr, formatter);
			        LocalDate checkOutDate = LocalDate.parse(checkOutStr, formatter);
			        List<LocalDate> dateRange = new ArrayList<>();
			        for (LocalDate date = checkInDate; date.isBefore(checkOutDate); date = date.plusDays(1)) {
			            dateRange.add(date);
			        }
			        for (String idStr : ids) {
			            if (idStr == null || idStr.trim().isEmpty()) continue;
			            int roomId = Integer.parseInt(idStr.trim());
				        for (LocalDate date : dateRange) {
			                Date bookingDateJava = java.sql.Date.valueOf(date);
	
			                Map<String, Object> checkMap = new HashMap<>();
			                checkMap.put("room_id", roomId);
			                checkMap.put("booking_date", bookingDateJava);
			                checkMap.put("room_number", list.get(0).getRoom_number());
			                List<BookingDate> existing = (List<BookingDate>) commonDao.getDataByMap(checkMap, new BookingDate(), null, null, 0, -1);
			                if (existing.size() > 0) {
			                	commonDao.delete(new BookingDate(), String.valueOf(existing.get(0).getSno()));
			        			response.put("status", "Success");
			        			response.put("message", "Deleted Successfully");
			                } 
			            }
			        }
			        commonDao.delete(new ManualBooking(), sno);
			        response.put("status", "Success");
					response.put("message", "Deleted Successfully");
			}else {
				response.put("status", "Failed");
				response.put("message", "Something Went wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
}
