package com.dairy.service;

import java.util.List;

import com.dairy.dto.feedToFarmer.FeedToFarmerRequestDto;
import com.dairy.dto.feedToFarmer.FeedToFarmerResponseDto;

public interface FeedToFarmerService {

	 public List<FeedToFarmerResponseDto> getAllFeedToFarmer();

	public String addFeedToFarmers(FeedToFarmerResponseDto feedToFarmerResponseDto);

	public FeedToFarmerResponseDto findByIdFeedToFarmer(Long id);

	public String updateFeedToFarmer(FeedToFarmerRequestDto feedToFarmerDto);

}
