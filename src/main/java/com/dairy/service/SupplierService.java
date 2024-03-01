package com.dairy.service;

import java.util.List;

import com.dairy.dto.Supplier.SupplierRequestDto;
import com.dairy.dto.Supplier.SupplierResponseDto;

public interface SupplierService {

	public String addSupplier(SupplierRequestDto supplierRequestDto);

	public List<SupplierResponseDto> getAllSupplier(int branchId);

	public SupplierResponseDto findById(long id, int branchId);

	public String updateSupplier(SupplierRequestDto supplierRequestDto);

}
