package com.dairy.controller;
import java.io.IOException;
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
    public void generatePdf(HttpServletResponse response,  @RequestParam String farmerId,@RequestParam String fromDate,@RequestParam String toDate) {
        
        try {
           
           response.setContentType("application/pdf"); // Set the response content type
           int FarmerId = Integer.parseInt(farmerId);  
           List<MilkCollectionResponseDto> list = milkCollectionService.getRecordsByFarmerId((long) FarmerId);
           response.setHeader("Content-Disposition", "inline; filename=invoice_" + fromDate + "_to_" + toDate + ".pdf");
            pdfGenerationService.generatePdf(response.getOutputStream(), list,fromDate,toDate);  // Generate the PDF directly to the response output stream
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

