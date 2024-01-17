package com.dairy.dto.feedStock;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedStockRequestDto {

	private int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime dateOfPurchase;
	private Float feedCostPerUnit;
	private int quantity;
	private Float totalAmount;
	private long supplierId;
	private long feedTypeId;
	private long feedCompanyId;
	private int branchId;
}