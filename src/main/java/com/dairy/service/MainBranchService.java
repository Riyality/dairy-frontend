package com.dairy.service;

import java.util.List;

import com.dairy.dto.branch.BranchResponseDto;
import com.dairy.dto.mainBranch.MainBranchRequestDto;
import com.dairy.dto.mainBranch.MainBranchResponseDto;

public interface MainBranchService {
	
	public String addMainBranch(MainBranchRequestDto requestDto);

	public List<MainBranchResponseDto> getAllMainBranches();

	public MainBranchResponseDto findByIdmainBranch(long id);

	public String updateMainBranch(MainBranchRequestDto dto);

}
