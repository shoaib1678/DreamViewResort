package com.shoaib.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Amenities;
import com.shoaib.modal.Blogs;
import com.shoaib.modal.Booking;
import com.shoaib.modal.Category;
import com.shoaib.modal.Gallery;
import com.shoaib.modal.LoginCredentials;
import com.shoaib.modal.Rooms;
import com.shoaib.modal.SliderImage;
import com.shoaib.modal.Testimonial;
import com.shoaib.utils.Utils;

@Controller
public class HomeController {
	
	@Autowired
	CommonDao commonDao;
	
	/********************************* Website Urls ************************************************/

	@RequestMapping(value="/")
	public ModelAndView home(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/Home/home");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "Active");
		List<Testimonial> test = (List<Testimonial>)commonDao.getDataByMap(map, new Testimonial(), null, null, 0, -1);
		List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
		if(room.size() > 0) {
			for(Rooms r : room) {
				Map<String, Object> mapp = new HashMap<String, Object>();
				mapp.put("sno", r.getCategory_id());
				List<Category> cat = (List<Category>)commonDao.getDataByMap(mapp, new Category(), null, null, 0, -1);
				r.setCategory_name(cat.get(0).getCategory_name());
			}
			
		}
		List<Blogs> blog = (List<Blogs>)commonDao.getDataByMap(map, new Blogs(), "sno", "asc", 0, -1);
		mv.addObject("blog", blog);
		mv.addObject("room", room);
		mv.addObject("test", test);
		return mv;
	}
	@RequestMapping(value="/about")
	public ModelAndView about(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/About/about");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "Active");
		List<Testimonial> test = (List<Testimonial>)commonDao.getDataByMap(map, new Testimonial(), null, null, 0, -1);
		mv.addObject("test", test);
		return mv;
	}
	@RequestMapping(value="/user_auth")
	public ModelAndView user_auth(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/Login/login");
		return mv;
	}
	@RequestMapping(value="/activities")
	public ModelAndView activities(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/Activities/activities");
		return mv;
	}
	@RequestMapping(value="/blog")
	public ModelAndView blog(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/Blog/blog");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "Active");
		List<Blogs> blog = (List<Blogs>)commonDao.getDataByMap(map, new Blogs(), null, null, 0, -1);
		mv.addObject("blogs", blog);
		return mv; 
	}
	@RequestMapping(value="/blog_details")
	public ModelAndView blog_details(HttpServletRequest request) throws IOException{
		String sno = request.getParameter("id");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		map.put("sno", Integer.parseInt(sno));
		List<Blogs> blog = (List<Blogs>)commonDao.getDataByMap(map, new Blogs(), null, null, 0, -1);
		map1.put("type", "Blogs");
		map1.put("status", "Active");
		List<Category> cat = (List<Category>)commonDao.getDataByMap(map1, new Category(), null, null, 0, -1);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("category_id", blog.get(0).getCategory_id());
		map2.put("status", "Active");
		List<Blogs> blgs = (List<Blogs>)commonDao.getDataByMap(map2, new Blogs(), null, null, 0, -1);
		ModelAndView mv = new ModelAndView("Website/Blog/blog_details");
		mv.addObject("blogs", blog);
		mv.addObject("cat", cat);
		mv.addObject("blgs", blgs);
		return mv;
	}
	@RequestMapping(value="/booking")
	public ModelAndView booking(HttpServletRequest request) throws IOException{
		String sno = request.getParameter("id");
		ModelAndView mv = new ModelAndView("Website/Booking/booking");
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("sno", Integer.parseInt(sno));
		List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
		mv.addObject("room", room);
		return mv;
	}
	@RequestMapping(value="/contacts")
	public ModelAndView contact(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/Contact/contact");
		return mv;
	}
	@RequestMapping(value="/gallery")
	public ModelAndView gallery(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/Gallery/gallery");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		map.put("status", "Active");
		List<Gallery> gallery = (List<Gallery>)commonDao.getDataByMap(map, new Gallery(), null, null, 0, -1);
		for(Gallery g : gallery) {
			map1.put("sno", g.getCategory_id());
			List<Category> cat = (List<Category>)commonDao.getDataByMap(map1, new Category(), null, null, 0, -1);
		g.setCategory_name(cat.get(0).getCategory_name());
		}
		mv.addObject("gallery", gallery);
		return mv;
		
	}
	@RequestMapping(value="/rooms")
	public ModelAndView rooms(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/Rooms/rooms");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "Active");
		List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
		if(room.size() > 0) {
			for(Rooms r : room) {
				Map<String, Object> mapp = new HashMap<String, Object>();
				mapp.put("sno", r.getCategory_id());
				List<Category> cat = (List<Category>)commonDao.getDataByMap(mapp, new Category(), null, null, 0, -1);
				r.setCategory_name(cat.get(0).getCategory_name());
			}
			
		}
		mv.addObject("room", room);
		return mv;
	}
	@RequestMapping(value="/room_details")
	public ModelAndView room_details(HttpServletRequest request) throws IOException{
		String sno = request.getParameter("id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sno", Integer.parseInt(sno));
		List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
		if(room.size() > 0) {
			Map<String, Object> mp =new HashMap<String, Object>();
			mp.put("room_id", room.get(0).getSno());
			List<SliderImage> img = (List<SliderImage>)commonDao.getDataByMap(mp, new SliderImage(), null, null, 0, -1);
			room.get(0).setSimg(img);
		}
		Map<String, Object> mpp = new HashMap<String, Object>();
		
		
		List<Amenities> am =new ArrayList<Amenities>();
		String amm="";
		if(room.get(0).getAmenity_ids() != null && !room.get(0).getAmenity_ids().isEmpty()) {
		String[] aid = room.get(0).getAmenity_ids().split(",");
		for(int i=0; i<aid.length; i++) {
			mpp.put("sno", Integer.parseInt(aid[i]));
			 am = (List<Amenities>)commonDao.getDataByMap(mpp, new Amenities(), null, null, 0, -1);
			if(i==0) {
				amm = am.get(0).getAmenity_name();
			}else {
				amm += "@@@"+am.get(0).getAmenity_name();
			}
		}
			room.get(0).setAmenities_name(amm);
		}
		
		Map<String, Object> mp =new HashMap<String, Object>();
		mp.put("sno", room.get(0).getCategory_id());
		List<Category> cat = (List<Category>)commonDao.getDataByMap(mp, new Category(), null, null, 0, -1);
		room.get(0).setCategory_name(cat.get(0).getCategory_name());
		ModelAndView mv = new ModelAndView("Website/Rooms/room_details");
		mv.addObject("room", room);
		return mv;
	}
	@RequestMapping(value="/terms&conditions")
	public ModelAndView terms_and_conditions(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/TermsCondition/terms_condition");
		return mv;
	}
	@RequestMapping(value="/privacy_policy")
	public ModelAndView privacy_policy(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/PrivacyPolicy/privacy_policy");
		return mv;
	}
	@RequestMapping(value="/thank_you")
	public ModelAndView thank_you(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Website/Booking/thankyou");
		String booking_id = request.getParameter("booking_id");
		mv.addObject("booking_id", booking_id);
		return mv;
	}
	@RequestMapping(value="/reciept")
	public ModelAndView reciept(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("Pdf/reciept");
		String booking_id = request.getParameter("booking_id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("booking_id", booking_id);
		List<Booking> book = (List<Booking>)commonDao.getDataByMap(map, new Booking(), null, null, 0, -1);
		Map<String, Object> mp = new HashMap<String, Object>();
		map.put("sno", book.get(0).getRoom_id());
		List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(mp, new Rooms(), null, null, 0, -1);
		book.get(0).setTitle(room.get(0).getTitle());
		mv.addObject("book", book);
		return mv;
	}
	/********************************* Website Panel Urls End ************************************************/
	@RequestMapping(value = "/displayimage", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayAssociateImage(HttpServletRequest request) throws IOException {
		String url = request.getParameter("url");
		HttpHeaders headers = new HttpHeaders();
		InputStream in = null;
		try {
			in = new FileInputStream(Utils.staticimages + "/" + url);
		} catch (Exception e) {
			System.out.println(e);
		}
		byte[] media = IOUtils.toByteArray(in);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ResponseEntity<byte[]> responseEntity = new ResponseEntity(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	/********************************* Admin Panel Urls ************************************************/
	
	@RequestMapping(value="/admin")
	public ModelAndView admin(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/login");
		return mv;
	}
	@RequestMapping(value="/dashboard")
	public ModelAndView dashboard(HttpServletRequest request,HttpSession session) throws IOException{
		LoginCredentials lg = (LoginCredentials)session.getAttribute("loginData");
		if(lg !=null) {
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("status", "Active");
			List<Rooms> rooms = (List<Rooms>)commonDao.getDataByMap(map1, new Rooms(), null, null, 0, -1);
			ModelAndView mv = new ModelAndView("AdminPanel/dashboard");
			mv.addObject("rooms", rooms);
			return mv;
		}else {
			String email = request.getParameter("email");
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("email", email);
			map.put("status", "Active");
			map.put("user_type", "Admin");
			List<LoginCredentials> login = (List<LoginCredentials>)commonDao.getDataByMap(map, new LoginCredentials(), null, null, 0, -1);
			if(login.size() > 0) {
				Map<String, Object> map1 = new HashMap<String, Object>();
				map1.put("status", "Active");
				List<Rooms> rooms = (List<Rooms>)commonDao.getDataByMap(map1, new Rooms(), null, null, 0, -1);
				ModelAndView mv = new ModelAndView("AdminPanel/dashboard");
				mv.addObject("rooms", rooms);
				session.setAttribute("loginData", login.get(0));
				return mv;
			}else {
				return new ModelAndView("redirect:./");
			}
		}
	}
	@RequestMapping(value="/manage_banner")
	public ModelAndView manage_banner(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Banner/banner");
		return mv;
	}
	@RequestMapping(value="/amenities")
	public ModelAndView amenities(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Manage_Rooms/amenities");
		return mv;
	}
	@RequestMapping(value="/category")
	public ModelAndView category(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Manage_Rooms/category");
		return mv;
	}
	@RequestMapping(value="/manage_rooms")
	public ModelAndView manage_rooms(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Manage_Rooms/rooms");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "Room");
		map.put("status", "Active");
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("status", "Active");
		List<Category> cat = (List<Category>)commonDao.getDataByMap(map, new Category(), null, null, 0, -1);
		List<Amenities> ame = (List<Amenities>)commonDao.getDataByMap(map1, new Amenities(), null, null, 0, -1);
		mv.addObject("cat", cat);
		mv.addObject("ame", ame);
		return mv;
	}
	@RequestMapping(value="/availability")
	public ModelAndView availability(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Manage_Rooms/room_availability");
		return mv;
	}
	@RequestMapping(value="/coupons")
	public ModelAndView coupons(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Manage_Rooms/coupons");
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("status", "Active");
		List<Rooms> rooms = (List<Rooms>)commonDao.getDataByMap(map1, new Rooms(), null, null, 0, -1);
		mv.addObject("rooms", rooms);
		return mv;
	}
	@RequestMapping(value="/blogs_category")
	public ModelAndView blogs_category(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Manage_Blogs/category");
		return mv;
	}
	@RequestMapping(value="/manage_blogs")
	public ModelAndView manage_blogs(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Manage_Blogs/blogs");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "Blogs");
		map.put("status", "Active");
		List<Category> cat = (List<Category>)commonDao.getDataByMap(map, new Category(), null, null, 0, -1);
		mv.addObject("cat", cat);
		return mv;
	}
	@RequestMapping(value="/gallery_category")
	public ModelAndView gallery_category(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Gallery/category");
		return mv;
	}
	@RequestMapping(value="/manage_gallery")
	public ModelAndView manage_gallery(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Gallery/gallery");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "Gallery");
		map.put("status", "Active");
		List<Category> cat = (List<Category>)commonDao.getDataByMap(map, new Category(), null, null, 0, -1);
		mv.addObject("cat", cat);
		return mv;
	}
	@RequestMapping(value="/manage_testimonial")
	public ModelAndView manage_testimonial(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Testimonials/testimonial");
		return mv;
	}
	@RequestMapping(value="/block_date")
	public ModelAndView block_date(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Booking/blockdate");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "Active");
		List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
		mv.addObject("room", room);
		return mv;
	}
	@RequestMapping(value="/book_manually")
	public ModelAndView book_manually(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Booking/manualbooking");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "Active");
		List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
		mv.addObject("rooms", room);
		return mv;
	}
	@RequestMapping(value="/reserved_rooms")
	public ModelAndView reserved_room(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Booking/reservedRoom");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "Active");
		List<Rooms> room = (List<Rooms>)commonDao.getDataByMap(map, new Rooms(), null, null, 0, -1);
		mv.addObject("rooms", room);
		return mv;
	}
	@RequestMapping(value="/payment_details")
	public ModelAndView payment_details(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/Payment/payment");
		return mv;
	}
	@RequestMapping(value="/registered_user")
	public ModelAndView registered_user(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("AdminPanel/User/users");
		return mv;
	}
}
