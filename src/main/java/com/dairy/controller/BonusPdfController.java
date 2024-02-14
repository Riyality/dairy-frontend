package com.dairy.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dairy.dto.bonusToFarmer.BonusToFarmerResponseDto;
import com.dairy.service.BonusPdfService;
import com.dairy.service.MilkCollectionService;

@Controller
public class BonusPdfController {

	@Autowired
	MilkCollectionService milkCollectionService;

	@Autowired
	BonusPdfService bonusPdfService;

	@GetMapping("/generatePdfBonus")
	public void generateBonusPdf(HttpServletResponse response,
			@RequestParam("encodedFarmerIds") List<String> encodedFarmerIds, HttpSession session) {

		try {

			response.setContentType("application/pdf");

			int branchId = (int) session.getAttribute("branchId");
			List<BonusToFarmerResponseDto> list = bonusPdfService.findAllBonusRecords(branchId);

			response.setHeader("Content-Disposition", "inline; filename=invoice.pdf");

			bonusPdfService.generatePdf(response.getOutputStream(), list, encodedFarmerIds);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}