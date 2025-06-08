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

	phrase = new Phrase();
	phrase.add(new Chunk("HOTEL BOOKING DETAILS", fontnormalhead1));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(-10);
	cell.setPaddingBottom(0);
	cell.setPaddingLeft(5);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
	table.addCell(cell);
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
	phrase.add(new Chunk("Shoaib Jamal", fontnormalhead2));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(30);
	cell.setPaddingBottom(5); // Add padding at the bottom to create the appearance of a border
	cell.setPaddingLeft(5);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(6);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);

	// Set a styled border at the bottom of the cell
	cell.setBorderColorBottom(BaseColor.BLACK); // Set border color
	cell.setBorderWidthBottom(1f); // Set border width
	cell.setBorder(PdfPCell.BOTTOM);
	table.addCell(cell);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Booking ID: Booning101", fontnormalhead));

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
	phrase.add(new Chunk("BOOKING DETAILS", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(5);
	cell.setPaddingLeft(0);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Hotel Name", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(5);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	phrase = new Phrase();

	phrase.add(new Chunk("Resort Name", fontnormal));

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
	phrase.add(new Chunk("Arrival Date", fontbold));

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
	phrase.add(new Chunk("2025-07-05", fontnormal));

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
	phrase.add(new Chunk("Rooms", fontbold));

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

	phrase.add(new Chunk("5", fontnormal));

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
	phrase.add(new Chunk("Departure Date", fontbold));

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
	phrase.add(new Chunk("2025-06-05", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Room Type", fontbold));

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

	phrase.add(new Chunk("Acc", fontnormal));

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
	phrase.add(new Chunk("Travellers", fontbold));

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
	phrase.add(new Chunk("2", fontnormal));

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
	phrase.add(new Chunk("Inclussion", fontbold));

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

	phrase.add(new Chunk("amenities", fontnormal));

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
	phrase.add(new Chunk("", fontbold));

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
	phrase.add(new Chunk("", fontnormal));

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
	phrase.add(new Chunk("TOURIST DETAILS", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(10);
	cell.setPaddingBottom(5);
	cell.setPaddingLeft(0);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Sno", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setBackgroundColor(myColor);
	cell.setColspan(1);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
	table.addCell(cell);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Primary Guest Name ", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(4);
	cell.setPaddingBottom(5);
	cell.setBackgroundColor(myColor);
	cell.setColspan(11);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthTop(1.0f);
	cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	
	document.add(table);
	
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("1", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(1);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
	table.addCell(cell);
	
	phrase = new Phrase();

	phrase.add(new Chunk("Shh", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(11);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthBottom(1.0f);
	/* cell.setBackgroundColor(BaseColor.BLACK);
	/* cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT); */
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	
	
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	phrase = new Phrase();
	phrase.add(new Chunk("PAYMENT DETAILS", fontnormal));

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
	phrase.add(new Chunk("Booking Date", fontbold));

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

	phrase.add(new Chunk("2025-25-01", fontnormal));

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
	phrase.add(new Chunk("Payment Date", fontbold));

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
	phrase.add(new Chunk("2025", fontnormal));

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
	phrase.add(new Chunk("Transaction ID", fontbold));

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

	phrase.add(new Chunk("1254556655", fontnormal));

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
	phrase.add(new Chunk("Email ID", fontbold));

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
	phrase.add(new Chunk("@gmail.com", fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(3);
	cell.setPaddingBottom(5);
	cell.setColspan(3);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setBorderWidthRight(1.0f);
	cell.setBorderWidthLeft(1.0f);
	cell.setBorderWidthBottom(1.0f);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	table = new PdfPTable(12);
	table.setWidthPercentage(100);
	
	phrase = new Phrase();
	phrase.add(new Chunk("Reservration Fee", fontbold));

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

	phrase.add(new Chunk("4500", fontnormal));

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
	phrase.add(new Chunk("Contact No", fontbold));

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
	phrase.add(new Chunk("8298108066", fontnormal));

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
	phrase.add(new Chunk("Price Includes:", fontbold));

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
	
	
	String htl = "";
    String htdec = htl.replaceAll("\\<.*?\\>|&nbsp;", "");
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	phrase = new Phrase();
	phrase.add(new Chunk(""+htdec, fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(0);
	cell.setPaddingBottom(5);
	cell.setPaddingLeft(5);
	cell.setPaddingLeft(0);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	
	if(1 >0){
	
		String paymentPolicyHtml = "This is term and conditions";
	    String tc = paymentPolicyHtml.replaceAll("\\<.*?\\>|&nbsp;", "");
		
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	phrase = new Phrase();
	phrase.add(new Chunk("Terms & Condition:", fontbold));

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
	phrase.add(new Chunk(""+tc, fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(0);
	cell.setPaddingBottom(5);
	cell.setPaddingLeft(5);
	cell.setPaddingLeft(0);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	}
	
	/* if(terms.size() >0){
	table = new PdfPTable(12);
	table.setWidthPercentage(100);

	phrase = new Phrase();
	phrase.add(new Chunk("Payment Policy:", fontbold));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(0);
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
	String paymentPolicyHtml = policy.get(0).getPayment_policy();
    String paymentPolicyText = paymentPolicyHtml.replaceAll("\\<.*?\\>|&nbsp;", "");
	phrase = new Phrase();
	phrase.add(new Chunk(""+paymentPolicyText, fontnormal));

	cell = new PdfPCell(phrase);
	cell.setPaddingTop(0);
	cell.setPaddingBottom(5);
	cell.setPaddingLeft(5);
	cell.setPaddingLeft(0);
	cell.setBorder(PdfPCell.NO_BORDER);
	cell.setColspan(12);
	cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
	table.addCell(cell);
	document.add(table);
	} */
	
	

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
