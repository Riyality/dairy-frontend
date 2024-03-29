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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.farmer.FarmerRequestDto;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.dto.route.RouteResponseDto;
import com.dairy.service.FarmerService;
import com.dairy.service.RouteService;

@Controller
@RequestMapping("/farmers")
public class FarmerController {

	private static final Object ADD_FARMER_ERROR_MSG = null;
	@Autowired
	private FarmerService farmerService;
	@Autowired
	RouteService routeService;

	@GetMapping("/addFarmerPage")
	public String addFarmerPage(Model model , HttpSession session) {
		
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			List<RouteResponseDto> list = routeService.getAllRoutes(branchId);
			model.addAttribute("routes", list);
			return "farmers/add";
		}
		return "login";
	}

	@PostMapping
	public String addFarmer(@ModelAttribute FarmerRequestDto dto, HttpSession session, RedirectAttributes ra) {
		
		int branchId = (int) session.getAttribute("branchId");
		dto.setBranchId(branchId);

		String result = farmerService.add(dto);
		if (result != null && result.equals(MessageConstants.ADD_FARMER_SUCCESS_MESSAGE)){
			ra.addFlashAttribute("successMessage",result);
			return "redirect:/farmers";
		}
			ra.addFlashAttribute("errorMessage", ADD_FARMER_ERROR_MSG);
			return "redirect:/farmers/addFarmerPage";
	}
	

	@GetMapping
	public String allFarmers(HttpSession session, Model model) {
		
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			String lang=(String) session.getAttribute("lang");
			System.out.println("Selected Language"+lang);
			List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
			model.addAttribute("list", list);
			return "farmers/all";
		}
		return "login";
	}
	
	
	@GetMapping("/InActiveFarmers")
	public String allInActiveFarmers(HttpSession session, Model model) {
		
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			List<FarmerResponseDto> list = farmerService.findAllInActiveFarmers(branchId);
			model.addAttribute("list", list);
			return "farmers/all";
		}
		return "login";
	}

	@GetMapping("/id/{id}")
	public String findById(@PathVariable Long id, Model model ,HttpSession session) {
		
		String user = ( String ) session.getAttribute( "username" );
		
		if(user !=null) {
			int branchId = (int) session.getAttribute("branchId");
			FarmerResponseDto response = farmerService.findById(id ,branchId);
			model.addAttribute("farmer", response);
			
			List<RouteResponseDto> list = routeService.getAllRoutes(branchId);
			model.addAttribute("routes", list);
			return "farmers/update";
		}
		return "login";
	}

	@PostMapping("/update")
	public String updateFarmer(@ModelAttribute FarmerRequestDto dto, HttpSession session, RedirectAttributes ra) {
		int branchId = (int) session.getAttribute("branchId");
		dto.setBranchId(branchId);
		String response = farmerService.update(dto);
		if (response != null && response.equals(MessageConstants.UPDATE_FARMER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_FARMER_SUCCESS_MESSAGE);
			return "redirect:/farmers";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_FARMER_ERROR_MSG);
		return "redirect:/farmers/" + dto.getId();
	}
	
	
	
}
