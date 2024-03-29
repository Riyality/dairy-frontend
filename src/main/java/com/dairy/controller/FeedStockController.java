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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.Supplier.SupplierResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.dto.feedDetails.FeedDetailsResponseDto;
import com.dairy.dto.feedStock.FeedStockRequestDto;
import com.dairy.dto.feedStock.FeedStockResponseDto;
import com.dairy.dto.feedType.FeedTypeResponseDto;
import com.dairy.service.FeedCompanyService;
import com.dairy.service.FeedStockService;
import com.dairy.service.FeedTypeService;
import com.dairy.service.SupplierService;

@Controller
@RequestMapping("/feedStock")
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
	public String addFeedStockPage(Model model ,HttpSession session) {
		
		String user = (String) session.getAttribute("username");
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			
			List<FeedCompanyResponseDto> list = feedCompanyService.getAllFeedCompany(branchId);
			model.addAttribute("feedCompany", list);
			
			List<FeedTypeResponseDto> list1 = feedTypeService.getAllFeedTypes(branchId);
			model.addAttribute("feedType", list1);

			List<SupplierResponseDto> list2 = supplierService.getAllSupplier(branchId);
			model.addAttribute("suppliers", list2);

			return "feedStock/add";
			
		}
		return "login";		
	}

	
	@PostMapping
	public String feedStockAddMultiple(@RequestBody List<FeedStockRequestDto> feedStockRequestDtoList, Model model,
	        RedirectAttributes ra, HttpSession session) {
		System.out.println("Feed Stock:"+feedStockRequestDtoList);
	    int branchId = (int) session.getAttribute("branchId");
	    feedStockRequestDtoList.forEach(dto -> dto.setBranchId(branchId));
	    String response = feedStockService.addFeedStocks(feedStockRequestDtoList);
	    if (response != null && response.equals(MessageConstants.ADD_FEEDSTOCK_SUCCESS_MESSAGE)) {
	        ra.addFlashAttribute("successMessage", response);
	        return "redirect:/feedStock/add-purchaseDetails-page";
	    }
	    ra.addFlashAttribute("errorMessage", MessageConstants.ADD_FEEDSTOCK_ERROR_MSG);
	    return "redirect:/feedStock/add-feedStock-page";
	}

	@GetMapping("/add-purchaseDetails-page")
	public String getAllFeedStock(Model model ,HttpSession session) {
		String user = (String) session.getAttribute("username");
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			List<FeedStockResponseDto> list = feedStockService.getAllFeedStock(branchId);
			model.addAttribute("FeedStocks", list);
			return "feedStock/purchaseDetails";
		}
		return "login";
	}
	
	@GetMapping("/add-feedDetails-page")
	public String getAllFeedDetails(Model model ,HttpSession session) {
		String user = (String) session.getAttribute("username");
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			List<FeedDetailsResponseDto> list = feedStockService.getAllFeedDetails(branchId);
			model.addAttribute("FeedDetails", list);
			return "feedStock/allStock";
		}
		return "login";
	}
	

	@GetMapping( "getFeedTypeByFeedCompanyId/{id}" )
	@ResponseBody
	public ResponseEntity<List<FeedTypeResponseDto>> getFeedTypeByFeedCompanyId(@PathVariable long id, HttpSession session ) {
		int branchId = ( int ) session.getAttribute( "branchId" );
	    List<FeedTypeResponseDto> list = feedTypeService.getFeedTypeByFeedCompanyId(id, branchId);
	    return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@GetMapping( "/{id}" )
	public String getById( @PathVariable int id, Model model ,HttpSession session ) {
		
		String user = (String) session.getAttribute("username");
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			
			FeedStockResponseDto response = feedStockService.findById( id ,branchId );
			model.addAttribute( "feedstock", response );
			
			List<FeedCompanyResponseDto> list = feedCompanyService.getAllFeedCompany(branchId);
			model.addAttribute("feedCompany", list);

			List<FeedTypeResponseDto> list1 = feedTypeService.getAllFeedTypes(branchId);
			model.addAttribute("feedType", list1);

			List<SupplierResponseDto> list2 = supplierService.getAllSupplier(branchId);
			model.addAttribute("suppliers", list2);
			
			return "feedStock/update";
			
		}
		return "login";
	}

	@PostMapping("/update")
	public String updatefeed(@ModelAttribute FeedStockRequestDto feedStockRequestDto, RedirectAttributes ra,HttpSession session) {
	
		int branchId = (int) session.getAttribute("branchId");
		feedStockRequestDto.setBranchId(branchId);
		
		String response = feedStockService.updateFeed(feedStockRequestDto);
		if (response != null && response.equals(MessageConstants.UPDATE_FEEDSTOCK_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_FEEDSTOCK_SUCCESS_MESSAGE);
			return "redirect:/feedStock";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_FEEDSTOCK_ERROR_MSG);
		return "redirect:/feedStock/" + feedStockRequestDto.getId();
	}
	@ResponseBody
	@GetMapping("/feedTypeId/{feedTypeId}/feedCompanyId/{feedCompanyId}")
	public long getFeedQuantityByFeedTypeFeedCompanyAndBranch(@PathVariable long feedTypeId,
			@PathVariable long feedCompanyId,HttpSession session) {
		int branchId = (int) session.getAttribute("branchId");
		return feedStockService.getFeedQuantityByFeedTypeFeedCompanyAndBranch(feedTypeId,feedCompanyId,branchId);
	}
	
	
}
