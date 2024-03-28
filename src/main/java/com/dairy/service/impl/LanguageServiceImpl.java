package com.dairy.service.impl;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.service.LanguageService;

import java.util.Map;

@Service
public class LanguageServiceImpl implements LanguageService {

    @Override
    public String getDefaultLanguage() {
        RestTemplate template = new RestTemplate();
        String url = "http://localhost:6262/language";
        HttpHeaders headers = new HttpHeaders();
        HttpEntity<String> entity = new HttpEntity<>("body", headers);
        
        try {
            ResponseEntity<Map<String, String>> response = template.exchange(url, HttpMethod.GET, entity, 
                    ParameterizedTypeReference.forType(Map.class));
            
            if (response.getStatusCode().is2xxSuccessful()) {
                Map<String, String> responseBody = response.getBody();
                if (responseBody != null) {
                    return responseBody.get("language");
                }
            }
        } catch (Exception e) {
            // log.error(e.getMessage(), e);
        }
        return null;
    }

    @Override
    public boolean changeDefaultLanguage(String lang) {
    	  RestTemplate template = new RestTemplate();
        String url = "http://localhost:6262/language/" + lang;
        HttpHeaders headers = new HttpHeaders();
        HttpEntity<String> entity = new HttpEntity<>("body", headers);

        try {
            ResponseEntity<String> response = template.exchange(url, HttpMethod.PUT, entity, String.class);

            if (response.getStatusCode().is2xxSuccessful()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            // Log the exception
          
        }
		return false;
    }
}
