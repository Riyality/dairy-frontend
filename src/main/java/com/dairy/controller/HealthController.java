package com.dairy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HealthController {

	@GetMapping("/")
	public String healthCheck() {

		return "login";
	}
}
