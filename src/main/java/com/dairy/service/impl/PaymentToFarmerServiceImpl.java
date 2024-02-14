package com.dairy.service.impl;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.dto.paymentToFarmer.PaymentToFarmerRequestDto;
import com.dairy.service.PaymentToFarmerService;

@Service
public class PaymentToFarmerServiceImpl implements PaymentToFarmerService{

	@Override
	public String addPayment(PaymentToFarmerRequestDto paymentToFarmerRequestDto) {
		
		RestTemplate template = new RestTemplate();
		   
		String url = "http://localhost:6262/paymentTofarmer/";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<PaymentToFarmerRequestDto> request = new HttpEntity<>( paymentToFarmerRequestDto, headers );
		try {
			ResponseEntity<String> result = template.postForEntity( url, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			//log.error( e.getMessage(), e );
		}
		return null;
		
		
	}

}
