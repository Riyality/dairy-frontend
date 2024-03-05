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

import com.dairy.dto.paymentToFarmer.PaymentToFarmerRequestDto;
import com.dairy.dto.paymentToFarmer.PaymentToFarmerResponseDto;
import com.dairy.service.PaymentToFarmerService;

@Service
public class PaymentToFarmerServiceImpl implements PaymentToFarmerService {

	@Override
	public String addPayment(PaymentToFarmerRequestDto paymentToFarmerRequestDto) {

		RestTemplate template = new RestTemplate();

		String url = "http://localhost:6262/paymentTofarmer/";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<PaymentToFarmerRequestDto> request = new HttpEntity<>(paymentToFarmerRequestDto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			// log.error( e.getMessage(), e );
		}
		return null;
	}

	@Override
	public List<PaymentToFarmerResponseDto> getAllPaymentList(int branchId) {
		try {
			RestTemplate template = new RestTemplate();
			String url = "http://localhost:6262/paymentTofarmer/all/" + branchId;

			HttpHeaders headers = new HttpHeaders();
			HttpEntity<String> entity = new HttpEntity<>("body", headers);
			ParameterizedTypeReference<List<PaymentToFarmerResponseDto>> responseType = new ParameterizedTypeReference<List<PaymentToFarmerResponseDto>>() {
			};

			ResponseEntity<List<PaymentToFarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);

			if (res != null && res.getBody() != null) {
				return res.getBody();
			} else {

			}
		} catch (Exception e) {
				e.printStackTrace();

		}
		return null;
	}

	@Override
	public List<PaymentToFarmerResponseDto> getPaymentListBetweenFromDateAndToDate(LocalDate fromDate, LocalDate toDate,
			String milkType, Integer branchId,String flag) {
		
		
		try {
			RestTemplate template = new RestTemplate();
			String url = "http://localhost:6262/paymentTofarmer/datewise/"+fromDate +"/"+ toDate+"/"+milkType+"/"+branchId+"/"+flag;

			HttpHeaders headers = new HttpHeaders();
			HttpEntity<String> entity = new HttpEntity<>("body", headers);
			ParameterizedTypeReference<List<PaymentToFarmerResponseDto>> responseType = new ParameterizedTypeReference<List<PaymentToFarmerResponseDto>>() {
			};

			ResponseEntity<List<PaymentToFarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);

			if (res != null && res.getBody() != null) {
				return res.getBody();
			} else {

			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		return null;
	}

}
