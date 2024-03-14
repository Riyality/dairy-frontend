package com.dairy.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.dairy.dto.paymentToFarmer.PaymentToFarmerRequestDto;
import com.dairy.dto.paymentToFarmer.PaymentToFarmerResponseDto;
import com.dairy.service.MilkCollectionService;
import com.dairy.service.PaymentToFarmerService;

@CrossOrigin(origins = "*")
@Controller
@RequestMapping("/paymentToFarmer")
public class PaymentToFarmerController {

	@Autowired
	PaymentToFarmerService paymentToFarmerService;

	@Autowired
	private MilkCollectionService milkCollectionService;

	@GetMapping("/add-payment-page")
	public String addPaymentToFarmerPage() {

		return "paymentToFarmer/payment";

	}

	@GetMapping("/{fromDate}/{toDate}/{animalType}")
	@ResponseBody
	public ResponseEntity<List<MilkCollectionResponseDto>> findByFromDateAndToDateAndAnimalType(
			@PathVariable("fromDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
			@PathVariable("toDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
			@PathVariable("animalType") String animalType, Model model, HttpSession session) {

		try {

			String Flag = "Payment";
			List<MilkCollectionResponseDto> list = milkCollectionService.findByFromDateAndToDateAndAnimalType(fromDate,
					toDate, animalType, Flag);
			return new ResponseEntity<>(list, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/getMilkCollectionDataBy/{farmerId}")
	public ResponseEntity<List<MilkCollectionResponseDto>> getRecordsByFarmerId(@PathVariable Long farmerId,
			Model model) {

		List<MilkCollectionResponseDto> list = milkCollectionService.getRecordsByFarmerId(farmerId);
		return new ResponseEntity<>(list, HttpStatus.OK);

	}

	@GetMapping("getMilkCollectionDataBy/{farmerId}/{fromDate}/{toDate}/{animalType}")
	public ResponseEntity<List<MilkCollectionResponseDto>> getRecordsByFarmerIdFromDateAndToDateAndAnimalType(
			@PathVariable Long farmerId, @PathVariable String fromDate, @PathVariable String toDate,
			@PathVariable String animalType) {
		List<MilkCollectionResponseDto> responseDtos = milkCollectionService
				.getRecordsByFarmerIdFromDateAndToDateAndAnimalType(farmerId, fromDate, toDate, animalType);
		return ResponseEntity.status(HttpStatus.OK).body(responseDtos);
	}

	@PostMapping
	public ResponseEntity<String> addPayment(@RequestBody List<PaymentToFarmerRequestDto> dtos, HttpSession session) {
		int branchId = (int) session.getAttribute("branchId");

		for (PaymentToFarmerRequestDto dto : dtos) {
			dto.setBranch(branchId);
			String added = paymentToFarmerService.addPayment(dto);

		}

		return ResponseEntity.status(HttpStatus.OK).body("Payment records added successfully");
	}

	@GetMapping
	public String getAllPaymentList(Model model, HttpSession session) {

		String user = (String) session.getAttribute("username");

		if (user != null) {
			Integer branchId = (Integer) session.getAttribute("branchId");
			List<PaymentToFarmerResponseDto> list = paymentToFarmerService.getAllPaymentList(branchId);
			model.addAttribute("payment", list);
			return "paymentToFarmer/all";
		}
		return "login";

	}

	@GetMapping("datewise/{fromDate}/{toDate}/{milkType}/{flag}")
	public ResponseEntity<List<PaymentToFarmerResponseDto>> getPaymentListBetweenFromDateAndToDate(
			@PathVariable("fromDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
			@PathVariable("toDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate,
			@PathVariable String milkType, @PathVariable String flag, HttpSession session) {

		String user = (String) session.getAttribute("username");

		if (user != null) {
			Integer branchId = (Integer) session.getAttribute("branchId");

			return new ResponseEntity<>(paymentToFarmerService.getPaymentListBetweenFromDateAndToDate(fromDate, toDate,
					milkType, branchId, flag), HttpStatus.OK);
		}
		return null;

	}

}
