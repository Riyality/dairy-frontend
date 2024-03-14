package com.dairy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.milkRate.MilkRateRequestDto;
import com.dairy.service.MilkRateService;

@Controller
@RequestMapping( "/milkRate")
public class MilkRateController {
	
	@Autowired
	private MilkRateService milkRateService;
	
	
	@GetMapping( "/milkrate-page" )
	public String addMilkRatePage() {
		return "milkCollection/milkRateCalculate";
	}
	
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
	
	@PostMapping("/saveMilkRates")
	public String saveMilkRates(@RequestBody List<MilkRateRequestDto> milkRateDtoList, HttpSession session) {
	    try {
	        int branchId = (int) session.getAttribute("branchId");
	        if (branchId <= 0) {
	           
	            return "error"; // Or return an appropriate error view
	        }
	        for (MilkRateRequestDto milkRateDto : milkRateDtoList) {
	            milkRateDto.setBranchId(branchId);
	        }
	        
	        String result = milkRateService.saveMilkRates(milkRateDtoList);
	        if (result.equals(MessageConstants.ADD_MILK_RATE_SUCCESS_MESSAGE)) {
	            return "milkCollection/add";
	        } else {
	            return "milkCollection/milkRateCalculate";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	
}