package com.dairy.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.dto.branch.BranchRequestDto;
import com.dairy.dto.branch.BranchResponseDto;
import com.dairy.dto.route.RouteRequestDto;
import com.dairy.dto.route.RouteResponseDto;
import com.dairy.service.RouteService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RouteServiceImpl implements RouteService {

	@Override
	public String addRoute(RouteRequestDto dto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/routes";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<RouteRequestDto> request = new HttpEntity<>(dto, headers);
		
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<RouteResponseDto> getAllRoutes() {
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/routes"; 
		
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		
		try {
			ParameterizedTypeReference<List<RouteResponseDto>> responseType = new ParameterizedTypeReference<List<RouteResponseDto>>() {
			};
			ResponseEntity<List<RouteResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}

	@Override
	public RouteResponseDto findById(int id) {
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/routes/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<RouteResponseDto> res = template.exchange( url, HttpMethod.GET, entity, RouteResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}

	@Override
	public String update(RouteRequestDto dto) {
		
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/routes";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<RouteRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.PUT, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}


}
