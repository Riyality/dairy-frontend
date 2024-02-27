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
import com.dairy.dto.employee.EmployeeRequestDto;
import com.dairy.dto.employee.EmployeeResponseDto;
import com.dairy.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/add-employee-page")
	public String addBranchPage() {
		return "employees/add";
	}

	@PostMapping
	public String addEmployee(@ModelAttribute EmployeeRequestDto employeeRequestDto, Model model, RedirectAttributes ra,
			HttpSession session) {
		int branchId = (int) session.getAttribute("branchId");
		employeeRequestDto.setBranchId(branchId);
		String response = employeeService.addEmployee(employeeRequestDto);
		if (response != null && response.equals(MessageConstants.ADD_EMPLOYEE_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", response);
			return "redirect:/employee";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.ADD_EMPLOYEE_ERROR_MSG);
		return "employees/add";
	}

	@GetMapping
	public String getAllEmployee(Model model ,HttpSession session) {
		
		String user = ( String ) session.getAttribute( "username" );
		
		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			List<EmployeeResponseDto> list = employeeService.getAllEmployee(branchId);
				 model.addAttribute("employee", list);
				 return "employees/all";
		}
		return "login";
	}

	@GetMapping("/{id}")
	public String getById(@PathVariable long id, Model model ,HttpSession session) {
		
		String user = ( String ) session.getAttribute( "username" );
		
		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			EmployeeResponseDto response = employeeService.findById(id ,branchId);
			model.addAttribute("employee", response);
			return "employees/update";
	}
		return "login";
}

	@PostMapping("/update")
	public String updateEquipments(@ModelAttribute EmployeeRequestDto employeeRequestDto, RedirectAttributes ra,
			HttpSession session) {
		int branchId = (int) session.getAttribute("branchId");
		employeeRequestDto.setBranchId(branchId);
		String response = employeeService.updateEmployee(employeeRequestDto);
		if (response != null && response.equals(MessageConstants.UPDATE_EMPLOYEE_SUCCESS_MESSAGE)) {
			ra.addFlashAttribute("successMessage", MessageConstants.UPDATE_EMPLOYEE_SUCCESS_MESSAGE);
			return "redirect:/employee";
		}
		ra.addFlashAttribute("errorMessage", MessageConstants.UPDATE_EMPLOYEE_ERROR_MSG);
		return "redirect:/employee/" + employeeRequestDto.getId();
	}

}
