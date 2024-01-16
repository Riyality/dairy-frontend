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
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.dto.milkCollection.MilkCollectionRequestDto;
import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.dairy.dto.route.RouteResponseDto;
import com.dairy.service.BranchService;
import com.dairy.service.FarmerService;
import com.dairy.service.MilkCollectionService;
import com.dairy.service.RouteService;

@Controller
@RequestMapping( "/milkCollection" )
public class MilkCollectionController {

	@Autowired
	private BranchService branchService;
	
	@Autowired
	private FarmerService farmerService;
	
	@Autowired
	private RouteService routeService;

	@Autowired
	private MilkCollectionService milkCollectionService;
	
	@GetMapping( "/get-farmer-list-page" )
	public String getAllFarmersList(HttpSession session, Model model ) {
		List<RouteResponseDto> routes = routeService.getAllRoutes();
		model.addAttribute( "routes", routes );
		return "milkCollection/getRoutewiseFarmers";
	}
	
	@GetMapping( "/add-milkCollection-page/{farmerId}/{farmerName}" )
	public String addMilkCollectionPage(@PathVariable long farmerId, @PathVariable String farmerName, HttpSession session, Model model ) {
		model.addAttribute( "farmerId", farmerId );
		model.addAttribute( "farmerName", farmerName );
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
	
	@GetMapping
	public String allFarmers( HttpSession session, Model model ) {
		int branchId = ( int ) session.getAttribute( "branchId" );
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers( branchId );
		model.addAttribute( "list", list );
		return "farmers/all";
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

}
