package com.dairy.service.impl;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.dto.Supplier.SupplierRequestDto;
import com.dairy.dto.Supplier.SupplierResponseDto;
import com.dairy.dto.equipment.EquipmentRequestDto;
import com.dairy.dto.equipment.EquipmentResponseDto;
import com.dairy.service.SupplierService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SupplierServiceImpl  implements SupplierService{

	@Override
	public String addSupplier(SupplierRequestDto supplierRequestDto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/suppliers";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<SupplierRequestDto> request = new HttpEntity<>(supplierRequestDto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<SupplierResponseDto> getAllSupplier() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/suppliers";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<SupplierResponseDto>> responseType = new ParameterizedTypeReference<List<SupplierResponseDto>>() {
			};
			ResponseEntity<List<SupplierResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public SupplierResponseDto findById(long id) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/suppliers/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<SupplierResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					SupplierResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String updateSupplier(SupplierRequestDto supplierRequestDto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/suppliers";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<SupplierRequestDto> request = new HttpEntity<>(supplierRequestDto, headers);
		try {
			ResponseEntity<String> result = template.exchange(url, HttpMethod.PUT, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}
	

}
