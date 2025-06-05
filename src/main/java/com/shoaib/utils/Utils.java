package com.shoaib.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.shoaib.dao.CommonDao;



public class Utils {

	@Autowired
	CommonDao commonDao;
		public static String staticimages = "C:/temp/"; 
		//public static String staticimages = "/var/lib/tomcat9/webapps/uploads/";
		//public static String staticimages = "/opt/tomcat9/files/mpjungle_files/";
		public static String userkey = "CbddmBz6lmP2766";

		static DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		
		/* public static OkHttpClient httpClient= new OkHttpClient(); */

		public static String uploadImage(MultipartFile file) {
		String str = "";
		if (!file.isEmpty()) {
		str = file.getOriginalFilename();
		System.out.println(str);
		String[] str1 = str.split("\\.");
		int length=str1.length;
		str = str1[0] + dateFormat.format(new Date()) + "." + str1[length-1];
		str = str.trim();

		try {
		System.out.println(file.getBytes());
		byte[] bytes = file.getBytes();
		File serverFile = new File(Utils.staticimages + str);
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
		stream.write(bytes);
		stream.close();
		} catch (Exception e) {
			e.printStackTrace();
		System.out.println(e);
		}
		}
		return str;
		}
		
		// This method is used for generating password
			public static String generateRandomPassword(int len) {
				// ASCII range � alphanumeric (0-9, a-z, A-Z)
				final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

				SecureRandom random = new SecureRandom();
				StringBuilder sb = new StringBuilder();

				// each iteration of the loop randomly chooses a character from the given
				// ASCII range and appends it to the `StringBuilder` instance

				for (int i = 0; i < len; i++) {
					int randomIndex = random.nextInt(chars.length());
					sb.append(chars.charAt(randomIndex));
				}

				return sb.toString();
			}
			
			
			public static String generateUniqueId(int len) {
				// ASCII range � alphanumeric (0-9, a-z, A-Z)
				final String chars = "0123456789";

				SecureRandom random = new SecureRandom();
				StringBuilder sb = new StringBuilder();

				// each iteration of the loop randomly chooses a character from the given
				// ASCII range and appends it to the `StringBuilder` instance

				for (int i = 0; i < len; i++) {
					int randomIndex = random.nextInt(chars.length());
					sb.append(chars.charAt(randomIndex));
				}

				return sb.toString();
			}
			
			public static boolean deleteImage(String filePath) {
			    if (filePath == null || filePath.isEmpty()) {
			        System.out.println("Invalid file path");
			        return false;
			    }
			    File file = new File(Utils.staticimages + filePath);
			    if (file.exists()) {
			        boolean isDeleted = file.delete();
			        if (isDeleted) {
			            System.out.println("File successfully deleted: " + file.getAbsolutePath());
			        } else {
			            System.out.println("Failed to delete file: " + file.getAbsolutePath());
			        }
			        return isDeleted;
			    } else {
			        System.out.println("File not found: " + file.getAbsolutePath());
			        return false;
			    }
			}
			
}
