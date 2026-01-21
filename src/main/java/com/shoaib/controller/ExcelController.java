package com.shoaib.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoaib.dao.CommonDao;
import com.shoaib.modal.ManualBooking;
import com.shoaib.modal.PackagePlan;
import com.shoaib.modal.Rooms;

@Controller
public class ExcelController {

	@Autowired
	CommonDao commonDao;

	@RequestMapping("/export_booking_register")
	public void export_All_sale_register(@RequestParam String from_date, @RequestParam String to_date,
			HttpServletResponse response, HttpSession session) throws IOException {

		String file_name = "Booking_Register(" + from_date + "_To_" + to_date + ")";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate start = LocalDate.parse(from_date, formatter);
		LocalDate end = LocalDate.parse(to_date, formatter);

		List<String> months = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		List<ManualBooking> data = (List<ManualBooking>) commonDao.getDataByMap(map, new ManualBooking(),
				"booking_date", "desc", 0, -1);

		if (data.size() > 0) {
			for (ManualBooking m : data) {
//				Map<String, Object> map1 = new HashMap<>();
//				map1.put("sno", m.getRoom_id());
//				List<Rooms> rm = (List<Rooms>) commonDao.getDataByMap(map1, new Rooms(), null, null, 0, -1);
//				m.setRoom_title(rm.get(0).getTitle());

				Map<String, Object> map11 = new HashMap<>();
				map11.put("sno", m.getPlan_id());
				List<PackagePlan> rm1 = (List<PackagePlan>) commonDao.getDataByMap(map11, new PackagePlan(), null, null,
						0, -1);
				m.setPlan_name(rm1.get(0).getPlan_name());
			}

			SimpleDateFormat sdf = new SimpleDateFormat("MMMM yyyy", Locale.ENGLISH);
			List<String> distinctInvoiceMonths = data.stream().map(ManualBooking::getBooking_date)
					.filter(Objects::nonNull).map(sdf::format).distinct().sorted().collect(Collectors.toList());
			months.addAll(distinctInvoiceMonths);
		}

		XSSFWorkbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Booking Register");

		// ====== STYLES ======
		Font boldFont = workbook.createFont();
		boldFont.setBold(true);

		CellStyle titleStyle = workbook.createCellStyle();
		titleStyle.setFont(boldFont);
		titleStyle.setAlignment(HorizontalAlignment.CENTER);

		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setFont(boldFont);
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		headerStyle.setWrapText(true);
		headerStyle.setBorderTop(BorderStyle.THIN);
		headerStyle.setBorderBottom(BorderStyle.THIN);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);

		CellStyle dataStyle = workbook.createCellStyle();
		dataStyle.setBorderTop(BorderStyle.THIN);
		dataStyle.setBorderBottom(BorderStyle.THIN);
		dataStyle.setBorderLeft(BorderStyle.THIN);
		dataStyle.setBorderRight(BorderStyle.THIN);
		dataStyle.setWrapText(true);
		dataStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		CellStyle monthStyle = workbook.createCellStyle();
		monthStyle.setFont(boldFont);

		CellStyle totalStyle = workbook.createCellStyle();
		totalStyle.setFont(boldFont);
		totalStyle.setBorderTop(BorderStyle.THICK);
		totalStyle.setBorderBottom(BorderStyle.THICK);
		totalStyle.setBorderLeft(BorderStyle.THIN);
		totalStyle.setBorderRight(BorderStyle.THIN);
		totalStyle.setAlignment(HorizontalAlignment.LEFT); // TOTAL label left

		CellStyle totalRightStyle = workbook.createCellStyle();
		totalRightStyle.cloneStyleFrom(totalStyle);
		totalRightStyle.setAlignment(HorizontalAlignment.RIGHT); // totals right

		int rowIndex = 0;
		DateTimeFormatter inputFmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter outputFmt = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String formattedFromDate = LocalDate.parse(from_date, inputFmt).format(outputFmt);
		String formattedToDate = LocalDate.parse(to_date, inputFmt).format(outputFmt);

		// ====== HEADER ======
		Row companyRow = sheet.createRow(rowIndex++);
		Cell companyCell = companyRow.createCell(0);
		companyCell.setCellValue("DREAM VIEW HERITAGE RESORT, MADHAI");
		companyCell.setCellStyle(titleStyle);
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 13));

		Row titleRow = sheet.createRow(rowIndex++);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("BOOKING - REGISTER");
		titleCell.setCellStyle(titleStyle);
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 13));

		Row dateRow = sheet.createRow(rowIndex++);
		Cell dateCell = dateRow.createCell(0);
		dateCell.setCellValue("From " + formattedFromDate + " To " + formattedToDate);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 13));

		rowIndex++;

		String[] headers1 = { "S.No.", "Customer Name","City", "Mobile Number", "Room Name", "Check-in Date", "Check-out Date",
				"Night", "Room Nos", "E-Bed", "Rent/Night", "E-Bed Charge/Night", "Guest", "Total Room Charge",
				"Total E-Bed Charge", "Taxable Amount", "GST(%)", "GST Amount", "Total Amount", "Plan Name",
				"Plan Price", "Final Price", "Net Amount", "Advance Amount", "Balance Amount" };

		for (int mi = 0; mi < months.size(); mi++) {
			// ====== MONTH HEADING ======
			Row monthRow = sheet.createRow(rowIndex++);
			Cell monthCell = monthRow.createCell(0);
			monthCell.setCellValue(months.get(mi));
			monthCell.setCellStyle(monthStyle);

			// ====== TABLE HEADER ======
			Row headerRow = sheet.createRow(rowIndex++);
			for (int j = 0; j < headers1.length; j++) {
				Cell cell = headerRow.createCell(j);
				cell.setCellValue(headers1[j]);
				cell.setCellStyle(headerStyle);
			}

			int count = 1;
			float trc = 0, tbc = 0, ta = 0, rga = 0, rta = 0, ptga = 0, pfp = 0, net = 0, adv = 0, bal = 0;

			for (ManualBooking p : data) {
				Date createdAt = p.getBooking_date();
				LocalDate createdLocal = (createdAt instanceof java.sql.Date)
						? ((java.sql.Date) createdAt).toLocalDate()
						: createdAt.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

				String createdMonthYear = createdLocal.format(DateTimeFormatter.ofPattern("MMMM yyyy")).toUpperCase();

				if (months.get(mi).equalsIgnoreCase(createdMonthYear)) {
					float tpgst = p.getTotal_price() * p.getBed_gst() / 100;
					float tgst = p.getTaxable_amount() * p.getRoom_gst() / 100;

					trc += p.getTotal_room_charge();
					tbc += p.getTotal_bed_charge();
					ta += p.getTaxable_amount();
					rga += tgst;
					rta += p.getTotal_amount();
					ptga += tpgst;
					pfp += p.getTotal_price();
					net += p.getNet_amount();
					adv += p.getAdvance_amount();
					bal += p.getBalance_amount();
					
					String[] rm = p.getRoom_title().split("@@@");
					String room = "";
					for(int r=0; r< rm.length; r++){
						if(r== 0){
							room = rm[r];
						}else{
							room += "\n"+rm[r];
						}
					}

					Object[] rowData = { count++, p.getName(),p.getCity(), p.getMobile_number(), room,
							p.getBooking_date(), p.getCheck_date(), p.getNight(), p.getRoom_number(), p.getExtrabed(),
							p.getRoom_charge(), p.getBed_charge(), p.getAdult() + " Adult " + p.getChild() + " Child",
							p.getTotal_room_charge(), p.getTotal_bed_charge(), p.getTaxable_amount(), p.getRoom_gst(),
							String.format("%.2f", tgst), p.getTotal_amount(), p.getPlan_name(), p.getFinal_price(), p.getTotal_price(),
							p.getNet_amount(),
							p.getAdvance_amount(),
							p.getBalance_amount()
							};

					Row row = sheet.createRow(rowIndex++);
					for (int i = 0; i < rowData.length; i++) {
						Cell cell = row.createCell(i);
						if (rowData[i] instanceof Number) {
							cell.setCellValue(((Number) rowData[i]).doubleValue());
						} else {
							cell.setCellValue(rowData[i].toString());
						}
						cell.setCellStyle(dataStyle);
					}
				}
			}

			// ====== TOTAL ROW ======
			Row totalRow = sheet.createRow(rowIndex++);
			Cell totalLabel = totalRow.createCell(0);
			totalLabel.setCellValue("TOTAL :");
			totalLabel.setCellStyle(totalStyle);
			sheet.addMergedRegion(new CellRangeAddress(rowIndex - 1, rowIndex - 1, 0, 12));

			// Fill blank cells before totals
			for (int c = 1; c <= 11; c++) {
			    Cell blankCell = totalRow.createCell(c);
			    blankCell.setCellStyle(totalStyle);
			}

			// Totals start after column index 11 (i.e., column 12)
			int col = 13;

			Cell totalRoomChargeCell = totalRow.createCell(col++);
			totalRoomChargeCell.setCellValue(String.format("%.2f", trc));
			totalRoomChargeCell.setCellStyle(totalStyle);

			Cell totalBedChargeCell = totalRow.createCell(col++);
			totalBedChargeCell.setCellValue(String.format("%.2f", tbc));
			totalBedChargeCell.setCellStyle(totalStyle);

			Cell taxableAmountCell = totalRow.createCell(col++);
			taxableAmountCell.setCellValue(String.format("%.2f", ta));
			taxableAmountCell.setCellStyle(totalStyle);

			Cell planNameCell21 = totalRow.createCell(col++);
			planNameCell21.setCellValue("");
			planNameCell21.setCellStyle(totalStyle);
			
			Cell gstAmountCell = totalRow.createCell(col++);
			gstAmountCell.setCellValue(String.format("%.2f", rga));
			gstAmountCell.setCellStyle(totalStyle);

			Cell totalAmountCell = totalRow.createCell(col++);
			totalAmountCell.setCellValue(String.format("%.2f", rta));
			totalAmountCell.setCellStyle(totalStyle);

			
			Cell basePriceCel2l = totalRow.createCell(col++);
			basePriceCel2l.setCellValue("");
			basePriceCel2l.setCellStyle(totalStyle);
			
			Cell basePriceCel3l = totalRow.createCell(col++);
			basePriceCel3l.setCellValue("");
			basePriceCel3l.setCellStyle(totalStyle);

			Cell finalPriceCell = totalRow.createCell(col++);
			finalPriceCell.setCellValue(String.format("%.2f", pfp));
			finalPriceCell.setCellStyle(totalStyle);

			Cell netAmountCell = totalRow.createCell(col++);
			netAmountCell.setCellValue(String.format("%.2f", net));
			netAmountCell.setCellStyle(totalStyle);
			Cell netAmountCell1 = totalRow.createCell(col++);
			netAmountCell1.setCellValue(String.format("%.2f", adv));
			netAmountCell1.setCellStyle(totalStyle);
			Cell netAmountCell11 = totalRow.createCell(col++);
			netAmountCell11.setCellValue(String.format("%.2f", bal));
			netAmountCell11.setCellStyle(totalStyle);

			// Fill any remaining columns to keep alignment consistent
			while (col < headers1.length) {
			    Cell blank = totalRow.createCell(col++);
			    blank.setCellStyle(totalStyle);
			}
		}
		// ====== AUTO-FIT COLUMNS ======
		for (int i = 0; i < headers1.length; i++) {
			sheet.autoSizeColumn(i);
		}

		// ====== OUTPUT ======
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=" + file_name + ".xlsx");
		workbook.write(response.getOutputStream());
		workbook.close();
	}
}
