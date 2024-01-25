package com.dairy.service;

import java.util.List;

import com.dairy.dto.dairyManger.DairyManagerRequestDto;
import com.dairy.dto.dairyManger.DairyManagerResponseDto;
import com.dairy.dto.dairyMangerUpdates.DairyMangerUpdatesRequestDto;
import com.dairy.dto.dairyMangerUpdates.DairyMangerUpdatesResponseDto;

public interface DairyMangerService {

	String addDairy(DairyManagerRequestDto dto);

	List<DairyManagerResponseDto> getAllDairy();

	DairyManagerResponseDto findById(long id);

	String addDairyUpdates(DairyMangerUpdatesRequestDto dto);

	List<DairyMangerUpdatesResponseDto> getAllDairyUpdate();

}
