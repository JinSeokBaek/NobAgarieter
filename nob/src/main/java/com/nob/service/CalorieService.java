package com.nob.service;

import java.util.List;

import com.nob.domain.CalorieVO;

public interface CalorieService {
		
		public List<CalorieVO> listAll() throws Exception;
		
		
		public CalorieVO read(Integer cno) throws Exception;
		
	
		public List<CalorieVO> autocomplete(String cname) throws Exception;
		
}
