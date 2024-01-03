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
import com.dairy.dto.branch.BranchRequestDto;
import com.dairy.dto.branch.BranchResponseDto;
import com.dairy.service.BranchService;

@Controller
@RequestMapping( "/branches" )
public class BranchController {

	@Autowired
	private BranchService branchService;

	@GetMapping( "/add-branch-page" )
	public String addBranchPage() {
		return "branches/add";
	}

	@PostMapping
	public String addBranch( @ModelAttribute BranchRequestDto dto, Model model, RedirectAttributes ra ) {
		String response = branchService.addBranch( dto );
		if ( response != null && response.equals( MessageConstants.ADD_BRANCH_SUCCESS_MESSAGE ) ) {
			ra.addFlashAttribute( "successMessage", response );
			return "redirect:/branches";
		}
		ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_BRANCH_ERROR_MSG );
		return "branches/add";
	}

	@GetMapping
	public String getAllBranches( Model model ) {
		List<BranchResponseDto> list = branchService.getAllBranches();
		model.addAttribute( "branches", list );
		return "branches/all";
	}

	@GetMapping( "/{id}" )
	public String getById( @PathVariable int id, Model model ) {
		BranchResponseDto response = branchService.findById( id );
		model.addAttribute( "branch", response );
		return "branches/update";
	}

	@PostMapping( "/update" )
	public String updateBranch( @ModelAttribute BranchRequestDto dto, RedirectAttributes ra ) {
		String response = branchService.update( dto );
		if ( response != null && response.equals( MessageConstants.UPDATE_BRANCH_SUCCESS_MESSAGE ) ) {
			ra.addFlashAttribute( "successMessage", MessageConstants.UPDATE_BRANCH_SUCCESS_MESSAGE );
			return "redirect:/branches";
		}
		ra.addFlashAttribute( "errorMessage", MessageConstants.UPDATE_BRANCH_ERROR_MSG );
		return "redirect:/branches/" + dto.getId();
	}
}
