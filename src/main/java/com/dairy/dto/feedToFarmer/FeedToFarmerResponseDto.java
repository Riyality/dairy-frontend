package com.dairy.dto.feedToFarmer;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FeedToFarmerResponseDto {
	private Long id;

	@DateTimeFormat( pattern = "yyyy-MM-dd'T'HH:mm" )
	private Date dateOfPurchase;
	private Integer quantity;
	private Float feedRate;
	private Float totalAmount;
	private Float paidAmount;
	private Float remainingAmount;
	private String paymentStatus;
	private String remark;
	private Integer branchId;	
	private Long farmerId;
	private String farmerName;	
	private Long feedCompanyId;
	private String feedCompanyName;	
	private Long feedTypeId;
	private String feedTypeName;

}
