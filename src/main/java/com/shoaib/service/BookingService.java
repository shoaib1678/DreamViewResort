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
import com.shoaib.modal.Banner;
import com.shoaib.modal.Booking;
import com.shoaib.modal.BookingDate;
import com.shoaib.modal.Rooms;

@Service
public class BookingService {

    @Autowired
    CommonDao commonDao;

    @Autowired
    PaymentService paymentService;

    @Autowired
    EmailService emailService;

    public Map<String, Object> reserve_room(Booking booking) {
        Map<String, Object> response = new HashMap<String, Object>();
        try {
            booking.setStatus("Active");
            booking.setCreatedAt(new Date());
            int i = commonDao.addDataToDb(booking);
            if (i > 0) {

                LocalDate currentdate = LocalDate.now();
                int yea = currentdate.getYear() % 100 + 1;
                String dranum = currentdate.getYear() % 100 + "-" + yea + "/" + i;
                String booking_id = "Dream/" + dranum;

                Map<String, Object> map = new HashMap<String, Object>();
                map.put("sno", i);
                List<Booking> saf = (List<Booking>) commonDao.getDataByMap(map, new Booking(), null, null, 0, -1);
                saf.get(0).setBooking_id(booking_id);
                commonDao.updateDataToDb(saf.get(0));
                BookingDate b = new BookingDate();
                Date checkInDate = booking.getCheck_in();
                LocalDate checkIn = checkInDate.toInstant()
                                             .atZone(ZoneId.systemDefault())
                                             .toLocalDate();
                System.out.println("bdate="+booking.getNight());
                if(booking.getNight() > 1) {
                	for(int k=0; k <booking.getNight(); k++ ) {
                		LocalDate nextDate = checkIn.plusDays(k);
                		b.setRoom_id(booking.getRoom_id());
                		Date bookingDate = Date.from(nextDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
                		b.setBooking_date(bookingDate);
                		b.setCreatedAt(new Date());
                		commonDao.addDataToDb(b);
                	}
                }else {
                	b.setRoom_id(booking.getRoom_id());
                	b.setBooking_date(booking.getCheck_in());
            		b.setCreatedAt(new Date());
            		commonDao.addDataToDb(b);
                }
                Map<String, Object> map1 = new HashMap<String, Object>();
                map1.put("sno", booking.getRoom_id());
                List<Rooms> room = (List<Rooms>) commonDao.getDataByMap(map1, new Rooms(), null, null, 0, -1);
                String email = "info.dreamviewheritage@gmail.com";
                String subject = "New Resort Booked for " + room.get(0).getTitle() + "";
                String message =
                	    "<!DOCTYPE html>" +
                	    "<html><head>" +
                	    "<style>" +
                	    "  body { font-family: Arial, sans-serif; line-height: 1.6; }" +
                	    "  .container { max-width: 600px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; margin: auto; }" +
                	    "  h2 { color: #2c3e50; text-align: center; }" +
                	    "  table { width: 100%; border-collapse: collapse; }" +
                	    "  td { padding: 8px 0; vertical-align: top; }" +
                	    "  .label { font-weight: bold; width: 160px; }" +
                	    "  .footer { margin-top: 20px; font-size: 14px; color: #555; text-align: center; }" +
                	    "  .logo { display: block; margin: 0 auto 20px; max-height: 80px; }" +
                	    "</style>" +
                	    "</head><body>" +
                	    "<div class='container'>" +
                	    "<img src='https://dreamviewresortmadhai.com/assets/img/1723011694.png' alt='Resort Logo' class='logo'>" +
                	    "<h2>Booking Confirmation</h2>" +
                	    "<table>" +
                	    "  <tr><td class='label'>Booking ID:</td><td>" + booking_id + "</td></tr>" +
                	    "  <tr><td class='label'>Name:</td><td>" + booking.getName() + "</td></tr>" +
                	    "  <tr><td class='label'>Email:</td><td>" + booking.getEmail() + "</td></tr>" +
                	    "  <tr><td class='label'>Contact Number:</td><td>" + booking.getMobile_number() + "</td></tr>" +
                	    "  <tr><td class='label'>Room:</td><td>" + room.get(0).getTitle() + "</td></tr>" +
                	    "  <tr><td class='label'>Check-in Date:</td><td>" + booking.getCheck_in() + "</td></tr>" +
                	    "  <tr><td class='label'>Check-out Date:</td><td>" + booking.getCheck_out() + "</td></tr>" +
                	    "  <tr><td class='label'>Payment Mode:</td><td>" + booking.getPayment_mode() + "</td></tr>" +
                	    "</table>" +
                	    "</div></body></html>";


                emailService.sendEmailMessage(email, subject, message);

                String subject1 = "noreply";
                String message1 = 
                	    "<!DOCTYPE html>" +
                	    "<html>" +
                	    "<head>" +
                	    "<style>" +
                	    "  body { font-family: Arial, sans-serif; line-height: 1.6; }" +
                	    "  .container { max-width: 600px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; margin: auto; }" +
                	    "  h2 { color: #2c3e50; text-align: center; }" +
                	    "  table { width: 100%; border-collapse: collapse; }" +
                	    "  td { padding: 8px 0; }" +
                	    "  .label { font-weight: bold; width: 150px; }" +
                	    "  .footer { margin-top: 20px; font-size: 14px; color: #555; text-align: center; }" +
                	    "  .logo { display: block; margin: 0 auto 20px; max-height: 80px; }" +
                	    "</style>" +
                	    "</head>" +
                	    "<body>" +
                	    "<div class='container'>" +
                	    "  <img src='https://dreamviewresortmadhai.com/assets/img/1723011694.png' alt='Resort Logo' class='logo'>" +
                	    "  <h2>Booking Confirmation Details</h2>" +
                	    "  <table>" +
                	    "    <tr><td class='label'>Booking ID:</td><td>" + booking_id + "</td></tr>" +
                	    "    <tr><td class='label'>Name:</td><td>" + booking.getName() + "</td></tr>" +
                	    "    <tr><td class='label'>Email:</td><td>" + booking.getEmail() + "</td></tr>" +
                	    "    <tr><td class='label'>Contact Number:</td><td>" + booking.getMobile_number() + "</td></tr>" +
                	    "    <tr><td class='label'>Room:</td><td>" + room.get(0).getTitle() + "</td></tr>" +
                	    "    <tr><td class='label'>Check-in Date:</td><td>" + booking.getCheck_in() + "</td></tr>" +
                	    "    <tr><td class='label'>Check-out Date:</td><td>" + booking.getCheck_out() + "</td></tr>" +
                	    "    <tr><td class='label'>Payment Mode:</td><td>" + booking.getPayment_mode() + "</td></tr>" +
                	    "  </table>" +
                	    "  <div class='footer'>Thank you for choosing us. We look forward to welcoming you!</div>" +
                	    "</div>" +
                	    "</body>" +
                	    "</html>";

                emailService.sendEmailMessage(booking.getEmail(), subject1, message1);
                if(booking.getPayment_mode().equalsIgnoreCase("Online")) {

	                paymentService.updateRazorPayOrder(booking.getOrder_id());
	                booking.setOrder_id(booking.getOrder_id());
	                if(booking.getPayment_type().equalsIgnoreCase("20%")) {
	                	 booking.setPayment_status("Partially Paid");
	                }else {
	                	 booking.setPayment_status("Paid");
	                }
	                booking.setBooking_id(booking_id);
	                commonDao.updateDataToDb(booking);
	
	                paymentService.add_razorpay_payment(
	                        booking.getOrder_id(),
	                        booking.getRazorpay_order_id(),
	                        booking.getRazorpay_payment_id(),
	                        booking.getRazorpay_signature(),
	                        booking.getType()
	                );
                }else {
                	booking.setPayment_status("Pending");
                	 commonDao.updateDataToDb(booking);
                }
                response.put("status", "Success");
                response.put("bid", booking_id);
                response.put("message", "Booking Successfully");

            } else {
                response.put("status", "Failed");
                response.put("message", "Something went wrong");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "Failed");
            response.put("message", "Internal Server error: " + e.getMessage());
        }
        return response;
    }

	public Map<String, Object> get_booking(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> or_map = new HashMap<String,Object>();
			List<Booking> list = (List<Booking>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Booking(), "sno", "desc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Booking(), "sno", "desc");
			if(list.size()>0) {
				for(Booking b : list) {
					Map<String,Object> mp = new HashMap<String,Object>();
					mp.put("sno", b.getRoom_id());
					List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(mp, new Rooms(), null, null, 0, -1);
					b.setTitle(room.get(0).getTitle());
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

	public Map<String, Object> getBdata(String booking_id) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> mp = new HashMap<String,Object>();
			map.put("booking_id", booking_id);
			List<Booking> book = (List<Booking>)commonDao.getDataByMap(map, new Booking(), null, null, 0, -1);
			mp.put("sno", book.get(0).getRoom_id());
			List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(mp, new Rooms(), null, null, 0, -1);
			book.get(0).setTitle(room.get(0).getTitle());
			response.put("status", "Success");
			response.put("data", book);
		} catch (Exception e) {
			response.put("message", "Internal server Error"+e);
			e.printStackTrace();
			return response;
		}
		return response;
	}
}
