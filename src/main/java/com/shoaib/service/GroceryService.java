package com.shoaib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.GroceryDetails;
import com.shoaib.modal.Items;
import com.shoaib.modal.StockEntry;
import com.shoaib.modal.Vendor;
import com.shoaib.modal.GroceryItems;

@Service
public class GroceryService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_item(Items items) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object>mapdata = new HashMap<String, Object>();
			mapdata.put("sno", items.getSno());
			List<Items> list = (List<Items>)commonDao.getDataByMapOr(mapdata, new Items(), null, null, 0, -1);
			if(list.size() > 0) {
				list.get(0).setCategory_name(items.getCategory_name());
				list.get(0).setItem_name(items.getItem_name());
				list.get(0).setUnit(items.getUnit());
				list.get(0).setHsn_code(items.getHsn_code());
				commonDao.updateDataToDb(list.get(0));
				response.put("status", "Success");
				response.put("message", "Item Name Updated Successfully");
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("item_name", items.getItem_name());
				List<Items> data = (List<Items>)commonDao.getDataByMap(map, new Items(), null, null, 0, -1);
				if(data.size() > 0) {
					response.put("status", "Already_Exist");
					response.put("message", "Item Name Already Exist");
				}else{
					items.setStatus("Active");
					items.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(items);
					if(i > 0) {
						response.put("status", "Success");
						response.put("message", "Item Name Added Successfully");
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

	public Map<String, Object> get_items(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("item_name", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<Items> list = (List<Items>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new Items(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new Items(), "sno", "asc");
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

	public Map<String, Object> edit_item(String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Items> list = (List<Items>) commonDao.getDataByMap(map, new Items(), null, null, 0, -1);	
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
	
	public Map<String, Object> add_groceries(GroceryDetails groceryDetails) {
	    Map<String, Object> response = new HashMap<>();

	    try {
	        Map<String, Object> mapdata = new HashMap<>();
	        mapdata.put("sno", groceryDetails.getSno());

	        List<GroceryDetails> list = (List<GroceryDetails>) commonDao.getDataByMap(
	                mapdata, new GroceryDetails(), null, null, 0, -1
	        );

	        if (list.size() > 0) {
	            // ===== UPDATE CASE =====

	            GroceryDetails gd = list.get(0);

	            // --- 1. Fetch old items before deleting (needed for stock reversal) ---
	            Map<String, Object> delMap = new HashMap<>();
	            delMap.put("gid", gd.getSno());
	            List<GroceryItems> oldItems = (List<GroceryItems>) commonDao.getDataByMap(
	                    delMap, new GroceryItems(), null, null, 0, -1
	            );

	            // --- 2. Reverse stock for old items (non-Grocery only) ---
	            if (!gd.getCategory_name().equalsIgnoreCase("Grocery")) {
	                for (GroceryItems giOld : oldItems) {
	                    Map<String, Object> stockMap = new HashMap<>();
	                    stockMap.put("item_id", giOld.getItem_id());
	                    stockMap.put("purchase_for", gd.getPurchase_for());
	                    List<StockEntry> stockList = (List<StockEntry>) commonDao.getDataByMap(
	                            stockMap, new StockEntry(), null, null, 0, -1
	                    );
	                    if (stockList.size() > 0) {
	                        StockEntry se = stockList.get(0);
	                        float newQty    = se.getQty()     - giOld.getQty();
	                        float newRemQty = se.getRem_qty() - giOld.getQty();
	                        se.setQty(Math.max(newQty, 0));
	                        se.setRem_qty(Math.max(newRemQty, 0));
	                        se.setLas_qty(giOld.getQty());
	                        commonDao.updateDataToDb(se);
	                    }
	                }
	            }

	            // --- 3. Delete old items ---
	            for (GroceryItems giOld : oldItems) {
	                commonDao.delete(new GroceryItems(), String.valueOf(giOld.getSno()));
	            }
	            // --- 4. Update master record ---
	            gd.setPo_number(groceryDetails.getPo_number());
	            gd.setPo_date(groceryDetails.getPo_date());
	            gd.setCategory_name(groceryDetails.getCategory_name());
	            gd.setPurchase_for(groceryDetails.getPurchase_for());
	            gd.setTotal_qty(groceryDetails.getTotal_qty());
	            gd.setTaxable_amount(groceryDetails.getTaxable_amount());
	            gd.setTotal_gst(groceryDetails.getTotal_gst());
	            gd.setTotal_tax(groceryDetails.getTotal_tax());
	            gd.setGrand_total(groceryDetails.getGrand_total());

	            commonDao.updateDataToDb(gd);

	            // --- 5. Insert new items + update stock (mirrors INSERT logic) ---
	            List<GroceryItems> newItems = groceryDetails.getGi();

	            if (groceryDetails.getCategory_name().equalsIgnoreCase("Grocery")) {
	                for (GroceryItems g : newItems) {
	                    g.setGid(gd.getSno());
	                    commonDao.addDataToDb(g);
	                }
	            } else {
	                for (GroceryItems g : newItems) {
	                    g.setGid(gd.getSno());
	                    commonDao.addDataToDb(g);

	                    Map<String, Object> mm = new HashMap<>();
	                    mm.put("item_id", g.getItem_id());
	                    mm.put("purchase_for", groceryDetails.getPurchase_for());
	                    List<StockEntry> dat = (List<StockEntry>) commonDao.getDataByMap(
	                            mm, new StockEntry(), null, null, 0, -1
	                    );
	                    if (dat.size() > 0) {
	                        StockEntry se = dat.get(0);
	                        se.setQty(se.getQty() + g.getQty());
	                        se.setRem_qty(se.getRem_qty() + g.getQty());
	                        se.setLas_qty(g.getQty());
	                        commonDao.updateDataToDb(se);
	                    } else {
	                        StockEntry se = new StockEntry();
	                        se.setItem_id(g.getItem_id());
	                        se.setQty(g.getQty());
	                        se.setRem_qty(g.getQty());
	                        se.setLas_qty(g.getQty());
	                        se.setPurchase_for(groceryDetails.getPurchase_for());
	                        commonDao.addDataToDb(se);
	                    }
	                }
	            }

	            response.put("status", "Success");
	            response.put("message", "Purchase Details Updated Successfully");

	        } else {
	        	// ===== INSERT CASE =====

	            Map<String, Object> map = new HashMap<>();
	            map.put("po_number", groceryDetails.getPo_number());
	            List<GroceryDetails> data = (List<GroceryDetails>) commonDao.getDataByMap(map, new GroceryDetails(), null, null, 0, -1
	            );

	            if (data.size() > 0) {
	                response.put("status", "Already_Exist");
	                response.put("message", "PO Number Already Exist");
	            } else {
	                groceryDetails.setCreatedAt(new Date());

	                int i = commonDao.addDataToDb(groceryDetails);

	                if (i > 0) {
	                    List<GroceryItems> gi = groceryDetails.getGi();
	                   
	                    if(groceryDetails.getCategory_name().equalsIgnoreCase("Grocery")) {
	                    	 for (GroceryItems g : gi) {
	 	                        g.setGid(i);   // link items to master id
	 	                        commonDao.addDataToDb(g);
	 	                    }
	                    }else {
	                    	 for (GroceryItems g : gi) {
	 	                        g.setGid(i);   // link items to master id
	 	                        commonDao.addDataToDb(g);
	 	                        Map<String, Object> mm = new HashMap<String, Object>();
	 	                        mm.put("item_id", g.getItem_id());
	 	                        mm.put("purchase_for", groceryDetails.getPurchase_for());
	 	                        List<StockEntry> dat = (List<StockEntry>)commonDao.getDataByMap(mm, new StockEntry(), null, null, 0, -1);
	 	                        if(dat.size() > 0) {
	 	                        	float tqty =dat.get(0).getQty()+ g.getQty();
	 	                        	float rqty =dat.get(0).getRem_qty()+ g.getQty();
	 	                        	dat.get(0).setQty(tqty);
	 	                        	dat.get(0).setRem_qty(rqty);
	 	                        	dat.get(0).setLas_qty(g.getQty());
	 	                        	commonDao.updateDataToDb(dat.get(0));
	 	                        }else {
	 	                        	StockEntry se = new StockEntry();
	 	                        	se.setItem_id(g.getItem_id());
	 	                        	se.setQty(g.getQty());
	 	                        	se.setRem_qty(g.getQty());
	 	                        	se.setLas_qty(g.getQty());
	 	                        	se.setPurchase_for(groceryDetails.getPurchase_for());
	 	                        	commonDao.addDataToDb(se);
	 	                        }
	 	                    }
	                    }
	                    response.put("status", "Success");
	                    response.put("message", "Purchase Details Added Successfully");
	                } else {
	                    response.put("status", "Failed");
	                    response.put("message", "Something went wrong");
	                }
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Error");
	        response.put("message", "Internal server error: " + e.getMessage());
	    }
	    return response;
	}

	

	public Map<String, Object> get_groceries(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("po_number", search);
				or_map.put("purchase_for", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<GroceryDetails> list = (List<GroceryDetails>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new GroceryDetails(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new GroceryDetails(), "sno", "asc");
			if(list.size()>0) {
				for(GroceryDetails p : list) {
	        		Map<String, Object> mp = new HashMap<String, Object>();
		        	mp.put("sno", p.getVid());
		        	List<Vendor> v = (List<Vendor>)commonDao.getDataByMap(mp, new Vendor(), null, null, 0, -1);
		        	p.setVendor_name(v.get(0).getVendor_code()+"/"+v.get(0).getVendor_name());
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

	public Map<String, Object> get_grocery_items(int start, int length, String search, String sno) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();		
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("gid", Integer.parseInt(sno));
			List<GroceryItems> list = (List<GroceryItems>) commonDao.getDataByMapSearchAnd(map,or_map, new GroceryItems(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(map, or_map, new GroceryItems(), "sno", "asc");
			if(list.size()>0) {
				for(GroceryItems p : list) {
	        		Map<String, Object> mp = new HashMap<String, Object>();
		        	mp.put("sno", p.getGid());
		        	List<Items> v = (List<Items>)commonDao.getDataByMap(mp, new Items(), null, null, 0, -1);
		        	p.setItem_name(v.get(0).getItem_name());
		        	p.setHsn_code(v.get(0).getHsn_code());
		        	p.setUnit(v.get(0).getUnit());
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

	public Map<String, Object> get_stock(int start, int length, String search) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			Map<String,Object> or_map = new HashMap<String, Object>();
			if(search != null && !search.isEmpty()) {
				or_map.put("purchase_for", search);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			List<StockEntry> list = (List<StockEntry>) commonDao.getDataByMapSearchAnd(new HashMap<String,Object>(),or_map, new StockEntry(), "sno", "asc", start, length);	
			int count = commonDao.getDataByMapSearchAndSize(new HashMap<String,Object>(), or_map, new StockEntry(), "sno", "asc");
			if(list.size()>0) {
				for(StockEntry p : list) {
	        		Map<String, Object> mp = new HashMap<String, Object>();
		        	mp.put("sno", p.getItem_id());
		        	List<Items> v = (List<Items>)commonDao.getDataByMap(mp, new Items(), null, null, 0, -1);
		        	p.setItem_name(v.get(0).getItem_name());
		        	p.setUnit(v.get(0).getUnit());
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
}
