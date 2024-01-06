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
import com.dairy.dto.Supplier.SupplierResponseDto;
import com.dairy.service.SupplierService;

@Controller
@RequestMapping("/suppliers")
public class SupplierController {
	@Autowired
	SupplierService supplierService;

	@GetMapping("/add-supplier-page")
	public String addSupplierPage() {
		return "suppliers/add";
	}

	@PostMapping
	public String addSupplier(@ModelAttribute SupplierRequestDto supplierRequestDto, Model model,
			RedirectAttributes ra) {

		String response = supplierService.addSupplier(supplierRequestDto);
		if (response != null && response.equals(MessageConstants.ADD_SUPPLIER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/suppliers";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_SUPPLIER_ERROR_MSG);
		return "suppliers/add";
	}

	@GetMapping
	public String getAllSuppliers(Model model) {
		List<SupplierResponseDto> list = supplierService.getAllSupplier();
		model.addAttribute("suppliers", list);
		return "suppliers/all";
	}

	@GetMapping("/{id}")
	public String getById(@PathVariable long id, Model model) {
		SupplierResponseDto response = supplierService.findById(id);
		model.addAttribute("suppliers", response);
		return "suppliers/update";
	}

	@PostMapping("/update")
	public String updateSupplier(@ModelAttribute SupplierRequestDto supplierRequestDto, RedirectAttributes ra) {
		String response = supplierService.updateSupplier(supplierRequestDto);
		if (response != null && response.equals(MessageConstants.UPDATE_SUPPLIER_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_SUPPLIER_SUCCESS_MESSAGE);
			return "redirect:/suppliers";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_SUPPLIER_ERROR_MSG);
		return "redirect:/suppliers/" + supplierRequestDto.getId();
	}

}
