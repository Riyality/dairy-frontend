package com.dairy.dto.employee;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.dairy.dto.bankdetails.BankRequestDto;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class EmployeeRequestDto {
	private long id;
	private String name;
	private String contact;
	private String address;
	private int branchId;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime dateOfJoining;
	private String remark;
	private String role;
	private BankRequestDto bankRequestDto;
}
