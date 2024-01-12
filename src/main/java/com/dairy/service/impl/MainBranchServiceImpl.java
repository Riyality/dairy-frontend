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

import com.dairy.dto.branch.BranchRequestDto;
import com.dairy.dto.branch.BranchResponseDto;
import com.dairy.dto.mainBranch.MainBranchRequestDto;
import com.dairy.dto.mainBranch.MainBranchResponseDto;
import com.dairy.service.MainBranchService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MainBranchServiceImpl implements MainBranchService {

	@Override
	public String addMainBranch(MainBranchRequestDto responseDto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/mainBranchs";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<MainBranchRequestDto> request = new HttpEntity<>( responseDto, headers );
		try {
			ResponseEntity<String> result = template.postForEntity( url, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}


	@Override
	public List<MainBranchResponseDto> getAllMainBranches() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/mainBranchs";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<MainBranchResponseDto>> responseType = new ParameterizedTypeReference<List<MainBranchResponseDto>>() {
			};
			ResponseEntity<List<MainBranchResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return null;
	}

	@Override
	public MainBranchResponseDto findByIdmainBranch(long id) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/mainBranchs/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<MainBranchResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					MainBranchResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String updateMainBranch(MainBranchRequestDto dto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/mainBranchs";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<MainBranchRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.PUT, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}
	}


