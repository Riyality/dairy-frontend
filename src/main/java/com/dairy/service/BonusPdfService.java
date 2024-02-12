package com.dairy.service;

import java.util.List;

import javax.servlet.ServletOutputStream;

import com.dairy.dto.bonusToFarmer.BonusToFarmerRequestDto;
import com.dairy.dto.bonusToFarmer.BonusToFarmerResponseDto;

public interface BonusPdfService {

	void generatePdf(ServletOutputStream outputStream, List<BonusToFarmerResponseDto> list, List<String> encodedFarmerIds);

	public	String storeBonusRecords(BonusToFarmerRequestDto requestDto);

	List<BonusToFarmerResponseDto> findAllBonusRecords(int branchId);

	public String storeBonusRecord(BonusToFarmerRequestDto dtoCopy);
}
