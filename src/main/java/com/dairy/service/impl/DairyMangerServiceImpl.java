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

import com.dairy.dto.dairyManger.DairyManagerRequestDto;
import com.dairy.dto.dairyManger.DairyManagerResponseDto;
import com.dairy.dto.dairyMangerUpdates.DairyMangerUpdatesRequestDto;
import com.dairy.dto.dairyMangerUpdates.DairyMangerUpdatesResponseDto;
import com.dairy.service.DairyMangerService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DairyMangerServiceImpl implements DairyMangerService {
	@Override
	public String addDairy(DairyManagerRequestDto dto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/dairyManger";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<DairyManagerRequestDto> request = new HttpEntity<>(dto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<DairyManagerResponseDto> getAllDairy() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/dairyManger";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<DairyManagerResponseDto>> responseType = new ParameterizedTypeReference<List<DairyManagerResponseDto>>() {
			};
			ResponseEntity<List<DairyManagerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return null;
	}

	@Override
	public DairyManagerResponseDto findById(long id) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/dairyManger/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<DairyManagerResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					DairyManagerResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}


	@Override
	public String addDairyUpdates(DairyMangerUpdatesRequestDto dto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/dairyManger/dairyUpdates";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<DairyMangerUpdatesRequestDto> request = new HttpEntity<>(dto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<DairyMangerUpdatesResponseDto> getAllDairyUpdate() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/dairyManger/dairyUpdates";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<DairyMangerUpdatesResponseDto>> responseType = new ParameterizedTypeReference<List<DairyMangerUpdatesResponseDto>>() {
			};
			ResponseEntity<List<DairyMangerUpdatesResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return null;
	}

}
