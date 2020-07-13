package com.nob.persistence;

import java.util.List;

import com.nob.domain.CalorieVO;

public interface CalorieDAO {
	
	
	public List<CalorieVO> listAll() throws Exception;
	
	
	public CalorieVO read(Integer cno) throws Exception;
	
	
	public List<CalorieVO> autocomplete(String keyword) throws Exception;
	
}
