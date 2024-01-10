package com.dairy.service;

import java.util.List;

import com.dairy.dto.advanceToFarmer.AdvanceToFarmerRequestDto;
import com.dairy.dto.advanceToFarmer.AdvanceToFarmerResponseDto;

public interface AdvanceToFarmerService {

	String addAdvance(AdvanceToFarmerRequestDto advanceRequestDto);

	List<AdvanceToFarmerResponseDto> getAllAdvance();

	AdvanceToFarmerResponseDto findByIdAdvance(Long id);

	String updateAdvance(AdvanceToFarmerRequestDto advanceRequestDto);

}
