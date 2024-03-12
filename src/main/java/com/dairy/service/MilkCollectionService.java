package com.dairy.service;

import java.time.LocalDate;
import java.util.List;

import com.dairy.dto.milkCollection.MilkCollectionRequestDto;
import com.dairy.dto.milkCollection.MilkCollectionResponseDto;

public interface MilkCollectionService {

	public String addMilkCollection(MilkCollectionRequestDto dto, int branchId);

	public List<MilkCollectionResponseDto> findByFromDateAndToDateAndAnimalType(LocalDate fromDate, LocalDate toDate,
			String animalType, String flag);

	public List<MilkCollectionResponseDto> getMilkCollectionDataByDate(int branchId, LocalDate dateOfCollection);

	public List<MilkCollectionResponseDto> getRecordsByFarmerId(Long farmerId);

	public List<MilkCollectionResponseDto> getRecordsByFarmerIdFromDateAndToDateAndAnimalType(long farmerId,
			String fromDate, String toDate, String animalType);

	public float getMilkCollectionDataByDate(String animalType, String shift, Integer branchId);

	public List<MilkCollectionResponseDto> getMilkCollectionDataByFromDateTodateMilktypeShiftAndBranchId(
			LocalDate fromDate, LocalDate toDate, String milkType, String shift, int branchId, String flagValue);

	public List<MilkCollectionResponseDto> getMilkCollectionDataByDateShiftTypeAndBranchId(int branchId, LocalDate selectedDate,
			String milkType, String shift);

}
