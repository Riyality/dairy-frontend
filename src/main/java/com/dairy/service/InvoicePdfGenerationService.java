package com.dairy.service;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
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
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class InvoicePdfGenerationService {

	public void generatePdf(ServletOutputStream outputStream, List<MilkCollectionResponseDto> list, String fromDate, String toDate) {
		try {
			
			Document document = new Document();
			PdfWriter.getInstance(document, outputStream);
			document.open();
			Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
			Font cellFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
			Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

			//String marathiFontPath = "C:/Windows/Fonts/Tiro Devanagari Marathi";
			// Create a BaseFont object with the Marathi font
			//String marathiFontPath = "C:/Users/Admin/Desktop/New folder/Kruti_Dev_010.ttf";
			//BaseFont marathiBaseFont = BaseFont.createFont(marathiFontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED, BaseFont.CACHED);
			//Font marathiFont = new Font(marathiBaseFont, 16);

			String BranchName=null;
			String farmerName=null;
			String MilkType=null;
			
			int customerId=0;
			 for (MilkCollectionResponseDto dto : list) {
				 farmerName = dto.getFarmerName();
				 MilkType=dto.getAnimalType();
				 customerId=dto.getFarmerId();
				 BranchName=dto.getBranchName();
				 }
			
			//Paragraph title = new Paragraph("egky{eh nq/k laLFkk", marathiFont);
			Paragraph title = new Paragraph(BranchName, titleFont);
			title.setAlignment(Element.ALIGN_CENTER);
			document.add(title);
			
			 LocalDate from = LocalDate.parse(fromDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			 LocalDate to = LocalDate.parse(toDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			 String displayFromDate = from.format(DateTimeFormatter.ofPattern("dd/MM/yy"));
			 String displayToDate = to.format(DateTimeFormatter.ofPattern("dd/MM/yy"));
			
			
			

			Paragraph khata = new Paragraph("Khata No:"+customerId, cellFont);
			khata.setAlignment(Element.ALIGN_LEFT);
			Paragraph spacer1 = new Paragraph("                                                          ");

			// Second paragraph (right-aligned)
			Paragraph bill = new Paragraph("Bill Type: " +MilkType);
			bill.setAlignment(Element.ALIGN_RIGHT);

			// Create a Phrase to group both paragraphs
			Phrase phrase1 = new Phrase();
			phrase1.add(khata);
			phrase1.add(spacer1);
			phrase1.add(spacer1);
			phrase1.add(bill);

			// Add the Phrase to the PDF
			document.add(phrase1);
			
			Paragraph CustomeraName = new Paragraph(" Name:"+farmerName);
			CustomeraName.setAlignment(Element.ALIGN_LEFT);
			// document.add(CustomeraName);
 
			Paragraph spacer2 = new Paragraph("                                            ");
			Paragraph date = new Paragraph("Date:"+displayFromDate+" To "+displayToDate);
			date.setAlignment(Element.ALIGN_RIGHT);

			Phrase phrase2 = new Phrase();
			phrase2.add(CustomeraName);
			phrase2.add(spacer2);
			phrase2.add(spacer2);
			phrase2.add(date);

			document.add(phrase2);

			document.add(new Paragraph("\n"));
			//document.add(new Paragraph("\n"));

			Paragraph Morning = new Paragraph("Morning");
			 Morning.setIndentationLeft(80);
			// document.add(Morning);

			Paragraph spacer3 = new Paragraph("                                         ");
			Paragraph spacer4 = new Paragraph("                               ");
			Paragraph Evening = new Paragraph("Evening");

			Paragraph Total = new Paragraph("Total");

			Phrase phrase3 = new Phrase();
			phrase3.add(spacer4);
			phrase3.add(Morning);
			phrase3.add(spacer3);
			phrase3.add(Evening);
			phrase3.add(spacer3);
			phrase3.add(Total);
			phrase3.add(spacer3);
			document.add(phrase3);

			
			PdfPTable table = new PdfPTable(13);
		    table.setWidthPercentage(100);
		    table.setWidths(new float[] { 1.5f, 1.5f, 1.5f, 1.5f, 1.5f, 3f, 1.5f, 1.5f, 1.5f, 1.5f, 3f, 1.7f, 2.5f });
		    table.getDefaultCell().setBorderWidth(0);

		    PdfPCell c1 = new PdfPCell(new Phrase("Date", boldFont));
		    c1.setBorderWidth(0);
		    table.addCell(c1);

		    PdfPCell c2 = new PdfPCell(new Phrase("Litre", boldFont));
		    c2.setBorderWidth(0);
		    table.addCell(c2);

		    PdfPCell c3 = new PdfPCell(new Phrase("Fat", boldFont));
		    c3.setBorderWidth(0);
		    table.addCell(c3);

		    PdfPCell c4 = new PdfPCell(new Phrase("SNF", boldFont));
		    c4.setBorderWidth(0);
		    table.addCell(c4);

		    PdfPCell c5 = new PdfPCell(new Phrase("Rate", boldFont));
		    c5.setBorderWidth(0);
		    table.addCell(c5);

		    PdfPCell c6 = new PdfPCell(new Phrase("Amount", boldFont));
		    c6.setBorderWidth(0);
		    table.addCell(c6);

		    PdfPCell c7 = new PdfPCell(new Phrase("Litre", boldFont));
		    c7.setBorderWidth(0);
		    table.addCell(c7);

		    PdfPCell c8 = new PdfPCell(new Phrase("Fat", boldFont));
		    c8.setBorderWidth(0);
		    table.addCell(c8);

		    PdfPCell c9 = new PdfPCell(new Phrase("SNF", boldFont));
		    c9.setBorderWidth(0);
		    table.addCell(c9);

		    PdfPCell c10 = new PdfPCell(new Phrase("Rate", boldFont));
		    c10.setBorderWidth(0);
		    table.addCell(c10);

		    PdfPCell c11 = new PdfPCell(new Phrase("Amount", boldFont));
		    c11.setBorderWidth(0);
		    table.addCell(c11);

		    PdfPCell c12 = new PdfPCell(new Phrase("Litre", boldFont));
		    c12.setBorderWidth(0);
		    table.addCell(c12);

		    PdfPCell c13 = new PdfPCell(new Phrase("Amount", boldFont));
		    c13.setBorderWidth(0);
		    table.addCell(c13);
		   
		    // Separate the list into Morning and Evening records
		    List<MilkCollectionResponseDto> morningRecords = new ArrayList<>();
		    List<MilkCollectionResponseDto> eveningRecords = new ArrayList<>();

		    for (MilkCollectionResponseDto dto : list) {
		        if ("Morning".equalsIgnoreCase(dto.getShift())) {
		            morningRecords.add(dto);
		        } else if ("Evening".equalsIgnoreCase(dto.getShift())) {
		            eveningRecords.add(dto);
		        }
		    }
		    
		    double morningTotalLitre = 0;//Rows sum of Litre
		    double morningTotalAmount = 0;//Rows sum Amount
		    double eveningTotalLitre = 0;
		    double eveningTotalAmount = 0;
		    double totalLitreMorningShift = 0;//Column Total litre
		   
		    double totalAmountMorinigShift = 0;
		    
		    double totalLitreEveningShift = 0;
		    double totalAmountEveningShift = 0;
		    double averageRateMorningShift = 0;
		    double averageRateEveningShift = 0;
		    float averageFatMorningShift = 0;
		    float averageFatEveningShift = 0;
		    float averageSnfMorningShift = 0;
		    float averageSnfEveningShift = 0;
		    int snfCountMorning=0;
		    int snfCountEvening=0;
		    int fatCountMorning=0;
		    int fatCountEvening=0;
		    int rateCountMorning = 0;
		    int rateCountEvening = 0;
		    // Create a new row for each date
		    for (int i = 0; i < Math.max(morningRecords.size(), eveningRecords.size()); i++) {
		        if (i < morningRecords.size()) {
		            MilkCollectionResponseDto morningRecord = morningRecords.get(i);
		            LocalDate currentDate = morningRecord.getDateOfMilkCollection();
		            // Update morning totals
		            totalLitreMorningShift += morningRecord.getMilkQuantity();		            
		            totalAmountMorinigShift+=morningRecord.getTotalMilkAmount();
		            averageRateMorningShift += morningRecord.getMilkRate();
		            averageFatMorningShift+=morningRecord.getMilkFat();
		            averageSnfMorningShift+=morningRecord.getMilkSNF();
		            snfCountMorning++;
		            fatCountMorning++;
		            rateCountMorning++;
		            morningTotalLitre = morningRecord.getMilkQuantity();
		            morningTotalAmount = morningRecord.getTotalMilkAmount();
		            table.addCell(createCellWithFont(currentDate, cellFont));
		            table.addCell(createCellWithFont(String.valueOf(morningRecord.getMilkQuantity()), cellFont));
		            table.addCell(createCellWithFont(String.valueOf(morningRecord.getMilkFat()), cellFont));
		            table.addCell(createCellWithFont(String.valueOf(morningRecord.getMilkSNF()), cellFont));
		            table.addCell(createCellWithFont(String.valueOf(morningRecord.getMilkRate()), cellFont));
		            table.addCell(createCellWithFont(String.valueOf(morningRecord.getTotalMilkAmount()), cellFont));
		        } else {
		        	
		            // Add empty cells for Morning
		            for (int j = 0; j < 6; j++) {
		                table.addCell(createCellWithFont("", cellFont));
		            }
		        }           
		        if (i < eveningRecords.size()) {
		            MilkCollectionResponseDto eveningRecord = eveningRecords.get(i);
		            // Add cells for Evening
		            eveningTotalLitre = eveningRecord.getMilkQuantity();
		            eveningTotalAmount = eveningRecord.getTotalMilkAmount();
		            totalLitreEveningShift+=eveningRecord.getMilkQuantity();
		            totalAmountEveningShift+=eveningRecord.getTotalMilkAmount();
		            averageRateEveningShift += eveningRecord.getMilkRate();
		            averageFatEveningShift+=eveningRecord.getMilkFat();
		            averageSnfEveningShift+=eveningRecord.getMilkSNF();
		            rateCountEvening++;
		            fatCountEvening++;
		            snfCountEvening++;
		            table.addCell(createCellWithFont(String.valueOf(eveningRecord.getMilkQuantity()), cellFont));
		            table.addCell(createCellWithFont(String.valueOf(eveningRecord.getMilkFat()), cellFont));
		            table.addCell(createCellWithFont(String.valueOf(eveningRecord.getMilkSNF()), cellFont));
		            table.addCell(createCellWithFont(String.valueOf(eveningRecord.getMilkRate()), cellFont));
		            table.addCell(createCellWithFont(String.valueOf(eveningRecord.getTotalMilkAmount()), cellFont));
		        } else {
		            // Add empty cells for Evening
		            for (int j = 0; j < 5; j++) {
		                table.addCell(createCellWithFont("", cellFont));
		            }
		           
		        }
		       
		        table.addCell(createCellWithFont(String.valueOf(morningTotalLitre+eveningTotalLitre), cellFont));//Rows Litre Total of Morning & Evening
			    table.addCell(createCellWithFont(String.valueOf(morningTotalAmount+eveningTotalAmount), cellFont));//Rows TotalAmount Total of Morning & Evening
		        // Add empty cells for Total
		        for (int j = 0; j < 6; j++) {
		            table.addCell(createCellWithFont("", cellFont));
		            
		        }
		        

		        PdfPCell lineCell = new PdfPCell();
		        lineCell.setColspan(13);
		        lineCell.setBorder(Rectangle.NO_BORDER);
		        lineCell.setPaddingBottom(90f);
		        table.addCell(lineCell);
		        
		    }
		    
		    double averageRateMorning = rateCountMorning > 0 ? averageRateMorningShift / rateCountMorning : 0.0;
		    double averageRateEvening = rateCountEvening > 0 ? averageRateEveningShift / rateCountEvening : 0.0;
		    float averageFatMorning =  (float) (fatCountMorning > 0 ? averageFatMorningShift / fatCountMorning : 0.0);
		    float averageFatEvening =  (float) (fatCountEvening > 0 ? averageFatEveningShift / fatCountEvening : 0.0);
		    float averageSnfMorning =  (float) (snfCountMorning > 0 ? averageSnfMorningShift / snfCountMorning : 0.0);
		    float averageSnfEvening =  (float) (snfCountEvening > 0 ? averageSnfEveningShift / snfCountEvening : 0.0);
		   
		  //Total Row
		    table.addCell(createCellWithFont("Total", boldFont));
		    table.addCell(createCellWithFont(String.valueOf(totalLitreMorningShift), cellFont));//Column Total litre
		    table.addCell(createCellWithFont(String.valueOf(averageFatMorning), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(averageSnfMorning), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(averageRateMorning), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(totalAmountMorinigShift), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(totalLitreEveningShift), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(averageFatEvening), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(averageSnfEvening), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(averageRateEvening), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(totalAmountEveningShift), cellFont));
		    table.addCell(createCellWithFont(String.valueOf(totalLitreMorningShift+totalLitreEveningShift), boldFont));//Added Morning Total Litre And Evening Total
		    table.addCell(createCellWithFont(String.valueOf(totalAmountMorinigShift+totalAmountEveningShift), boldFont));//Added Morning Total Litre And Evening Total

		   
		    document.add(table);
		    
	   
			PdfPTable table2 = new PdfPTable(4);
			table2.setWidthPercentage(100);
			table2.setWidths(new float[] { 2.5f, 3.5f, 2.5f, 2.5f });

			
			table2.addCell(createCellWithFont("Previous Deposit:0.0", cellFont));
			table2.addCell(createCellWithFont("Previous Outstanding:0.0", cellFont));
			table2.addCell(createCellWithFont("Total Outstanding:0.0", cellFont));
			table2.addCell(createCellWithFont("Total Bill: "+(totalAmountMorinigShift+totalAmountEveningShift), cellFont));

			document.add(new Paragraph("\n"));
			document.add(new Paragraph("\n"));

			table2.addCell(createCellWithFont("Current Deposit:0.0", cellFont));
			table2.addCell(createCellWithFont("Feed Rs:0.0", cellFont));
			table2.addCell(createCellWithFont("Actual Deduction:0.0", cellFont));
			table2.addCell(createCellWithFont("Total Deduction:0.0", cellFont));
			
			document.add(new Paragraph("\n"));
			document.add(new Paragraph("\n"));
			table2.addCell(createCellWithFont("Total Deposit:0.0", cellFont));
			table2.addCell(createCellWithFont("Current Borrow:0.0", cellFont));
			table2.addCell(createCellWithFont("Current Outstanding:0.0", cellFont));
			table2.addCell(createCellWithFont("Total Pay:0.0", cellFont));
			
			document.add(table2);

			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				outputStream.flush();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	

	private PdfPCell createCellWithFont(String content, Font font) {
	    PdfPCell cell = new PdfPCell(new Phrase(content, font));
	    cell.setBorderWidth(0);
	    cell.setPaddingBottom(6f);
	    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	   // cell.setBorder(Rectangle.BOTTOM); // Set the bottom border for the cell
	    return cell;
	}

	private PdfPCell createCellWithFont(LocalDate localDate, Font font) {
	    String formattedDate = formatDateToDayMonth(localDate);
	    PdfPCell cell = createCellWithFont(formattedDate, font);
	    return cell;
	}
	
	private String formatDateToDayMonth(LocalDate localDate) {
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM");
	    return localDate.format(formatter);
	}

}
