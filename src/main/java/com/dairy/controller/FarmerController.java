package com.dairy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.farmer.FarmerRequestDto;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.service.FarmerService;

@Controller
@RequestMapping( "/farmers" )
public class FarmerController {

	@Autowired
	private FarmerService farmerService;

	@GetMapping( "/addFarmerPage" )
	public String addFarmerPage() {
		return "farmers/add";
	}

	@PostMapping
	public String addFarmer( @ModelAttribute FarmerRequestDto dto, HttpSession session ) {
		int branchId = ( int ) session.getAttribute( "branchId" );
		dto.setBranchId( branchId );
		String result = farmerService.add( dto );
		if ( result.equals( MessageConstants.ADD_FARMER_SUCCESS_MESSAGE ) )
			return "redirect:/farmers";
		else
			return "farmers/add";
	}

	@GetMapping
	public String allFarmers( HttpSession session, Model model ) {
		int branchId = ( int ) session.getAttribute( "branchId" );
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers( branchId );
		model.addAttribute( "list", list );
		return "farmers/all";
	}
}
