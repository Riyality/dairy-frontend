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

import com.dairy.dto.farmer.FarmerRequestDto;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.service.FarmerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FarmerServiceImpl implements FarmerService {

	@Override
	public String add(FarmerRequestDto dto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmers";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		dto.setStatus("Active");

		HttpEntity<FarmerRequestDto> request = new HttpEntity<>(dto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<FarmerResponseDto> findAllActiveFarmers(int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmers/branch/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FarmerResponseDto>> responseType = new ParameterizedTypeReference<List<FarmerResponseDto>>() {
			};
			ResponseEntity<List<FarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity, responseType);
			return res.getBody();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<FarmerResponseDto> farmersListRoutewise(int branchId, int routeId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmers/branch/" + branchId + "/route/" + routeId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FarmerResponseDto>> responseType = new ParameterizedTypeReference<List<FarmerResponseDto>>() {
			};
			ResponseEntity<List<FarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity, responseType);
			return res.getBody();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public FarmerResponseDto findById(Long id, int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmers/id/"+ id+"/"+branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {

			ResponseEntity<FarmerResponseDto> res = template.exchange(url, HttpMethod.GET, entity,
					FarmerResponseDto.class);
			return res.getBody();

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public String update(FarmerRequestDto dto) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/farmers";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<FarmerRequestDto> request = new HttpEntity<>(dto, headers);
		try {
			ResponseEntity<String> result = template.exchange(url, HttpMethod.PUT, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<FarmerResponseDto> findAllInActiveFarmers(int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/farmers/in-ActiveFarmers/branch/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<FarmerResponseDto>> responseType = new ParameterizedTypeReference<List<FarmerResponseDto>>() {
			};
			ResponseEntity<List<FarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity, responseType);
			return res.getBody();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*@Override
	public long countActiveFarmersByBranchId(int branchId) {
	    RestTemplate template = new RestTemplate();
	    String url = "http://localhost:6262/farmers/countActiveFarmers/branch/" + branchId;
	    HttpHeaders headers = new HttpHeaders();
	    HttpEntity<String> entity = new HttpEntity<>("body", headers);
	    try {
	        ResponseEntity<Long> res = template.exchange(url, HttpMethod.GET, entity, Long.class);
	        return res.getBody();
	    } catch (Exception e) {
	        log.error(e.getMessage(), e);
	    }
	    return 0; 
	}

*/
	
	
	@Override
	public long countActiveFarmersByBranchId(int branchId) {
	    RestTemplate template = new RestTemplate();
	    String url = "http://localhost:6262/farmers/countActiveFarmers/branch/" + branchId;
	    HttpHeaders headers = new HttpHeaders();
	    HttpEntity<String> entity = new HttpEntity<>("body", headers);
	    
	    try {
	        ResponseEntity<Long> res = template.exchange(url, HttpMethod.GET, entity, Long.class);
	            return res.getBody();
	         
	    } catch (Exception e) {
	        log.error("Error occurred while fetching count of active farmers", e);
	    }
	    
	    return 0; 
	}
	
	@Override
	public long countInActiveFarmersByBranchId(int branchId) {
		 RestTemplate template = new RestTemplate();
		    String url = "http://localhost:6262/farmers/countInActiveFarmers/branch/" + branchId;
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

}
