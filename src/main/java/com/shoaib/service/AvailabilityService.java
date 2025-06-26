package com.shoaib.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

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
	    Map<String, Object> response = new HashMap<>();
	    try {
	        List<Availability> abvl = new ArrayList<>();
	        Map<String, Object> map = new HashMap<>();
	        map.put("sno", room_id);
	        List<Rooms> room = (List<Rooms>) commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);

	        Map<String, Object> mp = new HashMap<>();
	        mp.put("room_id", room_id);
	        List<BlockDate> bd = (List<BlockDate>) commonDao.getDataByMap(mp, new BlockDate(), null, null, 0, -1);
	        List<BookingDate> bk = (List<BookingDate>) commonDao.getDataByMap(mp, new BookingDate(), null, null, 0, -1);

	        LocalDate currentDate = LocalDate.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String totalRoomStr = room.get(0).getRoom_number(); // You should fetch this from DB if not hardcoded
	        List<String> totalRoomsList = Arrays.asList(totalRoomStr.split(","));

	        for (int i = 0; i <= 60; i++) {
	            LocalDate nextDat = currentDate.plusDays(i);
	            String nextDateStr = nextDat.format(formatter);
	            Availability av = new Availability();

	            // Block date check
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
	                av.setRoom_number("Blocked");
	            } else {
	                Set<String> bookedRoomNumbers = new HashSet<>();

	                for (BookingDate bb : bk) {
	                    String bookDateStr = sdf.format(bb.getBooking_date());
	                    if (nextDateStr.equals(bookDateStr)) {
	                        if (bb.getRoom_number() != null && !bb.getRoom_number().trim().isEmpty()) {
	                            String[] bookedArray = bb.getRoom_number().split(",");
	                            for (String br : bookedArray) {
	                                bookedRoomNumbers.add(br.trim());
	                            }
	                        }
	                    }
	                }

	                // Find unbooked room numbers
	                List<String> availableRoomNumbers = totalRoomsList.stream()
	                    .filter(r -> !bookedRoomNumbers.contains(r))
	                    .collect(Collectors.toList());

	                av.setAvailable_rooms(availableRoomNumbers.size());
	                av.setAvailable_date(nextDateStr);
	                av.setRoom_number(String.join(",", availableRoomNumbers));
	            }

	            abvl.add(av);
	        }

	        response.put("status", "success");
	        response.put("message", "Data fetched successfully");
	        response.put("data", abvl);
	        response.put("total_room", room.get(0).getRoom_number());

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "error");
	        response.put("message", "Exception occurred");
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

	        if (room.isEmpty()) {
	            response.put("status", "error");
	            response.put("message", "Room not found");
	            return response;
	        }

	        String totalRoomStr = room.get(0).getRoom_number(); // e.g. "1,2,3,4,5,6,7,8"
	        List<String> totalRoomsList = Arrays.asList(totalRoomStr.split(","));

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
	            LocalDate nextDat = checkInDate.plusDays(i);
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
	                av.setRoom_number("Blocked");
	            } else {
	                Set<String> bookedRoomNumbers = new HashSet<>();

	                for (BookingDate bb : bk) {
	                    String bookDateStr = sdf.format(bb.getBooking_date());
	                    if (nextDateStr.equals(bookDateStr)) {
	                        if (bb.getRoom_number() != null && !bb.getRoom_number().trim().isEmpty()) {
	                            String[] booked = bb.getRoom_number().split(",");
	                            for (String r : booked) {
	                                bookedRoomNumbers.add(r.trim());
	                            }
	                        }
	                    }
	                }

	                List<String> availableRooms = totalRoomsList.stream()
	                        .filter(r -> !bookedRoomNumbers.contains(r))
	                        .collect(Collectors.toList());

	                av.setAvailable_rooms(availableRooms.size());
	                av.setAvailable_date(nextDateStr);
	                av.setRoom_number(String.join(",", availableRooms));
	            }

	            abvl.add(av);
	        }

	        response.put("status", "success");
	        response.put("message", "Availability fetched");
	        response.put("data", abvl);

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "error");
	        response.put("message", "Exception occurred");
	    }

	    return response;
	}

	public Map<String, Object> check_abvlty(int room_id, String check_in, String check_out) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        Map<String, Object> map = new HashMap<>();
	        map.put("sno", room_id);
	        List<Rooms> room = (List<Rooms>) commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);

	        Map<String, Object> mp = new HashMap<>();
	        mp.put("room_id", room_id);
	        List<BlockDate> bd = (List<BlockDate>) commonDao.getDataByMap(mp, new BlockDate(), null, null, 0, -1);
	        List<BookingDate> bk = (List<BookingDate>) commonDao.getDataByMap(mp, new BookingDate(), null, null, 0, -1);

	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	        LocalDate checkInDate = LocalDate.parse(check_in, formatter);
	        LocalDate checkOutDate = LocalDate.parse(check_out, formatter);

	        String totalRoomStr = room.get(0).getRoom_number();
	        List<String> totalRoomsList = Arrays.asList(totalRoomStr.split(","));

	        Availability minAvailability = null;

	        for (LocalDate date = checkInDate; date.isBefore(checkOutDate); date = date.plusDays(1)) {
	            String nextDateStr = date.format(formatter);
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
	                av.setRoom_number("Blocked");
	            } else {
	                Set<String> bookedRoomNumbers = new HashSet<>();
	                for (BookingDate bb : bk) {
	                    String bookDateStr = sdf.format(bb.getBooking_date());
	                    if (nextDateStr.equals(bookDateStr)) {
	                        if (bb.getRoom_number() != null && !bb.getRoom_number().trim().isEmpty()) {
	                            String[] bookedArray = bb.getRoom_number().split(",");
	                            for (String br : bookedArray) {
	                                bookedRoomNumbers.add(br.trim());
	                            }
	                        }
	                    }
	                }

	                List<String> availableRoomNumbers = totalRoomsList.stream()
	                        .filter(r -> !bookedRoomNumbers.contains(r))
	                        .collect(Collectors.toList());

	                av.setAvailable_rooms(availableRoomNumbers.size());
	                av.setAvailable_date(nextDateStr);
	                av.setRoom_number(String.join(",", availableRoomNumbers));
	            }

	            // Track the date with the least available rooms
	            if (minAvailability == null ||
	                    av.getAvailable_rooms() < minAvailability.getAvailable_rooms()) {
	                minAvailability = av;
	            }
	        }

	        List<Availability> result = new ArrayList<>();
	        if (minAvailability != null) {
	            result.add(minAvailability);
	        }

	        response.put("status", "success");
	        response.put("message", "Least available day fetched");
	        response.put("data", result);
	        response.put("total_room", room.get(0).getRoom_number());

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "error");
	        response.put("message", "Exception occurred");
	    }

	    return response;
	}



}
