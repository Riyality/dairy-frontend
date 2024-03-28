package com.dairy.service;

import java.time.LocalDate;
import java.util.List;

import com.dairy.dto.feedToFarmer.FeedToFarmerRequestDto;
import com.dairy.dto.feedToFarmer.FeedToFarmerResponseDto;

public interface FeedToFarmerService {

	 public List<FeedToFarmerResponseDto> getAllFeedToFarmer(int branchId);

	public String addFeedToFarmers(FeedToFarmerRequestDto feedToFarmerResponseDto);

	public FeedToFarmerResponseDto findByIdFeedToFarmer(Long id);

	public String updateFeedToFarmer(FeedToFarmerRequestDto feedToFarmerDto);

	public Double findTotalOfRemainingAmountByFarmerIdAndBranchId(Long farmerId, int branchId);

	public List<FeedToFarmerResponseDto> getDatewiseRecords(LocalDate fromDate, LocalDate toDate, int branchId, String flag);

	

}
