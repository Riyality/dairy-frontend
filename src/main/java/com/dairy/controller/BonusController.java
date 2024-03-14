package com.dairy.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dairy.constants.MessageConstants;
import com.dairy.dto.bonusToFarmer.BonusToFarmerRequestDto;
import com.dairy.dto.bonusToFarmer.BonusToFarmerResponseDto;
import com.dairy.dto.feedStock.FeedStockRequestDto;
import com.dairy.dto.milkCollection.MilkCollectionResponseDto;
import com.dairy.service.BonusPdfService;
import com.dairy.service.MilkCollectionService;

@Controller
@RequestMapping("/bonusToFarmer")
public class BonusController {
	@Autowired
	private MilkCollectionService milkCollectionService;

	@Autowired
	private BonusPdfService bonusPdfService;

	@GetMapping("/page")
	public String bonusPage() {
		return "bonusToFarmers/bonusToFarmer";

	}

	@GetMapping("/{fromDate}/{toDate}/{animalType}")
	@ResponseBody
	public ResponseEntity<List<MilkCollectionResponseDto>> findByFromDateAndToDateAndAnimalType(
			 @PathVariable("fromDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
			 @PathVariable("fromDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate  toDate, @PathVariable("animalType") String animalType,
			Model model, HttpSession session) {

		try {
			SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");

			//Date parsedFromDate = inputDateFormat.parse(fromDate);
			//Date parsedToDate = inputDateFormat.parse(toDate);
			String Flag="Bonus";
			List<MilkCollectionResponseDto> list = milkCollectionService
					.findByFromDateAndToDateAndAnimalType(fromDate, toDate, animalType,Flag);

			return new ResponseEntity<>(list, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping
	public String allBonusRecord(HttpSession session, Model model) {
		int branchId = (int) session.getAttribute("branchId");
		List<BonusToFarmerResponseDto> list = bonusPdfService.findAllBonusRecords(branchId);
		model.addAttribute("list", list);
		return "bonusToFarmers/allBonusRecords";
	}
	
    @PostMapping("/selectedFarmers")
	public ResponseEntity<String> saveSelectedFarmers(@RequestBody BonusToFarmerRequestDto requestDto,
			HttpSession session) {
		List<Long> selectedFarmerIds = requestDto.getSelectedFarmerIds();
          
		for (Long farmerId : selectedFarmerIds) {
			BonusToFarmerRequestDto dtoCopy = new BonusToFarmerRequestDto();
			dtoCopy.setFarmerId(farmerId);
			dtoCopy.setFromDate(requestDto.getFromDate());
			dtoCopy.setToDate(requestDto.getToDate());
			dtoCopy.setBonusDate(requestDto.getBonusDate());
			dtoCopy.setTotalQuantity(requestDto.getTotalQuantity());
			dtoCopy.setBonusAmountPerLiter(requestDto.getBonusAmountPerLiter());
			dtoCopy.setTotalBonusAmount(requestDto.getTotalBonusAmount());
			dtoCopy.setMilkType(requestDto.getMilkType());
			dtoCopy.setBranchId(requestDto.getBranchId());
			bonusPdfService.storeBonusRecord(dtoCopy);
			
		}

		return ResponseEntity.ok("Selected farmers saved successfully.");
	}
	

	@GetMapping("datewise/{fromDate}/{toDate}/{flag}")
	public ResponseEntity<List<BonusToFarmerResponseDto>> getBonusRecordsDatewise(@PathVariable @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
	        @PathVariable @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate,@PathVariable String flag,HttpSession session) {
		
		int branchId=(int) session.getAttribute("branchId");
		return new ResponseEntity<>(bonusPdfService.getBonusRecordsDatewise(fromDate,toDate,branchId,flag), HttpStatus.OK);
	}
}
