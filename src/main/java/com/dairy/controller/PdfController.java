package com.dairy.controller;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dairy.service.PdfGenerationService;

@Controller
public class PdfController {

    @ Autowired
    private PdfGenerationService pdfGenerationService;

    @GetMapping( "/add-invoice-page" )
	public String addInvoicePage() {
		return "Invoice/invoice";
	}
    
    @GetMapping("/generatePdf")
    @ResponseBody
    public void generatePdf( HttpServletResponse response) {
        try {
            // Set the response content type
            response.setContentType("application/pdf");

            // Set the content disposition to inline, so the browser displays the PDF
            response.setHeader("Content-Disposition", "inline; filename=invoice.pdf");

            // Generate the PDF directly to the response output stream
            pdfGenerationService.generatePdf( response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

