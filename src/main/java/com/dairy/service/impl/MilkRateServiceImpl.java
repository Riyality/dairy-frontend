package com.dairy.service.impl;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.service.MilkRateService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MilkRateServiceImpl implements MilkRateService {
	

	@Override
	public Float getMilkRateByTypeAndFatAndSNF(String type, float fat, float snf, int branchId) {
			
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/milkRate/type/" + type + "/fat/" + fat + "/snf/" +snf + "/branchId/" +branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<Float> responseType = new ParameterizedTypeReference<Float>() {
			};
			ResponseEntity<Float> res = template.exchange(url, HttpMethod.GET, entity, responseType);
			return res.getBody();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0.0f;
	}


}
