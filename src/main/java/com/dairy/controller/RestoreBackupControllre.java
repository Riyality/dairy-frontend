package com.dairy.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dairy.DBbackup.RestoreDBBackupHelper;
import com.dairy.DBbackup.RestoreService;
import com.dairy.constants.MessageConstants;

@Controller
@RequestMapping("/restore")
public class RestoreBackupControllre {
	
	@Autowired
	RestoreService restoreService;
	
	 @PostMapping("/product/upload")
	    public String upload(@RequestParam("file") MultipartFile file ,RedirectAttributes ra) {
	        if (RestoreDBBackupHelper.checkExcelFormat(file)) {
	            //true
	        	this.restoreService.saveBranch(file);
	        	this.restoreService.saveRoute(file);
	            this.restoreService.saveFarmer(file);
	            this.restoreService.saveFeedCompany(file);

	            ra.addFlashAttribute("successMessage",MessageConstants.DATA_RESTORE);
	            return "DBBackup/TakeBackup";
	            

	        }
	        ra.addFlashAttribute("errorMessage", MessageConstants.PLEASE_UPLOAD_EXCEL_FILE);
	        return "DBBackup/TakeBackup";
	    }
	

}
