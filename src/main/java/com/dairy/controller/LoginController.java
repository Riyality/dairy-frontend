package com.dairy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dairy.dto.login.LoginRequestDto;
import com.dairy.dto.login.LoginResponseDto;
import com.dairy.service.LoginService;

@Controller
@RequestMapping( "/logins" )
public class LoginController {

	@Autowired
	private LoginService loginService;

	@GetMapping( "/login-page" )
	public String loginPage() {
		return "login";
	}

	@PostMapping
	public String login( @ModelAttribute LoginRequestDto dto, Model model, HttpSession session ) {
		LoginResponseDto response = loginService.login( dto );
		if ( response != null ) {
			session.setAttribute( "loginId", response.getLoginId() );
			session.setAttribute( "name", response.getName() );
			session.setAttribute( "role", response.getRole() );
			session.setAttribute( "username", response.getUsername() );
			session.setAttribute( "branchId", response.getBranchId() );
			session.setAttribute( "branchName", response.getBranchName() );
			return "index";
		}
		model.addAttribute( "errorMsg", "invalid cred..." );
		return "login";
	}
}
