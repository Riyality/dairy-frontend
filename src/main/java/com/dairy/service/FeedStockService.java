package com.dairy.service;

import java.util.List;

import com.dairy.dto.feedStock.FeedStockRequestDto;
import com.dairy.dto.feedStock.FeedStockResponseDto;

public interface FeedStockService {

	public String addFeedStock(FeedStockRequestDto feedStockRequestDto);

	public List<FeedStockResponseDto> getAllFeedStock(int branchId);

	public FeedStockResponseDto findById(int id, int branchId);

	public String updateFeed(FeedStockRequestDto feedStockRequestDto);

	public long TotalfeedStockBybranchId(Integer branchId);

}
