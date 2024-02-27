package com.dairy.service;

import java.util.List;

import com.dairy.dto.equipment.EquipmentRequestDto;
import com.dairy.dto.equipment.EquipmentResponseDto;

public interface EquipmentService {

	public String addEquipment(EquipmentRequestDto equipmentRequestDto);

	public List<EquipmentResponseDto> getAllEquipments(int branchId);

	public EquipmentResponseDto findById(long id, int branchId);

	public String update(EquipmentRequestDto equipmentRequestDto);

}
