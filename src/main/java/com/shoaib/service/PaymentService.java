package com.shoaib.service;

import java.awt.print.Book;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.shoaib.dao.CommonDao;
import com.shoaib.modal.Booking;
import com.shoaib.modal.RazorPayOrder;
import com.shoaib.modal.RazorPayPaymentData;
import com.shoaib.modal.RazorPayPaymentResponse;

@Service
public class PaymentService {

	
	@Autowired
	CommonDao commonDao;
	@Autowired
	PaymentService paymentService;
	private static final String HMAC_SHA256_ALGORITHM = "HmacSHA256";
	

//	public Map<String, Object> add_Payment(Payment payment) {
//	    Map<String, Object> response = new HashMap<>();
//	    try {
//	    	payment.setPayment_status("Pending");
//	        int i = commonDao.addDataToDb(payment);
//	        if (i > 0) {
//	        	paymentService.updateRazorPayOrder(payment.getOrder_id());
//				response.put("status", "Success");
//				response.put("message","Enquiry Saved Successfully");
//				payment.setOrder_id(payment.getOrder_id());
//				payment.setPayment_status("Paid");
//				commonDao.updateDataToDb(payment);
//				paymentService.add_razorpay_payment(payment.getOrder_id(),payment.getRazorpay_order_id(), payment.getRazorpay_payment_id(),payment.getRazorpay_signature(),payment.getType());
//	            response.put("status", "Success");
//	            response.put("message", "Payment Added Successfully");
//	        } else {
//	            response.put("status", "Failed");
//	            response.put("message", "Something went wrong");
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        response.put("status", "Failed");
//	        response.put("message", "Internal Server Error: " + e.getMessage());
//	    }
//	    return response;
//	}

	public Map<String, Object> get_Payment(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> or_map = new HashMap<String,Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("orderId", search);
				or_map.put("transactionId", search);
				or_map.put("amount", search);
				or_map.put("name", search);
				or_map.put("email", search);
				or_map.put("phone", search);
				or_map.put("paymentType", search);
				or_map.put("status", search);
			}
			List<RazorPayPaymentData> list = (List<RazorPayPaymentData>) commonDao.getDataByMapSearchAnd(map,or_map, new RazorPayPaymentData(), "sno", "desc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(map, or_map, new RazorPayPaymentData(), "sno", "desc");
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
	
	public Map<String, Object> create_order(Map<String, Object> data) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Random rand = new Random();
			String randomId = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
			String txnId = "order_" + hashCal("SHA-256", randomId).substring(0, 12);
			int amt = Integer.parseInt(data.get("amount").toString());
			RazorpayClient client =	new RazorpayClient("rzp_test_TAsu9r4XMXPVIJ", "TpYasSaRnKsnRve9ca3I1aO5");
			JSONObject  ob = new JSONObject();
			ob.put("amount", amt*100);
			ob.put("currency", "INR");
			ob.put("receipt", txnId);
			Order order  = client.orders.create(ob);
			RazorPayOrder rpOrder = new RazorPayOrder();
			rpOrder.setAmount(order.get("amount").toString());
			rpOrder.setAmountPaid(order.get("amount_paid").toString());
			rpOrder.setCreatedAt(order.get("created_at").toString());
			rpOrder.setAmountDue(order.get("amount_due").toString());
			rpOrder.setCurrency(order.get("currency").toString());
			rpOrder.setReceipt(order.get("receipt").toString());
			rpOrder.setId(order.get("id").toString());
			rpOrder.setEntity(order.get("entity").toString());
			rpOrder.setOfferId(order.get("offer_id").toString());
			rpOrder.setAttempts(order.get("attempts").toString());
			rpOrder.setStatus(order.get("status").toString());
			
			int i = commonDao.addDataToDb(rpOrder);
			if(i > 0) {
				response.put("razorOrder", order.toString());
				System.out.println("order="+order);
			}
		}catch(Exception e) {
			response.put("status", "Failed");
			response.put("message", "Internal Server Error"+e);
		}
		return response;
	}
	
	
	public Map<String, Object> updateRazorPayOrder(String order_id) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", order_id);
			List<RazorPayOrder> data = (List<RazorPayOrder>)commonDao.getDataByMap(map, new RazorPayOrder(), null, null, 0, -1);
			if(data.size() > 0) {
				Map<String, Object> search = new HashMap<String, Object>();
				search.put("sno", data.get(0).getSno());
				ObjectMapper mapObject = new ObjectMapper();
				Map<String, Object> mapObj = mapObject.convertValue(new RazorPayOrder(), Map.class);
				mapObj.put("amountPaid", data.get(0).getAmount());
				mapObj.put("amountDue", "0");
				mapObj.put("attempts", 1);
				mapObj.put("status", "Paid");
				int id = commonDao.updateMethodForAll(mapObj, "RazorPayOrder", search);
				if (id > 0) {
					response.put("status", "Success");
				}
			}
		}catch(Exception e) {
			response.put("status", "Failed");
			response.put("message", "Internal Server Error"+e);
		}
		return response;
	}
	
	
	public Map<String, Object> add_razorpay_payment(String id, String payment_id,String transaction_id,String signature, String type) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("order_id", id);

			List<Booking> book = (List<Booking>)commonDao.getDataByMap(map, new Booking(), null, null, 0, -1);
			if (book != null && !book.isEmpty()) {
			    Map<String, Object> map1 = new HashMap<>();
			    map1.put("id", id);
			    List<RazorPayOrder> order = (List<RazorPayOrder>) commonDao.getDataByMap(map1, new RazorPayOrder(), null, null, 0, -1);

			    if (!order.isEmpty()) {
			      
			        	float amt  = Float.parseFloat(order.get(0).getAmount()) /100;
			            RazorPayPaymentData rpData = new RazorPayPaymentData();
			            rpData.setName(book.get(0).getName());
			            rpData.setEmail(book.get(0).getEmail());
			            rpData.setPhone(book.get(0).getMobile_number());
			            rpData.setAmount(String.valueOf(amt));
			            rpData.setOrderId(order.get(0).getId());
			            rpData.setPaymentid(payment_id);
			            rpData.setTransactionId(transaction_id);
			            rpData.setSignature(signature);
			            rpData.setPaymentType(type);
			            rpData.setStatus("Paid");
			            rpData.setCreatedAt(new Date());

			            int i = commonDao.addDataToDb(rpData);
			            if (i > 0) {
			                RazorPayPaymentResponse rppr = new RazorPayPaymentResponse();
			                rppr.setRazorpay_order_id(payment_id);
			                rppr.setRazorpay_payment_id(transaction_id);
			                rppr.setRazorpay_signature(signature);
			                int j = commonDao.addDataToDb(rppr);
			                if (j > 0) {
			                    response.put("status", "Success");
			                } else {
			                    response.put("status", "Error");
			                }
			            } else {
			                response.put("status", "Error");
			            }
			        
			    } else {
			        response.put("status", "Error");
			    }
			} else {
			    response.put("status", "Error");
			}

		}catch(Exception e) {
			response.put("status", "Failed");
			response.put("message", "Internal Server Error"+e);
		}
		return response;
	}
	
	
	public static String calculateRFC2104HMAC(String data, String secret) throws java.security.SignatureException {
		String result;
		try {
			// get an hmac_sha256 key from the raw secret bytes
			SecretKeySpec signingKey = new SecretKeySpec(secret.getBytes(), HMAC_SHA256_ALGORITHM);

			// get an hmac_sha256 Mac instance and initialize with the signing key
			Mac mac = Mac.getInstance(HMAC_SHA256_ALGORITHM);
			mac.init(signingKey);

			// compute the hmac on input data bytes
			byte[] rawHmac = mac.doFinal(data.getBytes());

			// base64-encode the hmac
			result = DatatypeConverter.printHexBinary(rawHmac).toLowerCase();

		} catch (Exception e) {
			e.printStackTrace();
			throw new SignatureException("Failed to generate HMAC : " + e.getMessage());
		}
		return result;
	}

	public static String hashCal(String type, String str) {
		byte[] hashseq = str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try {
			MessageDigest algorithm = MessageDigest.getInstance(type);
			algorithm.reset();
			algorithm.update(hashseq);
			byte messageDigest[] = algorithm.digest();
			for (int i = 0; i < messageDigest.length; i++) {
				String hex = Integer.toHexString(0xFF & messageDigest[i]);
				if (hex.length() == 1) {
					hexString.append("0");
				}
				hexString.append(hex);
			}

		} catch (NoSuchAlgorithmException nsae) {
		}
		return hexString.toString();
	}


	public Map<String, Object> get_payment_details(int start, int length, String search) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Object> map_or = new HashMap<String, Object>();
			map_or.put("name", search);
			map_or.put("email", search);
			map_or.put("phone", search);
			map_or.put("orderId", search);
			List<RazorPayPaymentData> data = (List<RazorPayPaymentData>) commonDao.getDataByMapSearchAnd(new HashMap<String, Object>(),map_or,
					new RazorPayPaymentData(), "sno", "asc", start, length);
			int count = commonDao.getDataByMapSize(new HashMap<String, Object>(), new RazorPayPaymentData(), null, null, 0,
					-1);
			if (data.size() > 0) {
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", data);
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);

			} else {
				response.put("status", "No_Content");
				response.put("message", "Data Fetched Successfully");
				response.put("data", new ArrayList<>());
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}


	

	private String getBase64EncodedCredentials(String apiKey, String apiSecret) {
        String credentials = apiKey + ":" + apiSecret;
        return java.util.Base64.getEncoder().encodeToString(credentials.getBytes());
    }
	
}
