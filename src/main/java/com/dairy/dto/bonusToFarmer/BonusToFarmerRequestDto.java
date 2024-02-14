package com.dairy.dto.bonusToFarmer;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BonusToFarmerRequestDto {
	private int id;
	private Date toDate;
	private Date fromDate;
	private float totalQuantity;
	private float bonusAmountPerLiter;
	private float totalBonusAmount;
	private String milkType;
	private Long farmerId;
	private int branchId;
	private List<Long> selectedFarmerIds;

}
