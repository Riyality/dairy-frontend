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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.advanceToFarmer.AdvanceToFarmerRequestDto;
import com.dairy.dto.advanceToFarmer.AdvanceToFarmerResponseDto;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.service.AdvanceToFarmerService;
import com.dairy.service.FarmerService;

@Controller
@RequestMapping("/advanceToFarmer")
public class AdvanceToFarmerController {

	@Autowired
	AdvanceToFarmerService advanceToFarmerService;
	@Autowired
	FarmerService farmerService;

	@GetMapping("/advanceToFarmer-add-page")
	public String addAdvancePage(HttpSession session, Model model) {
		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);
		return "advanceToFarmers/add";

	}

	@PostMapping
	public String addAdvance(@ModelAttribute AdvanceToFarmerRequestDto advanceRequestDto, Model model,
			RedirectAttributes ra ,HttpSession session) {
		int branchId=(int) session.getAttribute("branchId");
		advanceRequestDto.setBranchId(branchId);
		String response = advanceToFarmerService.addAdvance(advanceRequestDto);
		if (response != null && response.equals(MessageConstants.ADD_ADVANCETOFARMER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/advanceToFarmer";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_ADVANCETOFARMER_ERROR_MSG);
		return "redirect:/advanceToFarmer/advanceToFarmer-add-page";

	}

	@GetMapping
	public String getAllAdvance(Model model , HttpSession session) {
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			List<AdvanceToFarmerResponseDto> list = advanceToFarmerService.getAllAdvance(branchId);
			model.addAttribute("advances", list);
			return "advanceToFarmers/all";
		}
		return"login";
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable Long id, Model model, HttpSession session) {
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			AdvanceToFarmerResponseDto response = advanceToFarmerService.findByIdAdvance(id ,branchId);
			model.addAttribute("advance", response);

			List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
			model.addAttribute("list", list);
			return "advanceToFarmers/update";
		}
		return "login";
	}
	

	 @GetMapping("farmerId/{farmerId}")
		public ResponseEntity<Double> findTotalOfRemainingAmountByFarmerIdAndBranchId(@PathVariable("farmerId") Long farmerId,HttpSession session) {
		 int branchId = (int) session.getAttribute("branchId");
			
			if(branchId != 0) {
			    Double result = advanceToFarmerService.findTotalOfRemainingAmountByFarmerIdAndBranchId(farmerId, branchId);
			    return ResponseEntity.status(HttpStatus.OK).body(result);
			}
		 return null;
		 	
		}
	

	@PostMapping("/update")
	public String updateAdvance(@ModelAttribute AdvanceToFarmerRequestDto advanceRequestDto, RedirectAttributes ra,
			HttpSession session) {
		
		int branchId=(int) session.getAttribute("branchId");
		advanceRequestDto.setBranchId(branchId);
		String response = advanceToFarmerService.updateAdvance(advanceRequestDto);
		if (response != null && response.equals(MessageConstants.UPDATE_ADVANCETOFARMER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_ADVANCETOFARMER_SUCCESS_MESSAGE);
			return "redirect:/advanceToFarmer";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_ADVANCETOFARMER_ERROR_MSG);
		return "redirect:/advanceToFarmer/"+advanceRequestDto.getId();

	}
	
	@GetMapping("datewise/{fromDate}/{toDate}/{flag}")
	public ResponseEntity<List<AdvanceToFarmerResponseDto>> getAdvanceRecordsDatewise(@PathVariable @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
	        @PathVariable @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate,@PathVariable String flag,HttpSession session) {
		
		int branchId=(int) session.getAttribute("branchId");
		return new ResponseEntity<>(advanceToFarmerService.getAdvanceRecordsDatewise(fromDate,toDate,branchId,flag), HttpStatus.OK);
	}
}
