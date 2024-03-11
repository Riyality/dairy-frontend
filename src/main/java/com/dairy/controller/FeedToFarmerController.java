
package com.dairy.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.dto.feedToFarmer.FeedToFarmerRequestDto;
import com.dairy.dto.feedToFarmer.FeedToFarmerResponseDto;
import com.dairy.dto.feedType.FeedTypeResponseDto;
import com.dairy.service.FarmerService;
import com.dairy.service.FeedCompanyService;
import com.dairy.service.FeedToFarmerService;
import com.dairy.service.FeedTypeService;

@Controller
@RequestMapping("/feedToFarmers")
public class FeedToFarmerController {

	@Autowired
	FeedToFarmerService feedToFarmerService;

	@Autowired
	FeedCompanyService feedCompanyService;

	@Autowired
	FeedTypeService feedTypeService;

	@Autowired
	FarmerService farmerService;

	@GetMapping("/feedToFarmer-add-page")
	public String feedToFarmerPage(Model model, HttpSession session) {
		
		String user = (String) session.getAttribute("username");
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			
			List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
			model.addAttribute("farmers", list);
			
			List<FeedCompanyResponseDto> list1 = feedCompanyService.getAllFeedCompany(branchId);
			model.addAttribute("feedCompany", list1);

			List<FeedTypeResponseDto> list2 = feedTypeService.getAllFeedTypes(branchId);
			model.addAttribute("feedType", list2);
			
	     	return "feedToFarmer/add";
		}
		return "login";	
	}
	
	
	
//	@GetMapping( "/add-feedToFarmer-page/{farmerId}/{farmerName}" )
//	public String addMilkCollectionPage(@PathVariable long farmerId, @PathVariable String farmerName,   HttpSession session,
//			                              Model model ) {
//		model.addAttribute( "farmerId", farmerId );
//		model.addAttribute( "farmerName", farmerName );
//		
//		List<FeedCompanyResponseDto> list1 = feedCompanyService.getAllFeedCompany();
//		model.addAttribute("feedCompany", list1);
//
//		List<FeedTypeResponseDto> list2 = feedTypeService.getAllFeedTypes();
//		model.addAttribute("feedType", list2);
//		
//		return "feedToFarmer/add";
//	}

	
	@PostMapping
	public String add(@ModelAttribute FeedToFarmerRequestDto dto ,Model model,RedirectAttributes ra, HttpSession session ){
		    int branchId=(int) session.getAttribute("branchId");
		    dto.setBranchId(branchId);
		    
		    String response=feedToFarmerService.addFeedToFarmers(dto);
			if (response != null && response.equals(MessageConstants.ADD_FEEDTOFARMER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/feedToFarmers";
		}
			ra.addFlashAttribute("errorMessage", MessageConstants.ADD_FEEDTOFARMER_ERROR_MSG);

		return "feedToFarmer/add";				
		
	}
	
	@GetMapping( "/add-feedToFarmer-page/{farmerId}/{farmerName}" )
	public String addFeedToFarmerPage(@PathVariable long farmerId, @PathVariable String farmerName, HttpSession session, Model model ) {
		String user = (String) session.getAttribute("username");
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			
			model.addAttribute( "farmerId", farmerId );
			model.addAttribute( "farmerName", farmerName );
			List<FeedCompanyResponseDto> list1 = feedCompanyService.getAllFeedCompany(branchId);
			model.addAttribute("feedCompany", list1);

			List<FeedTypeResponseDto> list2 = feedTypeService.getAllFeedTypes(branchId);
			model.addAttribute("feedType", list2);
			return "feedToFarmer/add";
		}
		return "login";
	}
	 
	 @GetMapping
		public String allFeedToFarmer(Model model, HttpSession session) {
			int branchId = (int) session.getAttribute("branchId");
			List<FeedToFarmerResponseDto> list = feedToFarmerService.getAllFeedToFarmer();
			model.addAttribute("feedToFarmers", list);
			return "feedToFarmer/all";

		}
	 
	 @GetMapping( "/{id}" )
	 public String getById( @PathVariable Long id, Model model , HttpSession session) {
			String user = (String) session.getAttribute("username");
			
			if(user != null) {
				int branchId = (int) session.getAttribute("branchId");
				
				FeedToFarmerResponseDto response = feedToFarmerService.findByIdFeedToFarmer( id );
				model.addAttribute( "feedToFarmer", response );
				
				List<FeedCompanyResponseDto> list1 = feedCompanyService.getAllFeedCompany(branchId);
				model.addAttribute("feedCompany", list1);

				List<FeedTypeResponseDto> list2 = feedTypeService.getAllFeedTypes(branchId);
				model.addAttribute("feedType", list2);
				
				List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
				model.addAttribute("Farmers", list);
				
				return "feedToFarmer/update";
			}
			return "login";
		}
	 
	 
	 @GetMapping("farmerId/{farmerId}")
		public ResponseEntity<Double> findTotalOfRemainingAmountByFarmerIdAndBranchId(
		        @PathVariable("farmerId") Long farmerId,HttpSession session) {
		 	int branchId = (int) session.getAttribute("branchId");
		    Double result = feedToFarmerService.findTotalOfRemainingAmountByFarmerIdAndBranchId(farmerId, branchId);

		    return ResponseEntity.status(HttpStatus.OK).body(result);
		}
	 
	 
	 
	 @PostMapping("/update")
		public String update(@ModelAttribute FeedToFarmerRequestDto feedToFarmerDto, RedirectAttributes ra,
				HttpSession session) {

			int branchId = (int) session.getAttribute("branchId");
			feedToFarmerDto.setBranchId(branchId);
			
			String response = feedToFarmerService.updateFeedToFarmer(feedToFarmerDto);
			if (response != null && response.equals(MessageConstants.UPDATE_FEEDTOFARMER_SUCCESS_MESSAGE)) {
				ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_FEEDTOFARMER_SUCCESS_MESSAGE);
				return "redirect:/feedTofarmers";
			}
			ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_FEEDTOFARMER_ERROR_MSG);
			return "redirect:/feedToFarmers/" + feedToFarmerDto.getId();
		}

	 
	 @GetMapping("datewiseFeed/{fromDate}/{toDate}/{flag}")
	 public ResponseEntity<List<FeedToFarmerResponseDto>> getFeedDatewiseRecords(@PathVariable("fromDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
	    		@PathVariable("toDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate,@PathVariable String flag, HttpSession session) {
			int branchId = (int) session.getAttribute("branchId");
			
			try {
			return new ResponseEntity<>(feedToFarmerService.getDatewiseRecords(fromDate,toDate,branchId,flag), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		}
	


}
