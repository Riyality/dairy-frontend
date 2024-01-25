package com.dairy.service;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import com.dairy.dto.milkCollection.MilkCollectionRequestDto;
import com.dairy.dto.milkCollection.MilkCollectionResponseDto;

public interface MilkCollectionService {

	public String addMilkCollection(MilkCollectionRequestDto dto) ;

	public List<MilkCollectionResponseDto> findByFromDateAndToDateAndAnimalType(Date string,
			Date string2, String animalType);

}
