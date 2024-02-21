package com.dairy.dto.feedType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FeedTypeResponseDto {
	private Long id;
	private String type;
	private Long feedCompanyId;
	private String feedCompanyName;
	private int branchId;
	private String remark;
}
