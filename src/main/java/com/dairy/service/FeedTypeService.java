package com.dairy.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.dairy.dto.feedType.FeedTypeRequestDto;
import com.dairy.dto.feedType.FeedTypeResponseDto;

@Service
public interface FeedTypeService {

	public String addFeedType(FeedTypeRequestDto dto);

	public List<FeedTypeResponseDto> getAllFeedTypes();

	public List<FeedTypeResponseDto> getFeedTypeByFeedCompanyId(int id);


}
