package com.nob.persistence;

import java.util.List;

import com.nob.domain.VideoVO;

public interface VideoDAO {
	//list
	public List<VideoVO> listMoive() throws Exception;
	//create
	public void create(VideoVO mVO) throws Exception;
	//update
	public void update(VideoVO mVO)throws Exception;
	//delete
	public void delete(Integer vno)throws Exception;
}
