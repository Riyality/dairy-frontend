package com.dairy.service;

import java.util.List;

import com.dairy.dto.farmer.FarmerRequestDto;
import com.dairy.dto.farmer.FarmerResponseDto;

public interface FarmerService {

	String add( FarmerRequestDto dto );

	List<FarmerResponseDto> findAllActiveFarmers( int branchId );

	List<FarmerResponseDto> farmersListRoutewise(int branchId, int routeId);

	FarmerResponseDto findById(Long id, int branchId);

	String update(FarmerRequestDto dto);

	List<FarmerResponseDto> findAllInActiveFarmers(int branchId);

	long countActiveFarmersByBranchId(int branchId);

	long countInActiveFarmersByBranchId(int branchId);

}
