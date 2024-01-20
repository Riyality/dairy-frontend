package com.dairy.service;

import java.util.List;

import com.dairy.dto.milkRate.MilkRateRequestDto;

public interface MilkRateService {

	Float getMilkRateByTypeAndFatAndSNF(String type, float fat, float snf, int branchId);

	  String saveMilkRates(List<MilkRateRequestDto> milkRateList);

}
