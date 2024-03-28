package com.dairy.service;

import java.util.List;

import com.dairy.dto.FarmerAnimalMapping.FarmerAnimalMappingRequestDto;
import com.dairy.dto.FarmerAnimalMapping.FarmerAnimalMappingResponseDto;

public interface FarmerAnimalMappingService {

	String addAnimal(FarmerAnimalMappingRequestDto requestDto);

	List<FarmerAnimalMappingResponseDto> getAllAnimal(int branchId);

	FarmerAnimalMappingResponseDto findById(Long id);

	String updateAnimal(FarmerAnimalMappingRequestDto dto);

	

}
