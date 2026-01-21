package com.shoaib.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Booking;
import com.shoaib.modal.BookingDate;
import com.shoaib.modal.CancelBooking;
import com.shoaib.modal.Rooms;

@Service
public class CancelBookingService {

	@Autowired
	CommonDao commonDao;
	@Autowired
	EmailService emailService;

	public Map<String, Object> add_cancel(CancelBooking cancelBooking) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			cancelBooking.setBooking_status("Cancelled");
			cancelBooking.setCancellation_date(new Date());
			int i = commonDao.addDataToDb(cancelBooking);
			if(i > 0) {
				Map<String,Object> map = new HashMap<String,Object>();
				Map<String,Object> map1 = new HashMap<String,Object>();
				map.put("booking_id", cancelBooking.getBooking_id());
				List<Booking> booking  = (List<Booking>)commonDao.getDataByMap(map, new Booking(), null, null, 0, -1);
				booking.get(0).setStatus("Cancelled");
				commonDao.updateDataToDb(booking.get(0));
				map1.put("sno", booking.get(0).getRoom_id());
				List<Rooms> room  = (List<Rooms>)commonDao.getDataByMap(map1, new Rooms(), null, null, 0, -1);
				Date checkInDate = booking.get(0).getCheck_in();
				LocalDate checkIn = checkInDate.toInstant()
				                               .atZone(ZoneId.systemDefault())
				                               .toLocalDate();

				for (int k = 0; k < booking.get(0).getNight(); k++) {
				    LocalDate currentDate = checkIn.plusDays(k);
				    Date targetDate = Date.from(currentDate.atStartOfDay(ZoneId.systemDefault()).toInstant());

				    // Prepare condition map
				    Map<String, Object> condition = new HashMap<>();
				    condition.put("room_id", booking.get(0).getRoom_id());
				    condition.put("booking_date", targetDate);

				    // Fetch matching records (if needed before deletion)
				    List<BookingDate> bookingDates = (List<BookingDate>) commonDao.getDataByMap(
				        condition, new BookingDate(), null, null, 0, -1
				    );

				    for (BookingDate bd : bookingDates) {
				       // commonDao.deleteDataFromDb(bd);  // or batch delete later
				    }
				}
				String subject = "Booking Cancellation Confirmation – Booking ID: " + cancelBooking.getBooking_id();
				String message = "<!DOCTYPE html>"
					    + "<html><head>"
					    + "<style>"
					    + "body { font-family: Arial, sans-serif; line-height: 1.6; }"
					    + ".container { max-width: 600px; padding: 20px; border: 1px solid #f5c6cb; background-color: #f8d7da; border-radius: 8px; margin: auto; }"
					    + "h2 { color: #721c24; text-align: center; }"
					    + "table { width: 100%; border-collapse: collapse; }"
					    + "td { padding: 8px 0; vertical-align: top; }"
					    + ".label { font-weight: bold; width: 160px; }"
					    + ".footer { margin-top: 20px; font-size: 14px; color: #555; text-align: center; }"
					    + ".logo { display: block; margin: 0 auto 20px; max-height: 80px; }"
					    + "</style>"
					    + "</head><body>"
					    + "<div class='container'>"
					    + "<img src='https://dreamviewresortmadhai.com/assets/images/bllogo.jpg' alt='Resort Logo' class='logo'>"
					    + "<h2>Booking Cancelled</h2>"
					    + "<p>Dear " + booking.get(0).getName()+ ",</p>"
					    + "<p>Your booking has been <strong>successfully cancelled</strong>. Please find the details below:</p>"

					    + "<table>"
					    + "<tr><td class='label'>Booking ID:</td><td>" + cancelBooking.getBooking_id() + "</td></tr>"
					    + "<tr><td class='label'>Name:</td><td>" + booking.get(0).getName() + "</td></tr>"
					    + "<tr><td class='label'>Email:</td><td>" + booking.get(0).getEmail() + "</td></tr>"
					    + "<tr><td class='label'>Contact Number:</td><td>" + booking.get(0).getMobile_number() + "</td></tr>"
					    + "<tr><td class='label'>Room:</td><td>" + room.get(0).getTitle() + "</td></tr>"
					    + "<tr><td class='label'>Guest:</td><td>" + booking.get(0).getAdult() + " Adults, " + booking.get(0).getChild() + " Children</td></tr>"
					    + "<tr><td class='label'>Room Number:</td><td>" + booking.get(0).getRoom_number() + "</td></tr>"
					    + "<tr><td class='label'>Check-in:</td><td>" + booking.get(0).getCheck_in() + "</td></tr>"
					    + "<tr><td class='label'>Check-out:</td><td>" + booking.get(0).getCheck_out() + "</td></tr>";

					if (booking.get(0).getPayment_mode().equalsIgnoreCase("Online")) {
					    double paid = booking.get(0).getPaid_amount();
					    double cancelCharges = Double.parseDouble(cancelBooking.getCancellation_charge());
					    Double refund = paid - cancelCharges;

					    message += "<tr><td class='label'>Payment Mode:</td><td>Online</td></tr>"
					            + "<tr><td class='label'>Amount Paid:</td><td>₹" + paid + "</td></tr>"
					            + "<tr><td class='label'>Cancellation Charges:</td><td>₹" + cancelCharges + "</td></tr>"
					            + "<tr><td class='label'>Refund Amount:</td><td>₹" + refund + "</td></tr>"
					            + "<tr><td class='label'>Refund Time:</td><td>Within 5–7 business days</td></tr>";
					} else {
					    message += "<tr><td class='label'>Payment Mode:</td><td>Offline</td></tr>"
					             + "<tr><td class='label' colspan='2'>Cancellation recorded successfully.</td></tr>";
					}

					message += "</table>"
					        + "<p>If you have any questions, feel free to contact our support team.</p>"
					        + "<div class='footer'>Thank you for considering Dream View Heritage Resort Madhai.</div>"
					        + "</div></body></html>";
					emailService.sendEmailMessage(booking.get(0).getEmail(), subject, message);

				response.put("status", "Success");
				response.put("message", "Cancellation Successfully");
			}else {
				response.put("status", "Failed");
				response.put("message", "Something went wrong");
			}		
			
			
		} catch (Exception e) {
			e.printStackTrace();
			response.put("message", "Internal server Error"+e);
		}
		return response;
	}

	public Map<String, Object> get_cancel(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("booking_id", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<CancelBooking> list = (List<CancelBooking>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new CancelBooking(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new CancelBooking(), "sno", "asc");
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

	public Map<String, Object> get_data_forcancel(String booking_id) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("booking_id", booking_id);
			List<Booking> data  = (List<Booking>)commonDao.getDataByMap(map, new Booking(), null, null, 0, -1);
			if(data.size() > 0) {
				response.put("data", data);
				response.put("status", "Success");
			}else {
				response.put("status", "Failed");
				response.put("message", "Something went wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("message", "Internal server Error"+e);
		}
		return response;
	}
}
