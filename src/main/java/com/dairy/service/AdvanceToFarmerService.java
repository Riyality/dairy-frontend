package com.dairy.service;

import java.util.List;

import com.dairy.dto.advanceToFarmer.AdvanceToFarmerRequestDto;
import com.dairy.dto.advanceToFarmer.AdvanceToFarmerResponseDto;

public interface AdvanceToFarmerService {

	String addAdvance(AdvanceToFarmerRequestDto advanceRequestDto);

	List<AdvanceToFarmerResponseDto> getAllAdvance(int branchId);

	AdvanceToFarmerResponseDto findByIdAdvance(Long id, int branchId);

	String updateAdvance(AdvanceToFarmerRequestDto advanceRequestDto);

	Double findTotalOfRemainingAmountByFarmerIdAndBranchId(Long farmerId, int branchId);

}
