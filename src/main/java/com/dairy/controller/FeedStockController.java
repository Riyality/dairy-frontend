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
import com.dairy.dto.Supplier.SupplierRequestDto;
import com.dairy.dto.branch.BranchRequestDto;
import com.dairy.dto.branch.BranchResponseDto;
import com.dairy.dto.feedStock.FeedStockRequestDto;
import com.dairy.dto.feedStock.FeedStockResponseDto;
import com.dairy.service.FeedStockService;

@Controller
@RequestMapping("feedStock")
public class FeedStockController {
	
	@Autowired
	FeedStockService feedStockService;
	
	@GetMapping("/add-feedStock-page")
	public String addFeedStockPage(Model model) {
		List<FeedStockResponseDto> list = feedStockService.getAllFeedStock();
		model.addAttribute( "FeedStocks", list );
		return "feedStock/add";
	}
	
	@PostMapping
	public String feedStockAdd(@ModelAttribute FeedStockRequestDto feedStockRequestDto ,Model model,RedirectAttributes ra){
		 String response=feedStockService.addFeedStock(feedStockRequestDto);
		 if(response!=null && response.equals("addSucccess")){
			 ra.addFlashAttribute("successMessage", response);
				return "redirect:/feedStock"; 
		 }
		 ra.addFlashAttribute("errorMessage");
			return "feedStock/add";
		
	}
	
	@GetMapping
	public String getAllFeedStock( Model model ) {
		List<FeedStockResponseDto> list = feedStockService.getAllFeedStock();
		model.addAttribute( "FeedStock", list );
		return "feedStock/all";
	}
	
	@GetMapping("/{id}")
	public String findById(@PathVariable int id,Model model){
		FeedStockResponseDto res= feedStockService.findById(id);
		model.addAttribute("Stock", res);
		return "feedStock/update";
	
	}
	
	
	@PostMapping( "/update" )
	public String updateBranch( @ModelAttribute FeedStockRequestDto feedStockRequestDto, RedirectAttributes ra ) {
		String response = feedStockService.updateFeed( feedStockRequestDto );
		if ( response != null && response.equals( MessageConstants.UPDATE_FEEDSTOCK_SUCCESS_MESSAGE ) ) {
			ra.addFlashAttribute( "successMessage", MessageConstants.UPDATE_FEEDSTOCK_SUCCESS_MESSAGE );
			return "redirect:/feedStock";
		}
		ra.addFlashAttribute( "errorMessage", MessageConstants.UPDATE_FEEDSTOCK_ERROR_MSG );
		return "redirect:/feedStock/" + feedStockRequestDto.getId();
	}
	
	
	
	
}
