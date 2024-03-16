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
import com.dairy.dto.FarmerAnimalMapping.FarmerAnimalMappingRequestDto;
import com.dairy.dto.FarmerAnimalMapping.FarmerAnimalMappingResponseDto;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.service.FarmerAnimalMappingService;
import com.dairy.service.FarmerService;

@Controller
@RequestMapping("/farmerAnimalMapping")
public class FarmerAnimalMappingController {
	@Autowired
	private FarmerAnimalMappingService farmerAnimalMappingService;

	@Autowired
	private FarmerService farmerService;

	@GetMapping("/add-animal-page")
	public String addAnimal(HttpSession session, Model model) {
		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);
		return "animalMapping/add";
	}

	@PostMapping
	public String addAnimal(@ModelAttribute FarmerAnimalMappingRequestDto requestDto, Model model,
			RedirectAttributes ra, HttpSession session) {
		int branchId = (int) session.getAttribute("branchId");
		requestDto.setBranchId(branchId);

		String response = farmerAnimalMappingService.addAnimal(requestDto);
		if (response != null && response.equals(MessageConstants.ADD_ANIMAL_MAPPING_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/farmerAnimalMapping";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_ANIMAL_MAPPING_ERROR_MSG);
		return "redirect:/farmerAnimalMapping/add-animal-page";
	}

	@GetMapping
	public String getAllAnimal(Model model) {
		List<FarmerAnimalMappingResponseDto> list = farmerAnimalMappingService.getAllAnimal();
		model.addAttribute("farmerAnimal", list);
		return "animalMapping/all";
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable Long id, Model model, HttpSession session) {
		FarmerAnimalMappingResponseDto response = farmerAnimalMappingService.findById(id);
		model.addAttribute("animal", response);

		int branchId = (int) session.getAttribute("branchId");
		List<FarmerResponseDto> list = farmerService.findAllActiveFarmers(branchId);
		model.addAttribute("list", list);

		return "animalMapping/update";

	}

	@PostMapping("/update")
	public String update(@ModelAttribute FarmerAnimalMappingRequestDto dto, RedirectAttributes ra,
			HttpSession session) {

		int branchId = (int) session.getAttribute("branchId");
		dto.setBranchId(branchId);
		String response = farmerAnimalMappingService.updateAnimal(dto);
		if (response != null && response.equals(MessageConstants.UPDATE_ANIMAL_MAPPING_ERROR_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_ANIMAL_MAPPING_ERROR_SUCCESS_MESSAGE);
			return "redirect:/farmerAnimalMapping";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_ANIMAL_MAPPING_ERRORT_ERROR_MSG);
		return "redirect:/farmerAnimalMapping/" + dto.getId();

	}
}
