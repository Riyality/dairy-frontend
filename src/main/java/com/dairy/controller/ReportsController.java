package com.dairy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.service.FarmerService;
import com.dairy.service.FeedCompanyService;

@RequestMapping( "/reports" )
@Controller
public class ReportsController {
	@Autowired
	FarmerService farmerService;
	@Autowired
	FeedCompanyService feedCompanyService;
	
	@GetMapping( "/add-milkcollectionReport-page" )
	public String addMilkCollectionDatewisePage(HttpSession session, Model model) {
		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);
		return "reports/milkCollectionReport";
	}

	@GetMapping( "/add-paymetReport-page" )
	public String addPaymentReportPage(HttpSession session, Model model) {
		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);
		return "reports/paymentReport";
	}

	@GetMapping( "/add-feedReport-page" )
	public String addFeedReportPage(HttpSession session, Model model) {
		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);
		List<FeedCompanyResponseDto> list1 = feedCompanyService.getAllFeedCompany(branchId);
		model.addAttribute("feedCompanyList", list1);
		return "reports/feedReport";
	}
	@GetMapping( "/add-advanceReport-page" )
	public String addAdvanceReportPage(HttpSession session, Model model) {
		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);
		List<FeedCompanyResponseDto> list1 = feedCompanyService.getAllFeedCompany(branchId);
		model.addAttribute("feedCompanyList", list1);
		return "reports/advanceReport";
	}
	
}
