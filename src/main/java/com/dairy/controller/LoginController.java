package com.dairy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dairy.dto.login.LoginRequestDto;
import com.dairy.dto.login.LoginResponseDto;
import com.dairy.service.FarmerService;
import com.dairy.service.FeedStockService;
import com.dairy.service.LanguageService;
import com.dairy.service.LoginService;
import com.dairy.service.MilkCollectionService;

@Controller
@RequestMapping("/logins")
public class LoginController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private FarmerService farmerService;

	@Autowired
	private FeedStockService feedStockService;

	@Autowired
	private MilkCollectionService milkCollectionService;
	@Autowired
    private MessageSource messageSource;
	@Autowired
    private  LanguageService languageservice;

	@GetMapping("/login-page")
	public String loginPage() {
		return "login";
	}
	

	@PostMapping
	public String login(@ModelAttribute LoginRequestDto dto, Model model, HttpSession session,ModelAndView modelAndView) {
		LoginResponseDto response = loginService.login(dto);
		
		if (response !=null) {
			session.setAttribute("loginId", response.getLoginId());
			session.setAttribute("name", response.getName());
			session.setAttribute("role", response.getRole());
			session.setAttribute("username", response.getUsername());
			session.setAttribute("branchId", response.getBranchId());
			session.setAttribute("branchName", response.getBranchName());

			 addMessagesToModel(model, session);
			 return "index";
		}
		model.addAttribute("errorMsg", "invalid cred...");
		return "login";
	}

	private void addMessagesToModel(Model model, HttpSession session) {
		String DefaultLang=languageservice.getDefaultLanguage();
		session.setAttribute("lang", DefaultLang);
	    String lang = (String) session.getAttribute("lang");
	    if (lang == null) {
	        lang = "en"; // Default language
	    }
	    int numOfMessages = 259; // Assuming you have 259 messages
	    List<String> messages = new ArrayList<>();
	    for (int i = 1; i <= numOfMessages; i++) {
	        String messageKey = "message" + i;
	        String message = messageSource.getMessage(messageKey, null, Locale.forLanguageTag(lang));
	        messages.add(message);
	    }
	    model.addAttribute("messages", messages);
	}
	
	@ModelAttribute
	public String countFarmersAndTotalFeedStock(Model model, HttpSession session) {
		Integer branchId = (Integer) session.getAttribute("branchId");
		if (branchId != null) {
			long activeFarmersCount = farmerService.countActiveFarmersByBranchId(branchId);
			model.addAttribute("activeFarmersCount", activeFarmersCount);

			long inActiveFarmersCount = farmerService.countInActiveFarmersByBranchId(branchId);
			model.addAttribute("inActiveFarmersCount", inActiveFarmersCount);
			
			long totalFeedStock = feedStockService.TotalfeedStockBybranchId(branchId);
			model.addAttribute("totalFeedStock", totalFeedStock);
			return "index";
		}
		return null;
	}

	@ModelAttribute
	public String todaymilkCollection(Model model, HttpSession session) {
		Integer branchId = (Integer) session.getAttribute("branchId");

		if (branchId != null) {

			float cowMorningMilkCollection = milkCollectionService.getMilkCollectionDataByDate("Cow", "Morning",branchId);
			model.addAttribute("cowMorningMilkCollection", cowMorningMilkCollection);

			float cowEveningMilkCollection = milkCollectionService.getMilkCollectionDataByDate("Cow", "Evening",branchId);
			model.addAttribute("cowEveningMilkCollection", cowEveningMilkCollection);

			float buffaloMorningMilkCollection = milkCollectionService.getMilkCollectionDataByDate("Buffalo", "Morning",branchId);
			model.addAttribute("buffaloMorningMilkCollection", buffaloMorningMilkCollection);

			float buffaloEveningMilkCollection = milkCollectionService.getMilkCollectionDataByDate("Buffalo", "Evening",branchId);
			model.addAttribute("buffaloEveningMilkCollection", buffaloEveningMilkCollection);
			return "index";
		}
		return null;
	}

	
	@GetMapping("/index")
	public String indexPage() {
	    return "index";
	}
}
