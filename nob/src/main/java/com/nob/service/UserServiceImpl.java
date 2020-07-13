package com.nob.service;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nob.domain.UserVO;
import com.nob.dto.LoginDTO;
import com.nob.persistence.UserDAO;
import com.nob.util.MailHandler;
import com.nob.util.TempKey;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	private UserDAO uDAO;


	@Transactional
	@Override
	public void regist(UserVO uVO) throws Exception {
		uDAO.createUser(uVO);
		String key = new TempKey().getKey(50, false);
        uDAO.setAuth(uVO.getU_email(), key);
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[이메일 인증]");
        sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
        		//http://localhost:8181
                .append("<a href='http://192.168.0.110:8181/main/emailConfirm?key=")
                .append(key)
                .append("' target='_blenk'>이메일 인증 확인</a>")
                .toString());
        sendMail.setFrom("tisnob123@gmail.com", "tisnob123");
        sendMail.setTo(uVO.getU_email());
        sendMail.send();
	}
	
	@Override
	public UserVO read(Integer u_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO getUser(String key) throws Exception {
		return uDAO.getUser(key);
	}

	@Override
	public void setVerify(Integer u_no) throws Exception {
		uDAO.setVerify(u_no);
	}

	@Override
	public int dubEmailCheck(String email) throws Exception {
		return uDAO.dubEmailCheck(email);
	}

	@Override
	public int dubNickCheck(String nick) throws Exception {
		return uDAO.dubNickCheck(nick);
	}

	@Override
	public UserVO login(LoginDTO lDTO) throws Exception {
		return uDAO.login(lDTO);
	}

	@Override
	public int isAuth(Integer u_no) throws Exception {
		return uDAO.isAuth(u_no);
	}
	
	/**
	 * 수정사항(유저페이지)
	 * 06/22~
	 * */
	@Override
	public UserVO readUser(Integer uno) throws Exception {
		return uDAO.readUser(uno);
	}

	@Override
	public void updateUser(UserVO uVO) throws Exception {
		uDAO.updateUser(uVO);
		
	}

	@Override
	public void delUser(Integer uno) throws Exception {
		uDAO.delUser(uno);
	}

	@Override
	public String pwd(String email) throws Exception {
		return uDAO.pwd(email);
	}
	
	/**
	 * 06/26~
	 * */
	@Override
	public int getUpdatedate(Integer uno) throws Exception {
		return uDAO.getUpdatedate(uno);
	}

	@Override
	public void updateUpdatedate(Integer uno) throws Exception {
		uDAO.updateUpdatedate(uno);
	}

	

//	@Override
//	public void resetPwd(String email) throws Exception {
//		MailHandler sendMail = new MailHandler(mailSender);
//        sendMail.setSubject("[비밀번호재설정]");
//        sendMail.setText(new StringBuffer().append("<h1>비밀번호 재설정</h1>")
//        		//http://localhost:8181
//                .append("<a href='http://localhost:8181/main/resetConfirm?email=")
//                .append(email)
//                .append("' target='_blenk'>이 링크를 눌러 비밀번호를 재설정하세요.</a>")
//                .toString());
//        sendMail.setFrom("tisnob123@gmail.com", "tisnob123");
//        sendMail.setTo(email);
//        sendMail.send();
//	}

}
