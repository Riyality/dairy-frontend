package com.dairy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dairy.dto.feedCompany.FeedCompanyRequestDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;

@Service
public interface FeedCompanyService {

	public String addFeedCompany(FeedCompanyRequestDto dto) ;

	public List<FeedCompanyResponseDto> getAllFeedCompany();

	
	

}
