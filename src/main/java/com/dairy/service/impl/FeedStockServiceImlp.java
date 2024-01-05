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

import com.dairy.dto.feedStock.FeedStockRequestDto;
import com.dairy.dto.feedStock.FeedStockResponseDto;
import com.dairy.service.FeedStockService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FeedStockServiceImlp implements FeedStockService {

	@Override
	public String addFeedStock(FeedStockRequestDto feedStockRequestDto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedStock";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<FeedStockRequestDto> request = new HttpEntity<>(feedStockRequestDto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<FeedStockResponseDto> getAllFeedStock() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedStock";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FeedStockResponseDto>> responseType = new ParameterizedTypeReference<List<FeedStockResponseDto>>() {
			};
			ResponseEntity<List<FeedStockResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return null;
	}

	@Override
	public FeedStockResponseDto findById(int id) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedStock/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<FeedStockResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					FeedStockResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String updateFeed(FeedStockRequestDto feedStockRequestDto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/feedStock";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<FeedStockRequestDto> request = new HttpEntity<>(feedStockRequestDto, headers);
		try {
			ResponseEntity<String> result = template.exchange(url, HttpMethod.PUT, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

}
