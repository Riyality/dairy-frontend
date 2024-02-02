package com.dairy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.dairy.service.MilkCollectionService;
@CrossOrigin(origins = "*")
@Controller
@RequestMapping("/paymentToFarmer")
public class PaymentToFarmerController {

	
	@Autowired
	private MilkCollectionService milkCollectionService;
	
	@GetMapping("/add-payment-page")
	public String addPaymentToFarmerPage() {
	
		return "paymentToFarmer/payment";

	}
	
	@GetMapping("/{fromDate}/{toDate}/{animalType}")
	@ResponseBody
	public ResponseEntity<List<MilkCollectionResponseDto>> findByFromDateAndToDateAndAnimalType(
	        @PathVariable String fromDate,
	        @PathVariable String toDate,
	        @PathVariable("animalType") String animalType, Model model, HttpSession session) {
	    
	    try {
	        SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        
	        Date parsedFromDate = inputDateFormat.parse(fromDate);
	        Date parsedToDate = inputDateFormat.parse(toDate);
	      
	        List<MilkCollectionResponseDto> list = milkCollectionService.findByFromDateAndToDateAndAnimalType(parsedFromDate, parsedToDate, animalType);
	        return new ResponseEntity<>(list, HttpStatus.OK);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	 @GetMapping("/getMilkCollectionDataBy/{farmerId}")
	    public ResponseEntity<List<MilkCollectionResponseDto>> getRecordsByFarmerId(@PathVariable Long farmerId, Model model) {

	        List<MilkCollectionResponseDto> list = milkCollectionService.getRecordsByFarmerId(farmerId);
	        return new ResponseEntity<>(list, HttpStatus.OK);
  
	    }
	
	
}
