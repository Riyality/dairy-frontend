package com.dairy.dto.dairyManger;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DairyManagerRequestDto {
	private Long id;
	private String name;
	private Integer personId;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime dateTransaction;
	private String transactionType;
	private String contact;
	private Long amount;
	private Long balance;
	private String remark;
}
