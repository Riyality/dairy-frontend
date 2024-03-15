package com.dairy.DBbackup;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Date;
import java.time.Instant;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dairy.dto.branch.BranchResponseDto;
import com.dairy.dto.farmer.FarmerResponseDto;
import com.dairy.dto.feedCompany.FeedCompanyResponseDto;
import com.dairy.dto.feedType.FeedTypeResponseDto;
import com.dairy.dto.route.RouteResponseDto;
import com.dairy.service.BranchService;
import com.dairy.service.FarmerService;
import com.dairy.service.FeedCompanyService;
import com.dairy.service.FeedTypeService;
import com.dairy.service.RouteService;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

@Service
public class GetDBbackupHelper {
	
	@Autowired
	private BranchService branchService;
	
	@Autowired
	private FarmerService farmerService;
	
	@Autowired
	private RouteService routeService;
	
	@Autowired
	public FeedCompanyService feedCompanyService;
	
	@Autowired
	FeedTypeService feedTypeService;
	
	public void generateExcel(HttpServletResponse response ,HttpSession session) throws Exception {
		
		int branchId = (int) session.getAttribute("branchId");
		
		List<BranchResponseDto> branchlist = branchService.getAllBranches();
		List<RouteResponseDto> RouteList = routeService.getAllRoutes(branchId);
		List<FarmerResponseDto> FarmerResponseDto = farmerService.findAllActiveFarmers(branchId);
		List<FeedCompanyResponseDto> FeedCompanylist =feedCompanyService.getAllFeedCompany(branchId);
//		List<FeedTypeResponseDto> feedTypelist = feedTypeService.getAllFeedTypes(branchId);
		

		HSSFWorkbook workbook = new HSSFWorkbook();
		
		Font boldFont = workbook.createFont();
		boldFont.setBold(true);
		
		CellStyle centeredStyle = workbook.createCellStyle();
        centeredStyle.setAlignment(HorizontalAlignment.CENTER);
        centeredStyle.setFont(boldFont);
        
//       ======== Start Branch Table =========
        HSSFSheet branch = workbook.createSheet("branch");
        HSSFRow dataRowBranch = branch.createRow(0);
        
        dataRowBranch.createCell(0).setCellValue("id");
        dataRowBranch.createCell(1).setCellValue("name");
        dataRowBranch.createCell(2).setCellValue("address");
        dataRowBranch.createCell(3).setCellValue("owner");
        dataRowBranch.createCell(4).setCellValue("start_date");
        dataRowBranch.createCell(5).setCellValue("owner_contact");
        dataRowBranch.createCell(6).setCellValue("remark");	
        
        int dataRowIndexBranch = 1;

		for (BranchResponseDto branchEntity : branchlist) {
			
			HSSFRow dataRowbranch = branch.createRow(dataRowIndexBranch);
			
			dataRowbranch.createCell(0).setCellValue(branchEntity.getId());
			dataRowbranch.createCell(1).setCellValue(branchEntity.getName());
			dataRowbranch.createCell(2).setCellValue(branchEntity.getAddress());
			dataRowbranch.createCell(3).setCellValue(branchEntity.getOwner());
			dataRowbranch.createCell(4).setCellValue(branchEntity.getStartDate().toString());
			dataRowbranch.createCell(5).setCellValue(branchEntity.getOwnerContact());
			dataRowbranch.createCell(6).setCellValue(branchEntity.getRemark());
			
			dataRowIndexBranch++;
		}
//      ======== End Branch Table ===========
		
//      ======== Start Route Table =========
		
		HSSFSheet Route = workbook.createSheet("Route");
	    HSSFRow dataRowRoute = Route.createRow(0);

	    dataRowRoute.createCell(0).setCellValue("id");
	    dataRowRoute.createCell(1).setCellValue("name");
	    dataRowRoute.createCell(2).setCellValue("remark");
	    dataRowRoute.createCell(3).setCellValue("branch");
        
        int dataRowIndexRoute = 1;
        
        for (RouteResponseDto RouteEntity : RouteList) {
			HSSFRow dataRowRoute1 = Route.createRow(dataRowIndexRoute);	
			
			dataRowRoute1.createCell(0).setCellValue(RouteEntity.getId());
			dataRowRoute1.createCell(1).setCellValue(RouteEntity.getName());
			dataRowRoute1.createCell(2).setCellValue(RouteEntity.getRemark());
			dataRowRoute1.createCell(3).setCellValue(RouteEntity.getBranchId());
			
			dataRowIndexRoute++;
		}
//      ======== End Route Table ============
//        
//      ======== Start Farmer Table =========
		HSSFSheet farmers = workbook.createSheet("farmers");
        HSSFRow dataRowfarmers = farmers.createRow(0);

        dataRowfarmers.createCell(0).setCellValue("id");
        dataRowfarmers.createCell(1).setCellValue("name");
        dataRowfarmers.createCell(2).setCellValue("date_of_registration");
        dataRowfarmers.createCell(3).setCellValue("contact");
        dataRowfarmers.createCell(4).setCellValue("route");
        dataRowfarmers.createCell(5).setCellValue("address");
        dataRowfarmers.createCell(6).setCellValue("status");
        dataRowfarmers.createCell(7).setCellValue("bank");
        dataRowfarmers.createCell(8).setCellValue("branch");
        dataRowfarmers.createCell(9).setCellValue("remark");		

		int dataRowIndexfarmer = 1;

		for (FarmerResponseDto farmer : FarmerResponseDto) {
			HSSFRow dataRow = farmers.createRow(dataRowIndexfarmer);
			
			dataRow.createCell(0).setCellValue(farmer.getId());
			dataRow.createCell(1).setCellValue(farmer.getName());
			dataRow.createCell(2).setCellValue(farmer.getDateOfRegistration().toString());
			dataRow.createCell(3).setCellValue(farmer.getContact());
			dataRow.createCell(4).setCellValue(farmer.getRoute().getId());
			dataRow.createCell(5).setCellValue(farmer.getAddress());
			dataRow.createCell(6).setCellValue(farmer.getStatus());
			dataRow.createCell(7).setCellValue(farmer.getBank().getId());
			dataRow.createCell(8).setCellValue(farmer.getBranchId());
			dataRow.createCell(9).setCellValue(farmer.getRemark());
			dataRowIndexfarmer++;
		}
		
////      ======== End Farmer Table =========
		
////      ======== Start Feed Company Table =========
		HSSFSheet FeedCompany = workbook.createSheet("Feed_Company");
        HSSFRow dataRowFeedCompany = FeedCompany.createRow(0);
        
        dataRowFeedCompany.createCell(0).setCellValue("id");
        dataRowFeedCompany.createCell(1).setCellValue("name");
        dataRowFeedCompany.createCell(2).setCellValue("branch");
        dataRowFeedCompany.createCell(3).setCellValue("remark");
		
        int dataRowIndexFeedCompany = 1;
        
        for (FeedCompanyResponseDto feedCompanyResponseDto : FeedCompanylist) {
			HSSFRow dataRowFeedCompany1 = FeedCompany.createRow(dataRowIndexFeedCompany);
			
			dataRowFeedCompany1.createCell(0).setCellValue(feedCompanyResponseDto.getId());
			dataRowFeedCompany1.createCell(1).setCellValue(feedCompanyResponseDto.getName());
			dataRowFeedCompany1.createCell(2).setCellValue(feedCompanyResponseDto.getBranchId());
			dataRowFeedCompany1.createCell(3).setCellValue(feedCompanyResponseDto.getRemark());
			dataRowIndexFeedCompany++;
        }
        
////      ======== End Feed Company Table =========
//        
////      ======== Start Feed Type Table =========
//        HSSFSheet feedType = workbook.createSheet("Feed_Type");
//        HSSFRow dataRowfeedType = feedType.createRow(0);
//        
//        dataRowfeedType.createCell(0).setCellValue("id");
//        dataRowfeedType.createCell(1).setCellValue("type");
//        dataRowfeedType.createCell(2).setCellValue("feed_company");
//        dataRowfeedType.createCell(2).setCellValue("branch");
//        dataRowfeedType.createCell(3).setCellValue("remark");
//     
//        int dataRowIndexfeedType = 1;
//        
//        for (FeedTypeResponseDto feedTypeResponseDto : feedTypelist) {
//			HSSFRow dataRowFeedtype1 = feedType.createRow(dataRowIndexfeedType);
//			
//			dataRowFeedtype1.createCell(0).setCellValue(feedTypeResponseDto.getId());
//			dataRowFeedtype1.createCell(1).setCellValue(feedTypeResponseDto.getType());
//			dataRowFeedtype1.createCell(2).setCellValue(feedTypeResponseDto.getFeedCompanyId());
//			dataRowFeedtype1.createCell(2).setCellValue(feedTypeResponseDto.getBranchId());
//			dataRowFeedtype1.createCell(3).setCellValue(feedTypeResponseDto.getRemark());
//			dataRowIndexfeedType++;
//        }
        
		ServletOutputStream ops = response.getOutputStream();
		workbook.write(ops);
		workbook.close();
		ops.close();

		
	}

	

}