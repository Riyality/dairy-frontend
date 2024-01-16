package com.dairy.dto.feedToFarmer;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FeedToFarmerRequestDto {
	private Long id;
	
	@DateTimeFormat( pattern = "yyyy-MM-dd'T'HH:mm" )
	private LocalDateTime dateOfPurchase;
	
	private Integer quantity;
	private Float feedRate;
	private Float totalAmount;
	private String paymentStatus;
	private String remark;
	private Long farmerId;
	private Integer branchId;
	private Long feedCompanyId;
	private Long feedTypeId;

}
