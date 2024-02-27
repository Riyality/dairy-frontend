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

import com.dairy.dto.equipment.EquipmentRequestDto;
import com.dairy.dto.equipment.EquipmentResponseDto;
import com.dairy.service.EquipmentService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EquipmentServiceImpl implements EquipmentService {

	@Override
	public String addEquipment(EquipmentRequestDto equipmentRequestDto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/equipments";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<EquipmentRequestDto> request = new HttpEntity<>(equipmentRequestDto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<EquipmentResponseDto> getAllEquipments(int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/equipments/all/"+branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<EquipmentResponseDto>> responseType = new ParameterizedTypeReference<List<EquipmentResponseDto>>() {
			};
			ResponseEntity<List<EquipmentResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public EquipmentResponseDto findById(long id ,int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/equipments/" + id+"/"+branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<EquipmentResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					EquipmentResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String update(EquipmentRequestDto equipmentRequestDto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/equipments";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<EquipmentRequestDto> request = new HttpEntity<>(equipmentRequestDto, headers);
		try {
			ResponseEntity<String> result = template.exchange(url, HttpMethod.PUT, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

}
