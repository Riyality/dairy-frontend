package com.dairy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dairy.service.MilkRateService;

@Controller
@RequestMapping( "/milkRate" )
public class MilkRateController {
	
	@Autowired
	private MilkRateService milkRateService;
	

	@GetMapping("/type/{type}/fat/{fat}/snf/{snf}")
	@ResponseBody
	public ResponseEntity<Float> getMilkRateByFatAndSNF(@PathVariable String type, @PathVariable float fat, @PathVariable float snf, HttpSession session) {
	    try {
	        int branchId = (int) session.getAttribute("branchId");
	        Float milkRate = milkRateService.getMilkRateByTypeAndFatAndSNF(type,fat,snf,branchId);
	        return new ResponseEntity<Float>(milkRate, HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}

}
