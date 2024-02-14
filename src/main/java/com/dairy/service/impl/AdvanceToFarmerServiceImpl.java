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

import com.dairy.dto.advanceToFarmer.AdvanceToFarmerRequestDto;
import com.dairy.dto.advanceToFarmer.AdvanceToFarmerResponseDto;
import com.dairy.service.AdvanceToFarmerService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdvanceToFarmerServiceImpl implements AdvanceToFarmerService {
	@Override
	public String addAdvance(AdvanceToFarmerRequestDto advanceRequestDto) {
		
		//advanceRequestDto.setRemainingAmount(null);
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/advanceToFarmer";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<AdvanceToFarmerRequestDto> request = new HttpEntity<>(advanceRequestDto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<AdvanceToFarmerResponseDto> getAllAdvance() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/advanceToFarmer";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<AdvanceToFarmerResponseDto>> responseType = new ParameterizedTypeReference<List<AdvanceToFarmerResponseDto>>() {
			};
			ResponseEntity<List<AdvanceToFarmerResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}

		return null;
	}

	@Override
	public AdvanceToFarmerResponseDto findByIdAdvance(Long id) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/advanceToFarmer/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<AdvanceToFarmerResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					AdvanceToFarmerResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String updateAdvance(AdvanceToFarmerRequestDto advanceRequestDto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/advanceToFarmer";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<AdvanceToFarmerRequestDto> request = new HttpEntity<>( advanceRequestDto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.PUT, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}

	@Override
	public Double findTotalOfRemainingAmountByFarmerIdAndBranchId(Long farmerId, int branchId) {
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/advanceToFarmer/" + farmerId+"/"+branchId;
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

}
