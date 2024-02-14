package com.dairy.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.dairy.service.MilkCollectionService;
import com.dairy.service.InvoicePdfGenerationService;

@Controller
public class InvoicePdfController {

	
	@Autowired
	private MilkCollectionService milkCollectionService;	
    @ Autowired
    private InvoicePdfGenerationService pdfGenerationService;

    @GetMapping( "/add-invoice-page" )
	public String addInvoicePage() {
		return "Invoice/invoice";
	}
    
    @GetMapping("/generatePdf")
    @ResponseBody
    public void generatePdf(HttpServletResponse response,  @RequestParam List<String>  farmerId,@RequestParam String fromDate,@RequestParam String toDate,@RequestParam String animalType) {
    	
    	List<MilkCollectionResponseDto> list = new ArrayList<>();

		for (String encodedFarmerId : farmerId) {
			long farmerId1 = Long.parseLong(encodedFarmerId);
			list.addAll(milkCollectionService.getRecordsByFarmerIdFromDateAndToDateAndAnimalType(farmerId1,fromDate,toDate,animalType));
		}
	
        try {          
           response.setContentType("application/pdf"); // Set the response content type
           response.setHeader("Content-Disposition", "inline; filename=invoice_" + fromDate + "_to_" + toDate + ".pdf");
            pdfGenerationService.generatePdf(response.getOutputStream(), list,fromDate,toDate,farmerId);  // Generate the PDF directly to the response output stream
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

