package com.dairy.controller;

import java.util.List;

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
import com.dairy.dto.mainBranch.MainBranchRequestDto;
import com.dairy.dto.mainBranch.MainBranchResponseDto;
import com.dairy.service.MainBranchService;

@Controller
@RequestMapping("/mainBranchs")
public class MainBranchController {
	
	@Autowired
	MainBranchService mainBranchService;

	@GetMapping("/add-mainBranch-page")
	public String addMainBranchPage() {
		return "mainBranches/add";
	}
	
	@GetMapping
	public String getAllMainBranches( Model model ) {
		List<MainBranchResponseDto> list = mainBranchService.getAllMainBranches();
		model.addAttribute( "mainBranches", list );
		return "mainBranches/all";
	}

	
	@PostMapping
	public String addMainBranch(@ModelAttribute MainBranchRequestDto requestDto ,Model model,RedirectAttributes ra){
		String response=mainBranchService.addMainBranch(requestDto);
		if ( response != null && response.equals( MessageConstants.ADD_MAIN_BRANCH_SUCCESS_MESSAGE ) ) {
			ra.addFlashAttribute( "successMessage", response );
			return "redirect:/mainBranchs";
		}
		ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_MAIN_BRANCH_ERROR_MESSAGE );
		return "mainBranches/add";
	}
	
	
	@GetMapping("/{id}")
	public String findById (@PathVariable long id ,Model model ){
		MainBranchResponseDto response=mainBranchService.findByIdmainBranch(id);
		model.addAttribute("mainBranch" ,response);
		return "mainBranches/update";
	}
	
	@PostMapping("/update")
	public String update (@ModelAttribute MainBranchRequestDto dto ,RedirectAttributes ra){
		String response = mainBranchService.updateMainBranch(dto);
		if (response != null && response.equals(MessageConstants.UPDATE_MAIN_BRANCH_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_MAIN_BRANCH_SUCCESS_MESSAGE);
			return "redirect:/mainBranchs";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_MAIN_BRANCH_ERROR_MESSAGE);
		return "redirect:/mainBranchs/" + dto.getId();
	}
	

	

}
