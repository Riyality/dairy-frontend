package com.dairy.service.impl;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.dto.login.LoginRequestDto;
import com.dairy.dto.login.LoginResponseDto;
import com.dairy.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LoginServiceImpl implements LoginService {

	@Override
	public LoginResponseDto login( LoginRequestDto dto ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/logins";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<LoginRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<LoginResponseDto> result = template.postForEntity( url, request, LoginResponseDto.class );
			return result.getBody();
		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}

}
