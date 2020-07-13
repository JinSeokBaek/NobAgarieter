package com.nob.service;

import com.nob.domain.UserVO;
import com.nob.dto.LoginDTO;

public interface UserService {
	public void regist(UserVO uVO) throws Exception;
	public UserVO read(Integer u_no) throws Exception;
	public UserVO getUser(String key) throws Exception;
	public void setVerify(Integer u_no) throws Exception;
	

	public int dubEmailCheck(String email) throws Exception;
	public int dubNickCheck(String nick) throws Exception;
	

	public UserVO login(LoginDTO lDTO) throws Exception;
	public int isAuth(Integer u_no) throws Exception;
	
	//비밀번호재설정
	//public void resetPwd(String email) throws Exception;

	/**
	 * 수정사항(유저페이지)
	 * 06/22~
	 * */
	public UserVO readUser(Integer uno) throws Exception;
	//유저 수정
	public void updateUser(UserVO uVO) throws Exception;
	//유저 탈퇴
	public void delUser(Integer uno) throws Exception;
	
	//비밀번호확인
	public String pwd(String email) throws Exception;
	
	/**
	 * 06/26~
	 * */
	//유저 수정날짜랑 오늘 날짜 차이 불러오기
	public int getUpdatedate(Integer uno) throws Exception;
	

	//유저 수정일 설정 
	public void updateUpdatedate(Integer uno) throws Exception;
}
