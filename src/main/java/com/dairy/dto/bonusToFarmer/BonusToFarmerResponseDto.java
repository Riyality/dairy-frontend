package com.dairy.dto.bonusToFarmer;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BonusToFarmerResponseDto {
	private int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd ")
	private Date fromDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd ")
	private Date toDate;
	private float totalQuantity;
	private float bonusAmountPerLiter;
	private float totalBonusAmount;
	private String milkType;
	private Long farmerId;
	private String farmerName;
	private int branchId;
	private String branchName;

}
