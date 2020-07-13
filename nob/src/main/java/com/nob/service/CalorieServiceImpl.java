package com.nob.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nob.domain.CalorieVO;
import com.nob.persistence.CalorieDAO;

@Service
public class CalorieServiceImpl implements CalorieService {
	
	@Inject
	private CalorieDAO cDAO;
	
	@Override
	public List<CalorieVO> listAll() throws Exception {
		return cDAO.listAll();
	}

	@Override
	public CalorieVO read(Integer cno) throws Exception {
		return cDAO.read(cno);
	}

	@Override
	public List<CalorieVO> autocomplete(String cname) throws Exception {
		return cDAO.autocomplete(cname);
	}

}
