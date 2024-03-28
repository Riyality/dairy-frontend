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
import com.dairy.dto.dairyManger.DairyManagerRequestDto;
import com.dairy.dto.dairyManger.DairyManagerResponseDto;
import com.dairy.dto.dairyMangerUpdates.DairyMangerUpdatesRequestDto;
import com.dairy.dto.dairyMangerUpdates.DairyMangerUpdatesResponseDto;
import com.dairy.service.DairyMangerService;

@Controller
@RequestMapping("/dairyManger")
public class DairyMangerController {
	@Autowired
	private DairyMangerService dairyMangerService;

	@GetMapping("/add-dairyManger-Page")
	public String addDairyManger() {
		return "dairyManger/add";
	}

	@PostMapping
	public String add(@ModelAttribute DairyManagerRequestDto dto, Model model, RedirectAttributes ra) {
		String response = dairyMangerService.addDairy(dto);
		if (response != null && response.equals(MessageConstants.ADD_DAIRTY_MANGER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/dairyManger";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_DAIRTY_MANGER_ERROR_MSG);
		return "redirect:/dairyManger/add-dairyManger-Page";
	}

	@GetMapping
	public String getAll(Model model) {
		List<DairyManagerResponseDto> list = dairyMangerService.getAllDairy();
		model.addAttribute("dairyMangers", list);
		return "dairyManger/all";
	}

	@GetMapping("/{id}")
	public String getById(@PathVariable long id, Model model) {
		DairyManagerResponseDto response = dairyMangerService.findById(id);
		model.addAttribute("dairy", response);
		return "dairyManger/GetPerson";
	}

	@PostMapping("/dairyUpdates")
	public String addUpdates(@ModelAttribute DairyMangerUpdatesRequestDto dto, Model model, RedirectAttributes ra) {
		String response = dairyMangerService.addDairyUpdates(dto);
		if (response != null && response.equals(MessageConstants.ADD_DAIRTY_MANGER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/dairyManger/dairyUpdates";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_DAIRTY_MANGER_ERROR_MSG);
		return "redirect:/dairyManger/" + dto.getId();
	}

	@GetMapping("/dairyUpdates")
	public String getAllUpdate(Model model) {
		List<DairyMangerUpdatesResponseDto> list = dairyMangerService.getAllDairyUpdate();
		model.addAttribute("dairyMangerUpdate", list);
		return "dairyManger/allUpdates";
	}

}
