package com.dairy.dto.dairyMangerUpdates;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DairyMangerUpdatesRequestDto {
	private Long id;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime dateTransaction;
	private String transactionType;
	private Float balance;
	private String remark;
	private Long dairyMangerId;

}
