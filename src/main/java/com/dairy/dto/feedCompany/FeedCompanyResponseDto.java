package com.dairy.dto.feedCompany;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FeedCompanyResponseDto {

	private Long id;
	private String name;
	private Long feedcompanyId;
	private int branchId;
	private String remark;
}
