package com.dairy.dto.milkCollection;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MilkCollectionResponseDto {
	private int farmerId;
	private String farmerName;
	private String animalType;
	private String shift;
	private Float milkQuantity;
	private Float milkFat;
	private Float milkSNF;
	private Float milkRate;
	private Float totalMilkAmount;
	private String remark;
	private LocalDate dateOfMilkCollection;
	private String branchName;
}
