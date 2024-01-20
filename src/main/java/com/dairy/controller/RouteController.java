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
import com.dairy.dto.route.RouteRequestDto;
import com.dairy.dto.route.RouteResponseDto;
import com.dairy.service.RouteService;

@Controller
@RequestMapping( "/routes" )
public class RouteController {

	@Autowired
	private RouteService routeService;

	@GetMapping( "/add-route-page" )
	public String addRoutePage() {
		return "routes/add";
	}

	@PostMapping
	public String addRoute( @ModelAttribute RouteRequestDto dto, Model model, RedirectAttributes ra ,HttpSession session) {
		int branchId=(int) session.getAttribute("branchId");
		dto.setBranchId(branchId);
		String response = routeService.addRoute( dto );
		if ( response != null && response.equals( MessageConstants.ADD_ROUTE_SUCCESS_MESSAGE ) ) {
			ra.addFlashAttribute( "successMessage", response );
			return "redirect:/routes";
		}
		ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_ROUTE_ERROR_MSG );
		return "routes/add";
	}

	@GetMapping
	public String getAllRoutes( Model model ) {
		List<RouteResponseDto> list = routeService.getAllRoutes();
		model.addAttribute( "routes", list );
		return "routes/all";
	}

	@GetMapping( "/{id}" )
	public String getById( @PathVariable int id, Model model ) {
		RouteResponseDto response = routeService.findById( id );
		model.addAttribute( "route", response );
		return "routes/update";
	}
	
	@PostMapping( "/update" )
	public String updateRoute( @ModelAttribute RouteRequestDto dto, RedirectAttributes ra,HttpSession session ) {
		int branchId=(int) session.getAttribute("branchId");
		dto.setBranchId(branchId);
		String response = routeService.update( dto );
		if ( response != null && response.equals( MessageConstants.UPDATE_ROUTE_SUCCESS_MESSAGE ) ) {
			ra.addFlashAttribute( "successMessage", MessageConstants.UPDATE_ROUTE_SUCCESS_MESSAGE );
			return "redirect:/routes";
		}
		ra.addFlashAttribute( "errorMessage", MessageConstants.UPDATE_ROUTE_ERROR_MSG );
		return "redirect:/routes/" + dto.getId();
	}

}
