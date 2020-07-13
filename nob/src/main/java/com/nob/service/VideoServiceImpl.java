package com.nob.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.nob.domain.VideoVO;
import com.nob.persistence.VideoDAO;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	private VideoDAO vDAO;
	
	@Override
	public List<VideoVO> listMoive() throws Exception {
		return vDAO.listMoive();
	}

	@Override
	public void create(VideoVO mVO) throws Exception {
		vDAO.create(mVO);

	}

	@Override
	public void update(VideoVO mVO) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer vno) throws Exception {
		vDAO.delete(vno);

	}

}
