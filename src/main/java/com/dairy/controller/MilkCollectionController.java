package com.dairy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.branch.BranchRequestDto;
import com.dairy.dto.milkCollection.MilkCollectionRequestDto;
import com.dairy.service.BranchService;
import com.dairy.service.MilkCollectionService;

@Controller
@RequestMapping( "/milkCollection" )
public class MilkCollectionController {

	@Autowired
	private BranchService branchService;

	@Autowired
	private MilkCollectionService milkCollectionService;
	
	@GetMapping( "/add-milkCollection-page" )
	public String addBranchPage() {
		return "milkCollection/add";
	}
	
	@PostMapping
	public String addMilkCollection( @ModelAttribute MilkCollectionRequestDto dto, Model model, RedirectAttributes ra ) {
		String response = milkCollectionService.addMilkCollection( dto );
		if ( response != null && response.equals( MessageConstants.ADD_MILK_COLLECTION_SUCCESS_MESSAGE ) ) {
			ra.addFlashAttribute( "successMessage", response );
			return "redirect:/milkCollection";
		}
		ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_MILK_COLLECTION_ERROR_MSG );
		return "milkCollection/add";
	}
	
}
