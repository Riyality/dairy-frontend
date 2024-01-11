package com.dairy.dto.mainBranch;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MainBranchRequestDto {
	private Long id;
    private String name;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime dateOfCollection;
	private String shift;
	private String type;
	private Float quantity;
	private Float fat;
	private Float snf;
	private Float protein ;
	private Float rate;
	private Float totalAmount;

}
