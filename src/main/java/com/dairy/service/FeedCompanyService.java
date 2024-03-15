package com.dairy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dairy.dto.equipment.EquipmentResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyRequestDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;

@Service
public interface FeedCompanyService {

	public String addFeedCompany(FeedCompanyRequestDto dto) ;

	public List<FeedCompanyResponseDto> getAllFeedCompany( int branchId);

	public FeedCompanyResponseDto findById(long id, int branchId);

	public String updateFeedCompany(FeedCompanyRequestDto dto);

	public FeedCompanyRequestDto saveAll(List<FeedCompanyRequestDto> feedCompany);

	

	
	

}
