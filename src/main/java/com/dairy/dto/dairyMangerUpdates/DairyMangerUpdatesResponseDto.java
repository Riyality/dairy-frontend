package com.dairy.dto.dairyMangerUpdates;

import java.time.LocalDateTime;

import com.dairy.dto.dairyManger.DairyManagerResponseDto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DairyMangerUpdatesResponseDto {
	private Long id;
	private LocalDateTime dateTransaction;
	private String transactionType;
	private Float balance;
	private String remark;
	private DairyManagerResponseDto  dairyManagerResponseDto;


}
