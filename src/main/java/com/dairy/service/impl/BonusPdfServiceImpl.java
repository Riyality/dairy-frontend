package com.dairy.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.dairy.dto.bonusToFarmer.BonusToFarmerRequestDto;
import com.dairy.dto.bonusToFarmer.BonusToFarmerResponseDto;
import com.dairy.service.BonusPdfService;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BonusPdfServiceImpl implements BonusPdfService {

	@Override
	public void generatePdf(ServletOutputStream outputStream, List<BonusToFarmerResponseDto> list,
			List<String> encodedFarmerIds) {
		System.out.println("selected Farmer Ids" + encodedFarmerIds);

		try {
			for (BonusToFarmerResponseDto record : list) {
				System.out.println(record);
			}
			Document document = new Document();
			PdfWriter.getInstance(document, outputStream);
			document.open();
			Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
			Font cellFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
			Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

			for (String encodedFarmerId : encodedFarmerIds) {
				int farmerId = Integer.parseInt(encodedFarmerId);

				String farmerName = null;
				float TotalQuantity = 0;
				String branchName = null;
				String MilkType = null;
				float bonusPerLiter = 0;
				Date FormDate = null;
				Date ToDate = null;

				for (BonusToFarmerResponseDto dto : list) {
					if (dto.getFarmerId() == farmerId) {

						farmerName = dto.getFarmerName();
						TotalQuantity = dto.getTotalQuantity();
						MilkType = dto.getMilkType();
						bonusPerLiter = dto.getBonusAmountPerLiter();
						branchName = dto.getBranchName();
						FormDate = dto.getFromDate();
						ToDate = dto.getToDate();
					}
				}

				Paragraph title = new Paragraph(branchName, titleFont);
				title.setAlignment(Element.ALIGN_CENTER);
				document.add(title);

				Paragraph khata = new Paragraph("Khata No.:" + farmerId, cellFont);
				khata.setAlignment(Element.ALIGN_LEFT);
				Paragraph spacer1 = new Paragraph("                                                     ");

				Paragraph bill = new Paragraph("Bill Type.:" + MilkType);
				bill.setAlignment(Element.ALIGN_RIGHT);

				Phrase phrase1 = new Phrase();
				phrase1.add(khata);
				phrase1.add(spacer1);
				phrase1.add(spacer1);
				phrase1.add(bill);

				document.add(phrase1);

				Paragraph CustomeraName = new Paragraph("Customer Name." + farmerName);
				CustomeraName.setAlignment(Element.ALIGN_LEFT);

				Paragraph spacer2 = new Paragraph("                                       ");
				Paragraph date = new Paragraph("Date. " + FormDate + " To " + ToDate);
				date.setAlignment(Element.ALIGN_RIGHT);

				Phrase phrase2 = new Phrase();
				phrase2.add(CustomeraName);
				phrase2.add(spacer2);
				phrase2.add(spacer2);
				phrase2.add(date);

				document.add(phrase2);

				PdfPTable table = new PdfPTable(3);
				table.setWidths(new float[] { 1.5f, 1.5f, 1.5f });
				table.getDefaultCell().setBorderWidth(0);
				table.setWidthPercentage(100);

				table.addCell(new PdfPCell(new Phrase("Total Milk Collection (liters)", boldFont)));
				table.addCell(new PdfPCell(new Phrase("Bonus Amount Per Liter", boldFont)));
				table.addCell(new PdfPCell(new Phrase("Total Bonus Amount", boldFont)));

				table.addCell(new PdfPCell(new Phrase(String.valueOf(TotalQuantity), cellFont)));
				table.addCell(new PdfPCell(new Phrase(String.valueOf(bonusPerLiter), cellFont)));
				table.addCell(new PdfPCell(new Phrase(String.valueOf(bonusPerLiter * TotalQuantity), cellFont)));

				document.add(table);

				if (!encodedFarmerId.equals(encodedFarmerIds.get(encodedFarmerIds.size() - 1))) {
					document.newPage();
				}

			}

			document.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	@Override
	public String storeBonusRecords(BonusToFarmerRequestDto requestDto) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/bonusToFarmers";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<BonusToFarmerRequestDto> request = new HttpEntity<>(requestDto, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public List<BonusToFarmerResponseDto> findAllBonusRecords(int branchId) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/bonusToFarmers/branch/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		try {
			ParameterizedTypeReference<List<BonusToFarmerResponseDto>> responseType = new ParameterizedTypeReference<List<BonusToFarmerResponseDto>>() {
			};
			ResponseEntity<List<BonusToFarmerResponseDto>> res = template.exchange(url, HttpMethod.GET, entity,
					responseType);
			return res.getBody();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String storeBonusRecord(BonusToFarmerRequestDto dtoCopy) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:6262/bonusToFarmers";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<BonusToFarmerRequestDto> request = new HttpEntity<>(dtoCopy, headers);
		try {
			ResponseEntity<String> result = template.postForEntity(url, request, String.class);
			return result.getBody();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

}
