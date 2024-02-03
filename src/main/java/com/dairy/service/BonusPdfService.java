package com.dairy.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.springframework.stereotype.Service;

import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class BonusPdfService {

	public void generatePdf(ServletOutputStream outputStream, List<MilkCollectionResponseDto> list, String fromDate,
			String toDate, List<String> encodedFarmerIds, String milkType, float bonusPerLiter) {
		System.out.println(list + "" + encodedFarmerIds);

		try {
			for (MilkCollectionResponseDto record : list) {
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
			//String MilkType = null;
			
			int TotalQuantity = 0;
			int TotalAmount = 0;
			String branchName=null;

			 for (MilkCollectionResponseDto dto : list) {
                 if (dto.getFarmerId() == farmerId) {
                     farmerName = dto.getFarmerName();
                    // MilkType = dto.getAnimalType();
                     TotalQuantity += dto.getMilkQuantity();
                     TotalAmount += dto.getTotalMilkAmount();
                     branchName=dto.getBranchName();
                 }
             }
			

			System.out.println("TotalQuantity" + TotalQuantity + "TotalAmount:" + TotalAmount);

			Paragraph title = new Paragraph(branchName, titleFont);
			title.setAlignment(Element.ALIGN_CENTER);
			document.add(title);

			LocalDate from = LocalDate.parse(fromDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			LocalDate to = LocalDate.parse(toDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			String displayFromDate = from.format(DateTimeFormatter.ofPattern("dd-MM"));
			String displayToDate = to.format(DateTimeFormatter.ofPattern("dd-MM"));

			Paragraph khata = new Paragraph("Khata No.:" + farmerId, cellFont);
			khata.setAlignment(Element.ALIGN_LEFT);
			Paragraph spacer1 = new Paragraph("                                                     ");

			Paragraph bill = new Paragraph("Bill Type.:" + milkType);
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
			Paragraph date = new Paragraph("Date. " + displayFromDate + " To " + displayToDate);
			date.setAlignment(Element.ALIGN_RIGHT);

			Phrase phrase2 = new Phrase();
			phrase2.add(CustomeraName);
			phrase2.add(spacer2);
			phrase2.add(spacer2);
			phrase2.add(date);

			document.add(phrase2);

			PdfPTable table = new PdfPTable(4);
			table.setWidths(new float[] { 1.5f, 1.5f, 1.5f, 1.5f });
			table.getDefaultCell().setBorderWidth(0);
			table.setWidthPercentage(100);

			table.addCell(new PdfPCell(new Phrase("Total Amount", boldFont)));
			table.addCell(new PdfPCell(new Phrase("Total Milk Collection (liters)", boldFont)));
			table.addCell(new PdfPCell(new Phrase("Bonus Amount Per Liter", boldFont)));
			table.addCell(new PdfPCell(new Phrase("Total Bonus Amount", boldFont)));

			table.addCell(new PdfPCell(new Phrase(String.valueOf(TotalAmount), cellFont)));
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
}
	
	