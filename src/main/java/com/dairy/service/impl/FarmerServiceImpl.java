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

import com.dairy.dto.farmer.FarmerRequestDto;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.service.FarmerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FarmerServiceImpl implements FarmerService {

	@Override
	public String add(FarmerRequestDto dto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmers";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		dto.setStatus("Active");

		HttpEntity<FarmerRequestDto> request = new HttpEntity<>(dto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<FarmerResponseDto> findAllActiveFarmers(int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmers/branch/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FarmerResponseDto>> responseType = new ParameterizedTypeReference<List<FarmerResponseDto>>() {
			};
			ResponseEntity<List<FarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity, responseType);
			return res.getBody();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<FarmerResponseDto> farmersListRoutewise(int branchId, int routeId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmers/branch/" + branchId + "/route/" +routeId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FarmerResponseDto>> responseType = new ParameterizedTypeReference<List<FarmerResponseDto>>() {
			};
			ResponseEntity<List<FarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity, responseType);
			return res.getBody();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
