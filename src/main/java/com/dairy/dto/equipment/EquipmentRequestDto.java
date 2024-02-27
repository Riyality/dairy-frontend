package com.dairy.dto.equipment;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EquipmentRequestDto {
	private Long id;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime dateOfPurchase;
	private Integer quantity;
	private Float price;
	private Float totalAmount;
	private int branchId;
	private String remark;

}
