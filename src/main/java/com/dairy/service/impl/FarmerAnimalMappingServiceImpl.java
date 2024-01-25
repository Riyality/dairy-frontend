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

import com.dairy.dto.FarmerAnimalMapping.FarmerAnimalMappingRequestDto;
import com.dairy.dto.FarmerAnimalMapping.FarmerAnimalMappingResponseDto;
import com.dairy.service.FarmerAnimalMappingService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FarmerAnimalMappingServiceImpl implements FarmerAnimalMappingService {
	@Override
	public String addAnimal(FarmerAnimalMappingRequestDto requestDto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmerAnimalMapping";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<FarmerAnimalMappingRequestDto> request = new HttpEntity<>(requestDto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<FarmerAnimalMappingResponseDto> getAllAnimal() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmerAnimalMapping";

		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);

		try {
			ParameterizedTypeReference<List<FarmerAnimalMappingResponseDto>> responseType = new ParameterizedTypeReference<List<FarmerAnimalMappingResponseDto>>() {
			};
			ResponseEntity<List<FarmerAnimalMappingResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public FarmerAnimalMappingResponseDto findById(Long id) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmerAnimalMapping/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<FarmerAnimalMappingResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					FarmerAnimalMappingResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String updateAnimal(FarmerAnimalMappingRequestDto dto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/farmerAnimalMapping";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<FarmerAnimalMappingRequestDto> request = new HttpEntity<>(dto, headers);
		try {
			ResponseEntity<String> result = template.exchange(url, HttpMethod.PUT, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

}
