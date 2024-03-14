package com.dairy.service;

import java.util.List;

import com.dairy.dto.feedDetails.FeedDetailsResponseDto;
import com.dairy.dto.feedStock.FeedStockRequestDto;
import com.dairy.dto.feedStock.FeedStockResponseDto;

public interface FeedStockService {

	public String addFeedStock(FeedStockRequestDto feedStockRequestDto);

	public List<FeedStockResponseDto> getAllFeedStock(int branchId);

	public FeedStockResponseDto findById(int id, int branchId);

	public String updateFeed(FeedStockRequestDto feedStockRequestDto);

	public long TotalfeedStockBybranchId(Integer branchId);


	public String addFeedStocks(List<FeedStockRequestDto> feedStockRequestDtoList);

	public long getFeedQuantityByFeedTypeFeedCompanyAndBranch(long feedTypeId, long feedCompanyId, int branchId);

	public List<FeedDetailsResponseDto> getAllFeedDetails(int branchId);

}
