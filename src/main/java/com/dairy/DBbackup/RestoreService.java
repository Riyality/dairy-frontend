package com.dairy.DBbackup;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dairy.dto.branch.BranchRequestDto;
import com.dairy.dto.farmer.FarmerRequestDto;
import com.dairy.dto.feedCompany.FeedCompanyRequestDto;
import com.dairy.dto.route.RouteRequestDto;
import com.dairy.service.BranchService;
import com.dairy.service.FarmerService;
import com.dairy.service.FeedCompanyService;
import com.dairy.service.FeedTypeService;
import com.dairy.service.RouteService;

@Service
public class RestoreService {

	@Autowired
	private FarmerService farmerService;

	@Autowired
	private BranchService branchService;

	@Autowired
	private RouteService routeService;
	
	@Autowired
	public FeedCompanyService feedCompanyService;
	
	@Autowired
	FeedTypeService feedTypeService;

	public void saveBranch(MultipartFile file) {
		try {
			List<BranchRequestDto> branch = RestoreDBBackupHelper.convertExcelToListOfBranch(file.getInputStream());
			branchService.saveAll(branch);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void saveRoute(MultipartFile file) {
		try {
			List<RouteRequestDto> route = RestoreDBBackupHelper.convertExcelToListOfRoute(file.getInputStream());
			routeService.saveAll(route);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void saveFarmer(MultipartFile file) {
		try {
			List<FarmerRequestDto> farmer = RestoreDBBackupHelper.convertExcelToListOfFarmer(file.getInputStream());
			farmerService.saveAll(farmer);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void saveFeedCompany(MultipartFile file) {
		try {
			List<FeedCompanyRequestDto> feedCompany = RestoreDBBackupHelper.convertExcelToListOfFeedCompany(file.getInputStream());
			feedCompanyService.saveAll(feedCompany);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
