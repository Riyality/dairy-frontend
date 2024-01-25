package com.dairy.controller;

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
import com.dairy.dto.Supplier.SupplierResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.dto.feedStock.FeedStockRequestDto;
import com.dairy.dto.feedStock.FeedStockResponseDto;
import com.dairy.dto.feedType.FeedTypeResponseDto;
import com.dairy.service.FeedCompanyService;
import com.dairy.service.FeedStockService;
import com.dairy.service.FeedTypeService;
import com.dairy.service.SupplierService;

@Controller
@RequestMapping("feedStock")
public class FeedStockController {

	@Autowired
	private FeedTypeService feedTypeService;

	@Autowired
	private SupplierService supplierService;

	@Autowired
	private FeedCompanyService feedCompanyService;

	@Autowired
	private FeedStockService feedStockService;

	@GetMapping("/add-feedStock-page")
	public String addFeedStockPage(Model model) {
		List<FeedCompanyResponseDto> list = feedCompanyService.getAllFeedCompany();
		model.addAttribute("feedCompany", list);

		List<FeedTypeResponseDto> list1 = feedTypeService.getAllFeedTypes();
		model.addAttribute("feedType", list1);

		List<SupplierResponseDto> list2 = supplierService.getAllSupplier();
		model.addAttribute("suppliers", list2);

		return "feedStock/add";
	}


	@PostMapping
	public String feedStockAdd(@ModelAttribute FeedStockRequestDto feedStockRequestDto, Model model,
			RedirectAttributes ra ,HttpSession session) {
		
		int branchId=(int) session.getAttribute("branchId");
		feedStockRequestDto.setBranchId(branchId);
		String response = feedStockService.addFeedStock(feedStockRequestDto);
		if (response != null && response.equals(MessageConstants.ADD_FEEDSTOCK_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/feedStock";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_FEEDSTOCK_ERROR_MSG);
		return "feedStock/add";

	}

	@GetMapping
	public String getAllFeedStock(Model model) {
		List<FeedStockResponseDto> list = feedStockService.getAllFeedStock();
		model.addAttribute("FeedStocks", list);
		return "feedStock/all";
	}
	

	@GetMapping( "getFeedTypeByFeedCompanyId/{id}" )
	@ResponseBody
	public ResponseEntity<List<FeedTypeResponseDto>> getFeedTypeByFeedCompanyId(@PathVariable long id, HttpSession session ) {
		int branchId = ( int ) session.getAttribute( "branchId" );
	    List<FeedTypeResponseDto> list = feedTypeService.getFeedTypeByFeedCompanyId(id, branchId);
	    return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@GetMapping( "/{id}" )
	public String getById( @PathVariable int id, Model model ) {
		FeedStockResponseDto response = feedStockService.findById( id );
		model.addAttribute( "feedstock", response );
		
		List<FeedCompanyResponseDto> list = feedCompanyService.getAllFeedCompany();
		model.addAttribute("feedCompany", list);

		List<FeedTypeResponseDto> list1 = feedTypeService.getAllFeedTypes();
		model.addAttribute("feedType", list1);

		List<SupplierResponseDto> list2 = supplierService.getAllSupplier();
		model.addAttribute("suppliers", list2);
		
		return "feedStock/update";
	}

	@PostMapping("/update")
	public String updatefeed(@ModelAttribute FeedStockRequestDto feedStockRequestDto, RedirectAttributes ra) {
		String response = feedStockService.updateFeed(feedStockRequestDto);
		if (response != null && response.equals(MessageConstants.UPDATE_FEEDSTOCK_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_FEEDSTOCK_SUCCESS_MESSAGE);
			return "redirect:/feedStock";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_FEEDSTOCK_ERROR_MSG);
		return "redirect:/feedStock/" + feedStockRequestDto.getId();
	}
	
	
	
	
}
