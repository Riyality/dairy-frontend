package com.dairy.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.dairy.service.BonusPdfService;
import com.dairy.service.MilkCollectionService;

@Controller
public class BonusPdfController {

	@Autowired
	MilkCollectionService milkCollectionService;

	@Autowired
	BonusPdfService bonusPdfService;

	@GetMapping("/generatePdfBonus")
	public void generateBonusPdf(HttpServletResponse response, @RequestParam String fromDate,
			@RequestParam String toDate, @RequestParam String bonusAmountPerLiter, @RequestParam String milkType,
			@RequestParam("encodedFarmerIds") List<String> encodedFarmerIds) {

		try {
			
			
			 SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		        Date parsedFromDate = inputDateFormat.parse(fromDate);
		        Date parsedToDate = inputDateFormat.parse(toDate);
			
			response.setContentType("application/pdf");
			

			 List<MilkCollectionResponseDto> list = milkCollectionService.findByFromDateAndToDateAndAnimalType(parsedFromDate, parsedToDate, milkType);

			response.setHeader("Content-Disposition", "inline; filename=invoice.pdf");

			float bonusPerLiter = Float.parseFloat(bonusAmountPerLiter);

			bonusPdfService.generatePdf(response.getOutputStream(), list, fromDate, toDate, encodedFarmerIds,milkType,bonusPerLiter);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}