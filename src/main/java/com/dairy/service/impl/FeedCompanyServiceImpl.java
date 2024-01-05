package com.dairy.service.impl;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.dto.feedCompany.FeedCompanyRequestDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.service.FeedCompanyService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FeedCompanyServiceImpl implements FeedCompanyService {

	@Override
	public String addFeedCompany(FeedCompanyRequestDto dto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedcompany";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );
		
		HttpEntity<FeedCompanyRequestDto>  request = new HttpEntity<>(dto,headers);
		try {
			ResponseEntity<String> result = template.postForEntity( url, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}

	@Override
	public List<FeedCompanyResponseDto> getAllFeedCompany() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedcompany"; 
		
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		
		try {
			ParameterizedTypeReference<List<FeedCompanyResponseDto>> responseType = new ParameterizedTypeReference<List<FeedCompanyResponseDto>>() {
			};
			ResponseEntity<List<FeedCompanyResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}

}
