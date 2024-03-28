package com.dairy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dairy.service.LanguageService;

@Controller
@RequestMapping("/changeLanguage")
public class LanguageController {

	@Autowired
	private LanguageService languageservice;

	@GetMapping
	@ResponseBody
	public String changeLanguage(@RequestParam("lang") String lang, HttpSession session) {
		session.setAttribute("lang", lang);
		
		boolean result=languageservice.changeDefaultLanguage(lang);
		
		return "redirect:/";
	}

}
