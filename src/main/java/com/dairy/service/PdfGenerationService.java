package com.dairy.service;

import java.io.IOException;

import javax.servlet.ServletOutputStream;

import org.springframework.stereotype.Service;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class PdfGenerationService {

	public void generatePdf(ServletOutputStream outputStream) {
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, outputStream);
			document.open();
			Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
			Font cellFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
			Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

			//String marathiFontPath = "C:/Windows/Fonts/Tiro Devanagari Marathi";


			// Create a BaseFont object with the Marathi font
			//String marathiFontPath = "C:/Users/Admin/Desktop/New folder/arial-unicode-ms.ttf";
			//BaseFont marathiBaseFont = BaseFont.createFont(marathiFontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED, BaseFont.CACHED);
			//Font marathiFont = new Font(marathiBaseFont, 16);


			
			//Paragraph title = new Paragraph("महालक्ष्मी सहकार दुध संस्था, बागलवाडी", marathiFont);
			Paragraph title = new Paragraph("Mahalakshmi Dudh Sanstha, Bagalwadi", titleFont);
			title.setAlignment(Element.ALIGN_CENTER);
			document.add(title);

			Paragraph khata = new Paragraph("Khata No.", cellFont);
			khata.setAlignment(Element.ALIGN_LEFT);
			Paragraph spacer1 = new Paragraph("                                                         ");

			// Second paragraph (right-aligned)
			Paragraph bill = new Paragraph("Bill Type.");
			bill.setAlignment(Element.ALIGN_RIGHT);

			// Create a Phrase to group both paragraphs
			Phrase phrase1 = new Phrase();
			phrase1.add(khata);
			phrase1.add(spacer1);
			phrase1.add(spacer1);
			phrase1.add(bill);

			// Add the Phrase to the PDF
			document.add(phrase1);

			Paragraph CustomeraName = new Paragraph("Customer Name.");
			CustomeraName.setAlignment(Element.ALIGN_LEFT);
			// document.add(CustomeraName);

			Paragraph spacer2 = new Paragraph("                                                  ");
			Paragraph date = new Paragraph("Date.  To  ");
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
			// Morning.setIndentationLeft(80);
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
			//
			table.setWidthPercentage(100);
			// table.setSpacingBefore( 20f );

			table.setWidths(
					new float[] { 1.5f, 1.5f, 1.5f, 1.5f, 1.5f, 3f, 1.5f, 1.5f, 1.5f, 1.5f, 3f, 1.5f, 2.5f });
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
			// c13.setBackgroundColor( BaseColor.GRAY );
			table.addCell(c13);

			for (int i = 0; i < 10; i++) {

				//PdfPCell cellDate = createCellWithFont("Date" + (i + 1), cellFont);

				//table.addCell(cellDate);
				table.addCell(createCellWithFont("" + (i + 11), cellFont));
				
				table.addCell(createCellWithFont("" + (i + 1.1), cellFont));
				table.addCell(createCellWithFont("" + (i + 1), cellFont));
				table.addCell(createCellWithFont("" + (i + 1), cellFont));
				table.addCell(createCellWithFont("" + (i * 1), cellFont));
				table.addCell(createCellWithFont("" + (i + 100), cellFont));
				table.addCell(createCellWithFont("" + (i + 1), cellFont));
				table.addCell(createCellWithFont("" + (i + 1), cellFont));
				table.addCell(createCellWithFont("" + (i + 1), cellFont));
				table.addCell(createCellWithFont("" + (i + 200), cellFont));
				table.addCell(createCellWithFont("" + (i * 500), cellFont));
				table.addCell(createCellWithFont("" + (i + 100), cellFont));
				table.addCell(createCellWithFont("" + (i + 500), cellFont));
				PdfPCell lineCell = new PdfPCell();
				lineCell.setColspan(13); // Set the colspan to cover the entire table width
			    lineCell.setBorder(Rectangle.BOTTOM); // Set the bottom border
			    lineCell.setPaddingBottom(90f); // // Adjust padding as needed
			    table.addCell(lineCell);
			}

			document.add(table);
			PdfPTable table2 = new PdfPTable(4);
			table2.setWidthPercentage(100);
			table2.setWidths(new float[] { 2.5f, 3.5f, 2.5f, 2.5f });

			
			table2.addCell(createCellWithFont("Previous Deposit:0.0", cellFont));
			table2.addCell(createCellWithFont("Previous Outstanding:0.0", cellFont));
			table2.addCell(createCellWithFont("Total Outstanding:0.0", cellFont));
			table2.addCell(createCellWithFont("Total Bill:0.0", cellFont));

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
		return cell;
	}
}
