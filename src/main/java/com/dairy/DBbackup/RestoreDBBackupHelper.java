package com.dairy.DBbackup;

import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dairy.dto.bankdetails.BankRequestDto;
import com.dairy.dto.branch.BranchRequestDto;
import com.dairy.dto.farmer.FarmerRequestDto;
import com.dairy.dto.feedCompany.FeedCompanyRequestDto;
import com.dairy.dto.route.RouteRequestDto;

@Service
public class RestoreDBBackupHelper {

	// check that file is of excel type or not
	public static boolean checkExcelFormat(MultipartFile file) {
		String contentType = file.getContentType();
		if (contentType.equals("application/vnd.ms-excel")) {
			return true;
		} else {
			return false;
		}
	}

////======== Start Branch Table =========

	public static List<BranchRequestDto> convertExcelToListOfBranch(InputStream inputStream) {
		List<BranchRequestDto> list = new ArrayList<>();
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
			HSSFSheet sheet = workbook.getSheet("branch");

			int rowNumber = 0;
			Iterator<Row> iterator = sheet.iterator();

			while (iterator.hasNext()) {
				Row row = iterator.next();

				if (rowNumber == 0) {
					rowNumber++;
					continue;
				}
				Iterator<Cell> cells = row.iterator();
				int cid = 0;
				BranchRequestDto dto = new BranchRequestDto();

				while (cells.hasNext()) {
					Cell cell = cells.next();

					switch (cid) {
					case 0:
						dto.setId((int) cell.getNumericCellValue());
						break;
					case 1:
						dto.setName(cell.getStringCellValue());
						break;
					case 2:
						dto.setAddress(cell.getStringCellValue());
						break;
					case 3:
						dto.setOwner(cell.getStringCellValue());
						break;
					case 4:
						String cellValue = cell.getStringCellValue();
						LocalDateTime dateTime = parseToLocalDateTime(cellValue);
						dto.setStartDate(dateTime);
						break;
					case 5:
						dto.setOwnerContact(cell.getStringCellValue());
						break;
					case 6:
						dto.setRemark(cell.getStringCellValue());
						break;
					default:
						break;
					}
					cid++;
				}
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
////======== End Branch Table =========

////======== Start Route Table =========

	public static List<RouteRequestDto> convertExcelToListOfRoute(InputStream inputStream) {
		List<RouteRequestDto> list = new ArrayList<>();
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
			HSSFSheet sheet = workbook.getSheet("Route");

			int rowNumber = 0;
			Iterator<Row> iterator = sheet.iterator();

			while (iterator.hasNext()) {
				Row row = iterator.next();

				if (rowNumber == 0) {
					rowNumber++;
					continue;
				}
				Iterator<Cell> cells = row.iterator();
				int cid = 0;
				RouteRequestDto dto = new RouteRequestDto();

				while (cells.hasNext()) {
					Cell cell = cells.next();

					switch (cid) {
					case 0:
						dto.setId((int) cell.getNumericCellValue());
						break;
					case 1:
						dto.setName(cell.getStringCellValue());
						break;
					case 2:
						dto.setRemark(cell.getStringCellValue());
						break;
					case 3:
						dto.setBranchId((int) cell.getNumericCellValue());
						break;
					default:
						break;
					}
					cid++;
				}
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

////======== End Route Table =========

////======== Start Farmer Table =========

	public static List<FarmerRequestDto> convertExcelToListOfFarmer(InputStream inputStream) {
		List<FarmerRequestDto> list = new ArrayList<>();
		try {

			HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
			HSSFSheet sheet = workbook.getSheet("farmers");

			int rowNumber = 0;
			Iterator<Row> iterator = sheet.iterator();

			while (iterator.hasNext()) {
				Row row = iterator.next();

				if (rowNumber == 0) {
					rowNumber++;
					continue;
				}

				Iterator<Cell> cells = row.iterator();

				int cid = 0;

				FarmerRequestDto dto = new FarmerRequestDto();

				while (cells.hasNext()) {
					Cell cell = cells.next();

					switch (cid) {
					case 0:
						dto.setId((long) cell.getNumericCellValue());
						break;
					case 1:
						dto.setName(cell.getStringCellValue());
						break;
					case 2:
						String cellValue = cell.getStringCellValue();
						LocalDateTime dateTime = parseToLocalDateTime(cellValue);
						dto.setDateOfRegistration(dateTime);
						break;
					case 3:
						dto.setContact(cell.getStringCellValue());
						break;
					case 4:
						dto.setRoute((int) cell.getNumericCellValue());
						break;
					case 5:
						dto.setAddress(cell.getStringCellValue());
						break;
					case 6:
						dto.setStatus(cell.getStringCellValue());
						break;
					case 7:
						double bankInfo = cell.getNumericCellValue();
						Long idValue = (long) bankInfo;
						BankRequestDto bankRequestDto = new BankRequestDto();
						bankRequestDto.setId(idValue);
						dto.setBankRequestDto(bankRequestDto);
						break;
					case 8:
						dto.setBranchId((int) cell.getNumericCellValue());
						break;
					case 9:
						dto.setRemark(cell.getStringCellValue());
						break;
					default:
						break;
					}
					cid++;
				}
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

////======== End Farmer Table =========

////======== Common Method AllTable =========
	private static LocalDateTime parseToLocalDateTime(String value) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		return LocalDateTime.parse(value, formatter);
	}

	public static List<FeedCompanyRequestDto> convertExcelToListOfFeedCompany(InputStream inputStream) {
		List<FeedCompanyRequestDto> list = new ArrayList<>();
		try {

			HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
			HSSFSheet sheet = workbook.getSheet("Feed_Company");

			int rowNumber = 0;
			Iterator<Row> iterator = sheet.iterator();

			while (iterator.hasNext()) {
				Row row = iterator.next();

				if (rowNumber == 0) {
					rowNumber++;
					continue;
				}

				Iterator<Cell> cells = row.iterator();

				int cid = 0;

				FeedCompanyRequestDto dto = new FeedCompanyRequestDto();

				while (cells.hasNext()) {
					Cell cell = cells.next();

					switch (cid) {
					case 0:
						dto.setId((long) cell.getNumericCellValue());
						break;
					case 1:
						dto.setName(cell.getStringCellValue());
						break;
					case 2:
						dto.setBranchId((int) cell.getNumericCellValue());
						break;
					case 3:
						dto.setRemark(cell.getStringCellValue());
						break;
					case 4:
						dto.setRemark(cell.getStringCellValue());
						break;
					default:
						break;
					}
					cid++;
				}
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
