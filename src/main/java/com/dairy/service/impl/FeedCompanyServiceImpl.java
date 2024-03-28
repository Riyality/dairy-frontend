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

import com.dairy.dto.equipment.EquipmentResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyRequestDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.dto.feedStock.FeedStockRequestDto;
import com.dairy.dto.feedStock.FeedStockResponseDto;
import com.dairy.dto.route.RouteRequestDto;
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
	public List<FeedCompanyResponseDto> getAllFeedCompany( int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedcompany/all/"+branchId; 
		
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

	@Override
	public FeedCompanyResponseDto findById(long id , int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedcompany/" + id+"/"+branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<FeedCompanyResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					FeedCompanyResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String updateFeedCompany(FeedCompanyRequestDto dto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/feedcompany";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<FeedCompanyRequestDto> request = new HttpEntity<>(dto, headers);
		try {
			ResponseEntity<String> result = template.exchange(url, HttpMethod.PUT, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public FeedCompanyRequestDto saveAll(List<FeedCompanyRequestDto> feedCompany) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedcompany/saveAll";
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<List<FeedCompanyRequestDto>> request = new HttpEntity<>(feedCompany, headers);
		try {
			ResponseEntity<FeedCompanyRequestDto> result = template.exchange(url, HttpMethod.POST, request, FeedCompanyRequestDto.class);
			return result.getBody();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	

}
