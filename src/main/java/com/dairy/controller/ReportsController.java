package com.dairy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.service.FarmerService;


@RequestMapping( "/reports" )
@Controller
public class ReportsController {
	@Autowired
	FarmerService farmerService;
	
	@GetMapping( "/add-milkcollectionDatewise-page" )
	public String addMilkCollectionDatewisePage() {
		return "reports/milkCollectionDatewise";
	}

	@GetMapping( "/add-paymetReport-page" )
	public String addPaymentReportPage(HttpSession session, Model model) {
		
		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);
		return "reports/paymentReport";
	}

	
	
	@GetMapping( "/add-milkcollectionFarmerwise-page" )
	public String addMilkCollectionFarmerwisePage(HttpSession session, Model model) {
		
		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);
		return "reports/milkCollectionFarmerwise";
	}
	
	
}
