package com.dairy.service;

import java.util.List;

import com.dairy.dto.milkRate.MilkRateResponseDto;

public interface MilkRateService {

	Float getMilkRateByTypeAndFatAndSNF(String type, float fat, float snf, int branchId);

}
