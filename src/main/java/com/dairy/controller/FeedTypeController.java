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
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.dto.feedType.FeedTypeRequestDto;
import com.dairy.dto.feedType.FeedTypeResponseDto;
import com.dairy.service.FeedCompanyService;
import com.dairy.service.FeedTypeService;

@Controller
@RequestMapping("/feedTypes")
public class FeedTypeController {

	@Autowired
	FeedTypeService feedTypeService;

	@Autowired
	public FeedCompanyService feedCompanyService;

	@GetMapping("/add-feed-type")
	public String addFeedTypepage(Model model) {
		List<FeedCompanyResponseDto> list = feedCompanyService.getAllFeedCompany();
		model.addAttribute("feedCompany", list);
		return "/feedTypes/add";
	}

	@PostMapping
	public String addFeedType(@ModelAttribute FeedTypeRequestDto dto, Model m, RedirectAttributes ra,
			HttpSession session) {
		int branchId = (int) session.getAttribute("branchId");
		dto.setBranchId(branchId);

		String response = feedTypeService.addFeedType(dto);
		if (response != null && response.equals(MessageConstants.ADD_FEEDTYPE_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/feedTypes";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_FEEDTYPE_ERROR_MSG);
		return "feedTypes/add";
	}

	@GetMapping
	public String getAllFeedTypes(Model model) {
		List<FeedTypeResponseDto> list = feedTypeService.getAllFeedTypes();

		model.addAttribute("feedType",list);
		return "/feedTypes/all";																																			
    }

	}

	@GetMapping("/{id}")
	public String getById(@PathVariable long id, Model model) {
		FeedTypeResponseDto response = feedTypeService.findById(id);
		model.addAttribute("feedType", response);

		List<FeedCompanyResponseDto> list = feedCompanyService.getAllFeedCompany();
		model.addAttribute("feedCompany", list);
		return "feedTypes/update";
	}

	@PostMapping("/update")
	public String update(@ModelAttribute FeedTypeRequestDto dto, Model m, RedirectAttributes ra, HttpSession session) {
		String response = feedTypeService.updateFeedCompany(dto);
		if (response != null && response.equals(MessageConstants.UPDATE_FEEDTYPE_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_FEEDTYPE_SUCCESS_MESSAGE);
			return "redirect:/feedTypes";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_FEEDTYPE_ERROR_MSG);
		return "redirect:/feedTypes/" + dto.getId();
	}

}
