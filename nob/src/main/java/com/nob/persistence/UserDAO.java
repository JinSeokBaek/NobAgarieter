package com.nob.persistence;

import com.nob.domain.UserVO;
import com.nob.dto.LoginDTO;

public interface UserDAO {
	/**
	 *회원가입 
	 **/
	// insert
	public void createUser(UserVO uVO) throws Exception;

	// SetAuth
	public void setAuth(String email, String key) throws Exception;

	// GetUser by Auth
	public UserVO getUser(String key) throws Exception;

	// SetAuth
	public void setVerify(Integer u_no) throws Exception;
	
	//중복체크
	public int dubEmailCheck(String email) throws Exception;
	public int dubNickCheck(String nick) throws Exception;
	
	/**
	 *로그인 처리 
	 **/

	// select
	public UserVO login(LoginDTO lDTO) throws Exception;
	
	//isAuth
	public int isAuth(Integer u_no) throws Exception;
	
	/**
	 * 수정사항(유저페이지)
	 * 06/22~
	 * */
	//유저 불러오기
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
