package com.dairy.service;

import java.util.List;

import com.dairy.dto.Supplier.SupplierRequestDto;
import com.dairy.dto.Supplier.SupplierResponseDto;

public interface SupplierService {

	public String addSupplier(SupplierRequestDto supplierRequestDto);

	public List<SupplierResponseDto> getAllSupplier();

	public SupplierResponseDto findById(long id);

	public String updateSupplier(SupplierRequestDto supplierRequestDto);

}
