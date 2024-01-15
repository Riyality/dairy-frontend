package com.dairy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.branch.BranchResponseDto;
import com.dairy.dto.employee.EmployeeRequestDto;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.dto.feedToFarmer.FeedToFarmerRequestDto;
import com.dairy.dto.feedToFarmer.FeedToFarmerResponseDto;
import com.dairy.dto.feedType.FeedTypeResponseDto;
import com.dairy.dto.mainBranch.MainBranchRequestDto;
import com.dairy.dto.route.RouteResponseDto;
import com.dairy.service.FarmerService;
import com.dairy.service.FeedCompanyService;
import com.dairy.service.FeedToFarmerService;
import com.dairy.service.FeedTypeService;
import com.dairy.service.RouteService;

@Controller
@RequestMapping("/feedTofarmers")
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

		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("farmers", list);
		
		List<FeedCompanyResponseDto> list1 = feedCompanyService.getAllFeedCompany();
		model.addAttribute("feedCompany", list1);

		List<FeedTypeResponseDto> list2 = feedTypeService.getAllFeedTypes();
		model.addAttribute("feedType", list2);
		
     	return "feedToFarmer/add";
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
	public String add(@ModelAttribute FeedToFarmerResponseDto feedToFarmerResponseDto ,Model model,RedirectAttributes ra,
			           HttpSession session ){
		    int branchId=(int) session.getAttribute("branchId");
		    feedToFarmerResponseDto.setBranchId(branchId);
		    
		    String response=feedToFarmerService.addFeedToFarmers(feedToFarmerResponseDto);
			if (response != null && response.equals(MessageConstants.ADD_FEEDTOFARMER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/feedTofarmers";
		}
			ra.addFlashAttribute("errorMessage", MessageConstants.ADD_FEEDTOFARMER_ERROR_MSG);

		return "feedToFarmer/add";				
		
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
		 FeedToFarmerResponseDto response = feedToFarmerService.findByIdFeedToFarmer( id );
			model.addAttribute( "feedToFarmer", response );
			
			List<FeedCompanyResponseDto> list1 = feedCompanyService.getAllFeedCompany();
			model.addAttribute("feedCompany", list1);

			List<FeedTypeResponseDto> list2 = feedTypeService.getAllFeedTypes();
			model.addAttribute("feedType", list2);
			
			int branchId = (int) session.getAttribute("branchId");
			List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
			model.addAttribute("Farmers", list);
			
			return "feedToFarmer/update";
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
			return "redirect:/feedTofarmers/" + feedToFarmerDto.getId();
		}
	 
	 
	
	
	
	

}