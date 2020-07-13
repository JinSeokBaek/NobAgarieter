package com.nob.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nob.domain.UserVO;
import com.nob.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	

	@Inject
	private SqlSession session;
	
	private static String namespace="com.nob.mapper.UserMapper"; 
	
	@Override
	public void createUser(UserVO uVO) throws Exception {
		session.insert(namespace+".createUser", uVO);

	}
	@Override
	public void setAuth(String email, String key) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("authKey", key);
		param.put("email", email);
		session.update(namespace+".setAuth", param);
		
	}

	@Override
	public UserVO getUser(String key) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("authKey", key);
		return session.selectOne(namespace+".getAuth", param);
	}

	@Override
	public void setVerify(Integer u_no) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("uno", u_no);
		session.update(namespace+".setVerify", param);		
	}

	@Override
	public int dubEmailCheck(String email) throws Exception {
		return session.selectOne(namespace+".email", email);
	}

	@Override
	public int dubNickCheck(String nick) throws Exception {
		return session.selectOne(namespace+".nickname", nick);
	}

	
	
	@Override
	public UserVO login(LoginDTO lDTO) throws Exception {
		return session.selectOne(namespace+".login",lDTO);
	}
	@Override
	public int isAuth(Integer u_no) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("uno", u_no);
		return session.selectOne(namespace+".isAuth",param);
	}
	
	/**
	 * ¼öÁ¤»çÇ×(À¯ÀúÆäÀÌÁö)
	 * 06/22~
	 * */
	@Override
	public UserVO readUser(Integer uno) throws Exception {
		return session.selectOne(namespace+".read", uno);
	}
	@Override
	public void updateUser(UserVO uVO) throws Exception {
		session.update(namespace+".updateUser", uVO);
	}
	@Override
	public void delUser(Integer uno) throws Exception {
		session.update(namespace+".delUser",uno);
		
	}
	@Override
	public String pwd(String email) throws Exception {
		return session.selectOne(namespace+".pwd", email);
	}
	
	
	/**
	 * 06/26~
	 * */
	@Override
	public int getUpdatedate(Integer uno) throws Exception {
		return session.selectOne(namespace+".getUpdatedate", uno);
	}
	@Override
	public void updateUpdatedate(Integer uno) throws Exception {
		session.update(namespace+".updateUpdatedate", uno);
	}
}
