package com.dairy.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.dto.employee.EmployeeResponseDto;
import com.dairy.dto.milkCollection.MilkCollectionRequestDto;
import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.dairy.service.MilkCollectionService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MilkCollectionServiceImpl implements MilkCollectionService {

	@Override
	public String addMilkCollection(MilkCollectionRequestDto dto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/milkCollection";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<MilkCollectionRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.postForEntity( url, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			log.error( e.getMessage(), e );
		}
		return null;
	}

	@Override
	public List<MilkCollectionResponseDto> getMilkCollectionDataByDate(int branchId, LocalDate dateOfCollection) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/milkCollection/branchId/"+branchId+"/dateOfCollection/"+dateOfCollection;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<MilkCollectionResponseDto>> responseType = new ParameterizedTypeReference<List<MilkCollectionResponseDto>>() {
			};
			ResponseEntity<List<MilkCollectionResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}


}
