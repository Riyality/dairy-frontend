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

import com.dairy.dto.employee.EmployeeRequestDto;
import com.dairy.dto.employee.EmployeeResponseDto;
import com.dairy.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmployeeServiceImpl implements EmployeeService {
	@Override
	public String addEmployee(EmployeeRequestDto employeeRequestDto) {
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/employee";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<EmployeeRequestDto> request = new HttpEntity<>(employeeRequestDto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<EmployeeResponseDto> getAllEmployee(Integer branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/employee/all/"+branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<EmployeeResponseDto>> responseType = new ParameterizedTypeReference<List<EmployeeResponseDto>>() {
			};
			ResponseEntity<List<EmployeeResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public EmployeeResponseDto findById(long id ,Integer branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/employee/" + id+"/"+branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<EmployeeResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					EmployeeResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String updateEmployee(EmployeeRequestDto employeeRequestDto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/employee";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<EmployeeRequestDto> request = new HttpEntity<>(employeeRequestDto, headers);
		try {
			ResponseEntity<String> result = template.exchange(url, HttpMethod.PUT, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

}
