package com.dairy.dto.feedToFarmer;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FeedToFarmerRequestDto {
	
	private Long id;
	
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private LocalDate dateOfPurchase;
	
	private Integer quantity;
	private Float feedRate;
	private Float totalAmount;
	private Float paidAmount;
	private Float remainingAmount;
	private String remark;
	private Long farmerId;
	private Integer branchId;
	private Long feedCompanyId;
	private Long feedTypeId;
	
	

}
