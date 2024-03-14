package com.dairy.dto.bonusToFarmer;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BonusToFarmerRequestDto {
	private int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate toDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate fromDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate bonusDate;
	private float totalQuantity;
	private float bonusAmountPerLiter;
	private float totalBonusAmount;
	private String milkType;
	private Long farmerId;
	private int branchId;
	private List<Long> selectedFarmerIds;

}
