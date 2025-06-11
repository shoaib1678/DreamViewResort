package com.shoaib.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Availability;
import com.shoaib.modal.BlockDate;
import com.shoaib.modal.BookingDate;
import com.shoaib.modal.Rooms;

@Service
public class AvailabilityService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> check_availability(int room_id) {
		Map<String, Object>  response = new HashMap<String, Object>();
		try {
			List<Availability> abvl = new ArrayList<Availability>();
			Map<String, Object>  map = new HashMap<String, Object>();
			map.put("sno", room_id);
			List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
			Map<String, Object>  mp = new HashMap<String, Object>();
			mp.put("room_id", room_id);
			List<BlockDate> bd = (List<BlockDate>)commonDao.getDataByMap(mp, new BlockDate(), null, null, 0, -1);
			List<BookingDate> bk = (List<BookingDate>)commonDao.getDataByMap(mp, new BookingDate(), null, null, 0, -1);
			  LocalDate currentDate = LocalDate.now();
			  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  for (int i = 0; i <= 60; i++) {
				    int totalRooms = room.get(0).getNo_of_rooms();
				    LocalDate nextDat = currentDate.plusDays(i);
				    String nextDateStr = nextDat.format(formatter);
				    Availability av = new Availability();

				    boolean isBlocked = false;
				    for (BlockDate b : bd) {
				        String blockDateStr = sdf.format(b.getBlock_date());
				        if (nextDateStr.equals(blockDateStr)) {
				            isBlocked = true;
				            break;
				        }
				    }

				    if (isBlocked) {
				        av.setAvailable_rooms(0);
				        av.setAvailable_date(nextDateStr);
				    } else {
				        int bookedCount = 0;
				        for (BookingDate bb : bk) {
				            String bookDateStr = sdf.format(bb.getBooking_date());
				            if (nextDateStr.equals(bookDateStr)) {
				                bookedCount++;
				            }
				        }

				        int availableRooms = totalRooms - bookedCount;
				        av.setAvailable_rooms(availableRooms);
				        av.setAvailable_date(nextDateStr);
				    }

				    abvl.add(av);
				}
			  
			  response.put("status", "success");
			  response.put("message", "Data Fetch Su");
			  response.put("data", abvl);
			  
			  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	public Map<String, Object> check_room(String check_in, String check_out, String room_id) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        List<Availability> abvl = new ArrayList<>();
	        Map<String, Object> map = new HashMap<>();
	        map.put("sno", Integer.parseInt(room_id));
	        List<Rooms> room = (List<Rooms>) commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);

	        Map<String, Object> mp = new HashMap<>();
	        mp.put("room_id", Integer.parseInt(room_id));
	        List<BlockDate> bd = (List<BlockDate>) commonDao.getDataByMap(mp, new BlockDate(), null, null, 0, -1);
	        List<BookingDate> bk = (List<BookingDate>) commonDao.getDataByMap(mp, new BookingDate(), null, null, 0, -1);

	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        if (check_in == null || check_out == null || check_in.trim().isEmpty() || check_out.trim().isEmpty()) {
	            response.put("status", "error");
	            response.put("message", "Check-in and Check-out dates are required");
	            return response;
	        }

	        LocalDate checkInDate = LocalDate.parse(check_in);
	        LocalDate checkOutDate = LocalDate.parse(check_out);

	        long numberOfNights = ChronoUnit.DAYS.between(checkInDate, checkOutDate);
	        if (numberOfNights <= 0) {
	            response.put("status", "error");
	            response.put("message", "Invalid date range");
	            return response;
	        }

	        for (int i = 0; i < numberOfNights; i++) {
	            int totalRooms = room.get(0).getNo_of_rooms();
	            LocalDate nextDat = checkInDate.plusDays(i);
	            String nextDateStr = nextDat.format(formatter);

	            Availability av = new Availability();
	            boolean isBlocked = false;

	            // Check if date is blocked
	            for (BlockDate b : bd) {
	                String blockDateStr = sdf.format(b.getBlock_date());
	                if (nextDateStr.equals(blockDateStr)) {
	                    isBlocked = true;
	                    break;
	                }
	            }

	            if (isBlocked) {
	                av.setAvailable_rooms(0);
	                av.setAvailable_date(nextDateStr);
	            } else {
	                int bookedCount = 0;
	                for (BookingDate bb : bk) {
	                    String bookDateStr = sdf.format(bb.getBooking_date());
	                    if (nextDateStr.equals(bookDateStr)) {
	                        bookedCount++;
	                    }
	                }
	                int availableRooms = totalRooms - bookedCount;
	                av.setAvailable_rooms(availableRooms);
	                av.setAvailable_date(nextDateStr);
	            }

	            abvl.add(av);
	        }

	        // Find availability with minimum available_rooms
	        Availability minAvailability = abvl.stream()
	                .min(Comparator.comparingInt(Availability::getAvailable_rooms))
	                .orElse(null);

	        List<Availability> result = new ArrayList<>();
	        if (minAvailability != null) {
	            result.add(minAvailability);
	        }

	        response.put("status", "success");
	        response.put("message", "Availability fetched");
	        response.put("data", result);

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "error");
	        response.put("message", "Exception occurred");
	    }

	    return response;
	}


}
