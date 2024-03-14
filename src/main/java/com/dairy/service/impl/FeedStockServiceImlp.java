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

import com.dairy.dto.feedDetails.FeedDetailsResponseDto;
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
	public List<FeedStockResponseDto> getAllFeedStock(int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedStock/all/"+branchId;
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
	public FeedStockResponseDto findById(int id ,int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedStock/" + id+"/"+branchId;
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


	@Override
	public long TotalfeedStockBybranchId(Integer branchId) {
		RestTemplate template = new RestTemplate();
	    String url = "http://localhost:6262/feedStock/totalQuantity/branch/" + branchId;
	    HttpHeaders headers = new HttpHeaders();
	    HttpEntity<String> entity = new HttpEntity<>("body", headers);
	    
	    try {
	        ResponseEntity<Long> res = template.exchange(url, HttpMethod.GET, entity, Long.class);
	            return res.getBody();
	         
	    } catch (Exception e) {
	        log.error("Error occurred while fetching count of Inactive farmers", e);
	    }
	    
	    return 0; 
	}



	@Override
	public String addFeedStocks(List<FeedStockRequestDto> feedStockRequestDtoList) {
		  RestTemplate template = new RestTemplate();
		    String url = "http://localhost:6262/feedStock";

		    HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);

		    HttpEntity<List<FeedStockRequestDto>> request = new HttpEntity<>(feedStockRequestDtoList, headers);
		    try {
		        ResponseEntity<String> result = template.exchange(url, HttpMethod.POST, request, String.class);
		        return result.getBody();
		    } catch (Exception e) {
		        log.error(e.getMessage(), e);
		    }
		    return null;
	}



	@Override
	public long getFeedQuantityByFeedTypeFeedCompanyAndBranch(long feedTypeId, long feedCompanyId, int branchId) {
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedStock/feedTypeId/"+feedTypeId+"/feedCompanyId/"+ feedCompanyId+"/Branch/"+ branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<Long> res = template.exchange(url, HttpMethod.GET, entity,
					long.class);
			Long feedQuantity = res.getBody();
	        
	       return feedQuantity;

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return 0;
	}



	@Override
	public List<FeedDetailsResponseDto> getAllFeedDetails(int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedStock/allFeedDetails/"+branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FeedDetailsResponseDto>> responseType = new ParameterizedTypeReference<List<FeedDetailsResponseDto>>() {
			};
			ResponseEntity<List<FeedDetailsResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return null;
	}

}
