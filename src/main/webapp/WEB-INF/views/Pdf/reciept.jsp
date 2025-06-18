<%@page import="com.shoaib.modal.PackagePlan"%>
<%@page import="com.shoaib.modal.Booking"%>
<%@page import="com.itextpdf.text.html.WebColors"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.itextpdf.text.Image"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import=" java.lang.Math"%>
<%@page import=" java.time.LocalDate"%>
<%@page import="com.itextpdf.text.ListItem"%>
<%-- <%@page import="com.itextpdf.text.List"%> --%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.pdf.draw.LineSeparator"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.DataOutput"%>
<%@page import="org.apache.commons.io.output.ByteArrayOutputStream"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%

DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

response.setContentType("application/pdf");
Document document = new Document();
Font fontbold = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD);
Font fontnormal = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL);
Font fontnormalhead = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
Font fontnormalhead1 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
Font fontnormalhead2 = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD);
Font fontnormal1 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL);
Font fontnormalheadd = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
Font fontnormalheaddd = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL);
Font fontboldheaddd = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL);
fontnormalheadd.setColor(BaseColor.BLUE);
fontnormal1.setColor(BaseColor.BLACK);

fontnormalhead2.setColor(BaseColor.BLACK);
fontnormalheaddd.setColor(BaseColor.BLACK);
fontboldheaddd.setColor(BaseColor.BLACK);
BaseColor myColor = WebColors.getRGBColor("#bdbdbd");
BaseColor myColor1 = WebColors.getRGBColor("#00515D");
fontnormalhead1.setColor(myColor1);

List<Booking> book = (List<Booking>)request.getAttribute("book");
List<PackagePlan> pack = (List<PackagePlan>)request.getAttribute("pack");

try {
	ByteArrayOutputStream buffer = new ByteArrayOutputStream();
	PdfWriter.getInstance(document, buffer);
	document.open();

	// Creating an ImageData object       

	PdfPTable table = new PdfPTable(1);
	Phrase phrase = new Phrase();
	PdfPCell cell = new PdfPCell(phrase);

	document.add(table);
	
	
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	Image image = Image.getInstance("https://dreamviewresortmadhai.com/assets/img/1723011694.png"); // Replace with the path to your image file
	image.scaleAbsolute(65, 70);
	float desiredWidth = 142; // set your desired width
	float desiredHeight = 46; // set your desired height
	image.scaleAbsolute(desiredWidth, desiredHeight);
	phrase = new Phrase();
	phrase.add(new Chunk("", fontnormalhead1));
	phrase.add(new Chunk(image, 0, 0, true)); // Add the image to the phrase
	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(0);
	cell.setPaddingLeft(20);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	phrase = new Phrase();
	phrase.add(new Chunk("Address: Infront MPT Bison Village – Sarangpur, Sohagpur Madhai, Contact Number: +919329197477, +919098753337    Email: info.dreamviewheritage@gmail.com ", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(0);
	cell.setPaddingLeft(5);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
	/* cell.setBorderColorBottom(BaseColor.BLACK); // Set border color
	cell.setBorderWidthBottom(1f); // Set border width */
	table.addCell(cell);
	document.add(table);

	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	phrase = new Phrase();
	phrase.add(new Chunk(book.get(0).getTitle(), fontnormalhead2));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(30);
	cell.setPaddingBottom(5); // Add padding at the bottom to create the appearance of a border
	cell.setPaddingLeft(5);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(6);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	cell.setBorderColorBottom(BaseColor.BLACK); 
	cell.setBorderWidthBottom(1f); // Set border width
	cell.setBorder(PdfPCell.BOTTOM);
	table.addCell(cell);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Booking ID: "+book.get(0).getBooking_id(), fontnormalhead));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(30);
	cell.setPaddingBottom(0); // Add padding at the bottom to create the appearance of a border
	cell.setPaddingLeft(5);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(6);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);

	// Set a styled border at the bottom of the cell
	cell.setBorderColorBottom(BaseColor.BLACK); // Set border color
	cell.setBorderWidthBottom(1f); // Set border width
	cell.setBorder(PdfPCell.BOTTOM);
	table.addCell(cell);

	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	phrase = new Phrase();
	phrase.add(new Chunk("BOOKING DETAILS", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(5);
	cell.setPaddingLeft(0);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(6);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Guest Details", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(5);
	cell.setPaddingLeft(0);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(6);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Check-in", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(5);
	cell.setPaddingBottom(5);
	cell.setColspan(2);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	phrase = new Phrase();

	phrase.add(new Chunk(book.get(0).getCheck_in()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(4);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	
	phrase = new Phrase();
	phrase.add(new Chunk("Name", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	phrase = new Phrase();
	phrase.add(new Chunk(book.get(0).getName()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Check-out", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(2);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	phrase = new Phrase();

	phrase.add(new Chunk(book.get(0).getCheck_out()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(4);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	
	phrase = new Phrase();
	phrase.add(new Chunk("Email", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	phrase = new Phrase();
	phrase.add(new Chunk(book.get(0).getEmail()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Guest", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(2);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	phrase = new Phrase();

	phrase.add(new Chunk(book.get(0).getAdult()+" Adults, "+book.get(0).getChild()+" Children", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(4);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	
	phrase = new Phrase();
	phrase.add(new Chunk("Mobile Number", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk(book.get(0).getMobile_number()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	
	if(pack != null && pack.size() > 0){
		table = new PdfPTable(12);
		table.setWidthPercentage(100);
		
		phrase = new Phrase();
		phrase.add(new Chunk("PACKAGE PLAN", fontbold));

		cell = new PdfPCell(phrase);
		cell.setPaddingTop(5);
		cell.setPaddingBottom(5);
		cell.setColspan(12);
		cell.setBorder(PdfPCell.NO_BORDER);
		/* cell.setBorderWidthLeft(1.0f);
		cell.setBorderWidthRight(1.0f); */
		cell.setBorderWidthBottom(1.0f);
		cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
		table.addCell(cell);
		document.add(table);
		
		table = new PdfPTable(12);
		table.setWidthPercentage(100);
		
		phrase = new Phrase();
		phrase.add(new Chunk("Plan", fontbold));

		cell = new PdfPCell(phrase);
		cell.setPaddingTop(5);
		cell.setPaddingBottom(5);
		cell.setColspan(6);
		cell.setBorder(PdfPCell.NO_BORDER);
		//cell.setBorderWidthTop(1.0f);
		cell.setBorderWidthLeft(1.0f);
		cell.setBorderWidthRight(1.0f);
		cell.setBorderWidthBottom(1.0f);
		cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
		table.addCell(cell);
		
		phrase = new Phrase();
		phrase.add(new Chunk("Price", fontbold));

		cell = new PdfPCell(phrase);
		cell.setPaddingTop(5);
		cell.setPaddingBottom(5);
		cell.setColspan(6);
		cell.setBorder(PdfPCell.NO_BORDER);
		//cell.setBorderWidthTop(1.0f);
		//cell.setBorderWidthLeft(1.0f);
		cell.setBorderWidthRight(1.0f);
		cell.setBorderWidthBottom(1.0f);
		cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
		table.addCell(cell);
		
		document.add(table);
		
		for(PackagePlan p : pack){
		
		table = new PdfPTable(12);
		table.setWidthPercentage(100);
		
		phrase = new Phrase();
		phrase.add(new Chunk(""+p.getPlan_name(), fontbold));

		cell = new PdfPCell(phrase);
		cell.setPaddingTop(5);
		cell.setPaddingBottom(5);
		cell.setColspan(6);
		cell.setBorder(PdfPCell.NO_BORDER);
		//cell.setBorderWidthTop(1.0f);
		cell.setBorderWidthLeft(1.0f);
		cell.setBorderWidthRight(1.0f);
		cell.setBorderWidthBottom(1.0f);
		cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
		table.addCell(cell);
		
		phrase = new Phrase();
		phrase.add(new Chunk("RS "+p.getFinal_price(), fontbold));

		cell = new PdfPCell(phrase);
		cell.setPaddingTop(10);
		cell.setPaddingBottom(5);
		cell.setColspan(6);
		cell.setBorder(PdfPCell.NO_BORDER);
		//cell.setBorderWidthTop(1.0f);
		//cell.setBorderWidthLeft(1.0f);
		cell.setBorderWidthRight(1.0f);
		cell.setBorderWidthBottom(1.0f);
		cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
		table.addCell(cell);
		
		document.add(table);
		}
		}
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	phrase = new Phrase();
	phrase.add(new Chunk("PAYMENT DETAILS", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(5);
	cell.setPaddingLeft(5);
	cell.setPaddingLeft(0);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Payment Mode", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	phrase = new Phrase();

	phrase.add(new Chunk(book.get(0).getPayment_mode()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	
	phrase = new Phrase();
	phrase.add(new Chunk("Payment Status", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk(book.get(0).getPayment_status()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	
	phrase = new Phrase();
	phrase.add(new Chunk("Base Price", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(9);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk("RS "+book.get(0).getBase_price()+"/Night", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	//cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
	document.add(table);
	
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("No of Rooms", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(9);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk(book.get(0).getNo_of_rooms()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	//cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
	document.add(table);
	
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	
	phrase = new Phrase();
	phrase.add(new Chunk("No of Nights", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(9);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk(book.get(0).getNight()+"", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	//cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	
	phrase = new Phrase();
	phrase.add(new Chunk("Sub Total", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(9);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
 
	
 double b = book.get(0).getBase_price();
 int n = book.get(0).getNight();
 int r = book.get(0).getNo_of_rooms();
 double subt = b*n*r;
 

	phrase = new Phrase();
	phrase.add(new Chunk("RS "+subt, fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	//cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Discount", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(9);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk("RS "+book.get(0).getDiscount(), fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	//cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("GST Amount", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(9);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk("RS "+book.get(0).getGst_amount(), fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	//cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
	document.add(table);
	
	if(pack != null && pack.size() > 0){
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Package amount", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(9);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk("RS "+book.get(0).getPackage_amount(), fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	//cell.setBorderWidthLeft(1.0f);
	//cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
	document.add(table);
	
	}
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
		
	phrase = new Phrase();
	phrase.add(new Chunk("Payable Amount", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(9);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk("RS "+book.get(0).getTotal_amount(), fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	//cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Amount Paid", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	phrase = new Phrase();

	phrase.add(new Chunk("RS "+book.get(0).getPaid_amount(), fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	
	phrase = new Phrase();
	phrase.add(new Chunk("Amount Due", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);


	phrase = new Phrase();
	phrase.add(new Chunk("RS "+book.get(0).getDue_amount(), fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(5);
	cell.setColspan(12);
	cell.setBorder(PdfPCell.NO_BORDER);
	/* cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthBottom(1.0f); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("***Thank you for choosing us. We look forward to welcoming you!***", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(5);
	cell.setColspan(12);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
	table.addCell(cell);
	document.add(table);
	

	document.newPage();

	//New doc	

	/* NEW PAGE */

	
	/* NEW PAGE */
	
		
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	phrase = new Phrase();

	phrase.add(new Chunk("", fontnormal));
	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setColspan(3);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	//LocalDate newDate = date.plusMonths(1);
	//	emidate = newDate + "";
	//phrase.add(new Chunk(newDate + "", fontnormal));
	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setColspan(3);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	phrase = new Phrase();

	phrase.add(new Chunk("", fontnormal));
	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setColspan(3);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	phrase.add(new Chunk("", fontnormal));
	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setColspan(3);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	phrase = new Phrase();
	phrase.add(new Chunk("", fontnormal));
	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setColspan(3);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	phrase = new Phrase();

	phrase.add(new Chunk("", fontnormal));
	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setColspan(3);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);

	phrase = new Phrase();
	phrase.add(new Chunk("", fontnormal));
	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setColspan(3);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.close();

	DataOutputStream dataOutput = new DataOutputStream(response.getOutputStream());
	byte[] bytes = buffer.toByteArray();
	response.setContentLength(bytes.length);
	for (int i = 0; i < bytes.length; i++) {
		dataOutput.writeByte(bytes[i]);
	}
	dataOutput.flush();
	dataOutput.close();
	return;

} catch (DocumentException e) {

	e.printStackTrace();
}
/* } */
%>
