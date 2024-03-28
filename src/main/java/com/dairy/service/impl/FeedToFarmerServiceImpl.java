package com.dairy.service.impl;

import java.time.LocalDate;
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

import com.dairy.dto.feedToFarmer.FeedToFarmerRequestDto;
import com.dairy.dto.feedToFarmer.FeedToFarmerResponseDto;
import com.dairy.service.FeedToFarmerService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FeedToFarmerServiceImpl implements FeedToFarmerService {
	@Override
	public List<FeedToFarmerResponseDto> getAllFeedToFarmer(int branchId) {

		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedTofarmers/branch/"+ branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FeedToFarmerResponseDto>> responseType = new ParameterizedTypeReference<List<FeedToFarmerResponseDto>>() {
			};
			ResponseEntity<List<FeedToFarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return null;
	}



	@Override
	public String addFeedToFarmers(FeedToFarmerRequestDto dto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedTofarmers";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<FeedToFarmerRequestDto> request = new HttpEntity<>(dto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}



	@Override
	public FeedToFarmerResponseDto findByIdFeedToFarmer(Long id) {
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedTofarmers/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<FeedToFarmerResponseDto> res = template.exchange( url, HttpMethod.GET, entity, FeedToFarmerResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}
	
	@Override
	public String updateFeedToFarmer(FeedToFarmerRequestDto feedToFarmerDto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/feedTofarmers";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<FeedToFarmerRequestDto> request = new HttpEntity<>(feedToFarmerDto, headers);
		try {
			ResponseEntity<String> result = template.exchange(url, HttpMethod.PUT, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}



	@Override
	public Double findTotalOfRemainingAmountByFarmerIdAndBranchId(Long farmerId, int branchId) {
	
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedTofarmers/" + farmerId+"/"+branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<Double> res = template.exchange(url, HttpMethod.GET, entity,
					Double.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}



	@Override
	public List<FeedToFarmerResponseDto> getDatewiseRecords(LocalDate fromDate, LocalDate toDate, int branchId,String flag) {
	
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/feedTofarmers/datewiseFeed/"+fromDate+"/"+toDate+"/"+branchId+"/"+flag;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FeedToFarmerResponseDto>> responseType = new ParameterizedTypeReference<List<FeedToFarmerResponseDto>>() {
			};
			ResponseEntity<List<FeedToFarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
		
	}




}




