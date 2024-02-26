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
import com.dairy.dto.equipment.EquipmentResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyRequestDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.dto.mainBranch.MainBranchRequestDto;
import com.dairy.service.FeedCompanyService;

@Controller
@RequestMapping("/feedCompanies")
public class FeedCompanyController {
	
	@Autowired
	public FeedCompanyService feedCompanyService;
	
	@GetMapping("/add-feed-company")
	public String addFeedCompanyPage() {
		return"/feedCompanies/add";

	}	
	
	@PostMapping
	public String addFeedCompany(@ModelAttribute FeedCompanyRequestDto dto, Model m, RedirectAttributes ra ,
			                     HttpSession session) {
		int branchId=(int) session.getAttribute("branchId");
		dto.setBranchId(branchId);
		String response = feedCompanyService.addFeedCompany(dto);
		if ( response != null && response.equals( MessageConstants.ADD_FEEDCOMPANY_SUCCESS_MESSAGE ) ) {
			ra.addFlashAttribute( "successMessage", response );
			return "redirect:/feedCompanies";
		}
		ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_FEEDCOMPANY_ERROR_MESSAGE );
		return "feedCompanies/add";
	}

	@GetMapping
	public String getAllFeedCompany(Model model ,HttpSession session) {
		String user = (String) session.getAttribute("username");
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			
			List<FeedCompanyResponseDto> list =feedCompanyService.getAllFeedCompany(branchId);
			model.addAttribute( "feedCompany", list );
			return "/feedCompanies/all";
		}
		return "login";
	}
	
	@GetMapping("/{id}")
	public String getById(@PathVariable long id, Model model ,HttpSession session) {
		String user = (String) session.getAttribute("username");
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			
			FeedCompanyResponseDto response = feedCompanyService.findById(id ,branchId);
			model.addAttribute("feedCompany", response);
			return "feedCompanies/update";	
		}
		return "login";
	}
	
	@PostMapping("/update")
	public String update (@ModelAttribute FeedCompanyRequestDto dto, Model m, RedirectAttributes ra ,
            HttpSession session){
		
		int branchId = (int) session.getAttribute("branchId");
		dto.setBranchId(branchId);
		
		String response = feedCompanyService.updateFeedCompany(dto);
		if (response != null && response.equals(MessageConstants.UPDATE_FEEDCOMPANY_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_FEEDCOMPANY_SUCCESS_MESSAGE);
			return "redirect:/feedCompanies";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_FEEDCOMPANY_ERROR_MESSAGE);
		return "redirect:/feedCompanies/" + dto.getId();
	}
	

}
