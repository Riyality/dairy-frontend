package com.dairy.service;

import java.time.LocalDate;
import java.util.List;

import com.dairy.dto.paymentToFarmer.PaymentToFarmerRequestDto;
import com.dairy.dto.paymentToFarmer.PaymentToFarmerResponseDto;

public interface PaymentToFarmerService {

	String addPayment(PaymentToFarmerRequestDto paymentToFarmerRequestDto);

	List<PaymentToFarmerResponseDto> getAllPaymentList(int branchId);

	List<PaymentToFarmerResponseDto> getPaymentListBetweenFromDateAndToDate(LocalDate fromDate, LocalDate toDate, String milkType,
			Integer branchId, String flag);

	

}
