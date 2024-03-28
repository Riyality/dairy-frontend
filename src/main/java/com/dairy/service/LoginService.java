package com.dairy.service;

import com.dairy.dto.login.LoginRequestDto;
import com.dairy.dto.login.LoginResponseDto;

public interface LoginService {
	public LoginResponseDto login( LoginRequestDto dto );

	
	
}
