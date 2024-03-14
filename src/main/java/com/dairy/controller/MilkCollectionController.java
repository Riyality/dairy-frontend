
package com.dairy.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.dairy.dto.milkCollection.MilkCollectionRequestDto;
import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.dairy.dto.route.RouteResponseDto;
import com.dairy.service.BranchService;
import com.dairy.service.FarmerService;
import com.dairy.service.MilkCollectionService;
import com.dairy.service.RouteService;

@Controller
@RequestMapping("/milkCollection")
public class MilkCollectionController {

	@Autowired
	private BranchService branchService;

	@Autowired
	private FarmerService farmerService;

	@Autowired
	private RouteService routeService;

	@Autowired
	private MilkCollectionService milkCollectionService;

	@GetMapping("/get-farmer-list-page")
	public String getAllFarmersList(HttpSession session, Model model) {
		
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			List<RouteResponseDto> routes = routeService.getAllRoutes(branchId);
			model.addAttribute("routes", routes);
			return "milkCollection/getRoutewiseFarmers";
		}
		return "login";	
	}

	@GetMapping("/add-milkCollection-page/{farmerId}/{farmerName}")
	public String addMilkCollectionPage(@PathVariable long farmerId, @PathVariable String farmerName, HttpSession session, Model model) {
		model.addAttribute("farmerId", farmerId);
		model.addAttribute("farmerName", farmerName);
		return "milkCollection/add";
	}

	@PostMapping
	public String addMilkCollection(@ModelAttribute MilkCollectionRequestDto dto, Model model, RedirectAttributes ra,HttpSession session) {

		int branchId = (int) session.getAttribute("branchId");
		dto.setBranchId(branchId);
		String response = milkCollectionService.addMilkCollection(dto,branchId);
		if (response != null && response.equals(MessageConstants.ADD_MILK_COLLECTION_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/milkCollection";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_MILK_COLLECTION_ERROR_MSG);
		return "milkCollection/getRoutewiseFarmers";
	}

	@GetMapping
	public String allFarmers(HttpSession session, Model model) {
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null) {
			int branchId = (int) session.getAttribute("branchId");
			List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
			model.addAttribute("list", list);
			System.out.println(list);
			return "farmers/all";
		}
		return"login";
	}

	@GetMapping("/byTodaysDate")
	public String getMilkCollectionDataByDate(HttpSession session, Model model) {
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null){
			int branchId = (int) session.getAttribute("branchId");
			LocalDate today = LocalDate.now();
			List<MilkCollectionResponseDto> list = milkCollectionService.getMilkCollectionDataByDate( branchId, today );
			model.addAttribute( "list", list );
			return "milkCollection/datewiseList";
		}
		return "login";
	}
	

	@GetMapping("/selectedDateForMilkData/{date}")
	@ResponseBody
	public ResponseEntity<List<MilkCollectionResponseDto>> getMilkCollectionDataBySelectedDate(@PathVariable String date, HttpSession session) {
		try {
			int branchId = (int) session.getAttribute("branchId");
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        LocalDate selectedDate = LocalDate.parse(date, formatter);
	        
			 List<MilkCollectionResponseDto> list = milkCollectionService.getMilkCollectionDataByDate( branchId, selectedDate );
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}


	@GetMapping("/{id}")
	@ResponseBody
	public ResponseEntity<List<FarmerResponseDto>> farmersListRoutewise(@PathVariable int id, HttpSession session) {
		try {
			int branchId = (int) session.getAttribute("branchId");
			List<FarmerResponseDto> list = farmerService.farmersListRoutewise(branchId, id);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@GetMapping("getMilkCollectionDataBy/{fromDate}/{toDate}/{milkType}/{shift}/{FlagValue}")
    public ResponseEntity<List<MilkCollectionResponseDto>> getMilkCollectionDataByFromDateTodateMilktypeShiftAndBranchId(
    		@PathVariable("fromDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
    		@PathVariable("toDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate,
    		@PathVariable String milkType,
            @PathVariable String shift,@PathVariable String FlagValue,HttpSession session) {
			String user = ( String ) session.getAttribute( "username" );
		
		if(user != null){
			int branchId = (int) session.getAttribute("branchId");
			
			
	  List<MilkCollectionResponseDto> dtos = milkCollectionService.getMilkCollectionDataByFromDateTodateMilktypeShiftAndBranchId(
	            fromDate, toDate, milkType, shift, branchId,FlagValue);
		  return new ResponseEntity<>(dtos, HttpStatus.OK);
	    
    }
		return null;
	}
	
	
	
	@GetMapping("getMilkCollectionDataBy/{selectedDate}/{milkType}/{shift}")
	public ResponseEntity<List<MilkCollectionResponseDto>> getMilkCollectionDataByDateTypeShift(HttpSession session,
			@PathVariable("selectedDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate selectedDate,
			@PathVariable String milkType, @PathVariable String shift
			) {
		String user = ( String ) session.getAttribute( "username" );
		
		if(user != null){
			int branchId = (int) session.getAttribute("branchId");
			
			
			List<MilkCollectionResponseDto> dtos = milkCollectionService.getMilkCollectionDataByDateShiftTypeAndBranchId( branchId, selectedDate, milkType,shift);
			  return new ResponseEntity<>(dtos, HttpStatus.OK);
		    
	    }
			return null;

	}
	
	
}
