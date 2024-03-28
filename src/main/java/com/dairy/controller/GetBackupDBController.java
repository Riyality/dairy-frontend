package com.dairy.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dairy.DBbackup.GetDBbackupHelper;

@Controller
@RequestMapping("/DBBackup")
public class GetBackupDBController {
	
	@Autowired
	GetDBbackupHelper getDBbackupHelper;

	@GetMapping("/page")
	public String DBBackupPage() {
		return "DBBackup/TakeBackup";
	}
	
	@GetMapping("/TakeExcel")
		public void generateExcelReport(HttpServletResponse response ,HttpSession session) throws Exception{
			
			response.setContentType("application/octet-stream");
			
			LocalDateTime currentDateTime = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss");
	        String formattedDateTime = currentDateTime.format(formatter);
			
			String headerKey = "Content-Disposition";
			String headerValue = "attachment;filename="+formattedDateTime+".xls";

			response.setHeader(headerKey, headerValue);
			
			getDBbackupHelper.generateExcel(response ,session);
			
			response.flushBuffer();
		}
		
}
