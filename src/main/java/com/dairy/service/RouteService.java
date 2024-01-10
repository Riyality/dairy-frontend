package com.dairy.service;

import java.util.List;

import com.dairy.dto.route.RouteRequestDto;
import com.dairy.dto.route.RouteResponseDto;

public interface RouteService {
	
	public String addRoute(RouteRequestDto dto);

	public List<RouteResponseDto> getAllRoutes();
	
	public RouteResponseDto findById( int id );

	public String update( RouteRequestDto dto );
	
}
