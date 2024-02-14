package com.dairy.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import com.dairy.dto.milkCollection.MilkCollectionRequestDto;
import com.dairy.dto.milkCollection.MilkCollectionResponseDto;

public interface MilkCollectionService {

	public String addMilkCollection(MilkCollectionRequestDto dto, int branchId) ;

	public List<MilkCollectionResponseDto> findByFromDateAndToDateAndAnimalType(Date string,
			Date string2, String animalType);

	public List<MilkCollectionResponseDto> getMilkCollectionDataByDate(int branchId, LocalDate dateOfCollection);

	public List<MilkCollectionResponseDto> getRecordsByFarmerId(Long farmerId);

	public List<MilkCollectionResponseDto> getRecordsByFarmerIdFromDateAndToDateAndAnimalType(long farmerId,
			String fromDate, String toDate, String animalType);


}
