package com.dairy.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.imageio.ImageIO;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
@RestController
public class TableImageController {
	 @PostMapping("/processImage")
	    public ResponseEntity<List<List<String>>> processImage(@RequestParam("file") MultipartFile file) {
	        try {
	            // Convert MultipartFile to BufferedImage
	            BufferedImage image = ImageIO.read(file.getInputStream());

	            // Perform OCR using Tess4J
	            Tesseract tesseract = new Tesseract();
	            tesseract.setDatapath("src/main/resources/Tess4J/tessdata"); // Set the path to your tessdata folder
	            String text = tesseract.doOCR(image);


	            // Convert the extracted data into a suitable format
	            List<List<String>> tableData = Arrays.stream(text.split("\n"))
	                    .map(row -> Arrays.asList(row.split("\\s+")))
	                    .collect(Collectors.toList());

	            return new ResponseEntity<>(tableData, HttpStatus.OK);
	        } catch (IOException | TesseractException e) {
	            e.printStackTrace();
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
}




