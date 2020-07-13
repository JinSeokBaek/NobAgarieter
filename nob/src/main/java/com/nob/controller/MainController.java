package com.nob.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nob.domain.UserVO;
import com.nob.dto.LoginDTO;
import com.nob.service.UserService;
import com.nob.util.HashUtils;

@Controller
@RequestMapping("/main/*")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Inject
	private UserService service;

	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void signup() {
		logger.info("sign-up page");
	}

	/**
	 * 회원가입 처리
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute("UserVO") UserVO uVO, RedirectAttributes rttr) throws Exception {
		logger.info("sign-uping");
		service.regist(uVO);
		rttr.addFlashAttribute("msg", "가입시 사용한 이메일로 이메일 인증을 해주세요.");
		return "redirect:/";
	}

	/**
	 * 로그인 페이지
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(@ModelAttribute("ldto") LoginDTO lDTO) {
		logger.info("login page");
	}
	
	/**
	 * 로그인 처리
	 * @throws Exception 
	 */
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void login(LoginDTO lDTO,HttpSession session,Model model,RedirectAttributes rttr) throws Exception {
		logger.info("logining");
		UserVO uVO=service.login(lDTO);
		
		if(uVO==null) {
			model.addAttribute("msg", "로그인에 실패하였습니다.");
			return;
		}
			
		if(service.isAuth(uVO.getU_no())!=0) {
			model.addAttribute("userVO", uVO);			
			logger.info(uVO.toString());
			
			model.addAttribute("msg", "로그인에 성공하였습니다.");
		}
		else 
			model.addAttribute("msg", "이메일을 인증해주세요.");
	}
	/**
	 * 로그아웃
	 * */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request,HttpServletResponse response,HttpSession session,RedirectAttributes rttr) throws Exception {
		logger.info("logout");
		Object obj=session.getAttribute("login");
		if(obj!=null) {
			UserVO uVO=(UserVO)obj;
			session.removeAttribute("login");
			session.invalidate();
			rttr.addFlashAttribute("msg", "로그아웃하였습니다.");
		}else
			rttr.addFlashAttribute("msg", "잘못된 접근입니다.");
		
		return "redirect:/";
		
	}
	/**
	 * 비밀번호 재설정
	 * */
//	@RequestMapping(value = "/resetPwd", method = RequestMethod.GET)
//	public void resetPwd() throws Exception {
//		logger.info("resetpwd");
//		
//	}
//	@RequestMapping(value = "/resetPwd", method = RequestMethod.POST)
//	public String resetPwd(@RequestParam("email") String email,RedirectAttributes rttr) throws Exception {
//		logger.info("resetpwd");
//		service.resetPwd(email);
//		rttr.addFlashAttribute("msg", "등록하신 이메일로 비밀번호 재설정 메일을 보냈습니다.");
//		return "redirect:/main/login";		
//	}
	// 비밀번호 검증
//		@RequestMapping(value = "/resetConfirm", method = RequestMethod.GET)
//		public String resetConfirm(@RequestParam("key") String key, Model model) throws Exception {
//			logger.info("verifing " + key);
//
//			try {
//				UserVO uVO = service.getUser(key.trim());
//				logger.info(uVO.toString());
//				if (uVO.getU_nickname() != null && uVO.getU_nickname().length() > 0) {
//					service.setVerify(uVO.getU_no());
//					model.addAttribute("check", true);
//					model.addAttribute("nickname", uVO.getU_nickname());
//				} else
//					model.addAttribute("check", false);
//
//			} catch (Exception e) {
//				e.printStackTrace();
//				model.addAttribute("check", false);
//			}
//
//			return "/main/emailConfirm";
//		}
	
	
	// 암호화
	@ResponseBody
	@RequestMapping(value = "/getHash", method = RequestMethod.POST)
	public String getHash(@RequestParam("pw") String pw) {
//		logger.info(HashUtils.getHash(pw));
//		logger.info(HashUtils.getHash(pw).length() + "");
		return HashUtils.getHash(pw);
	}

	// 이메일 확인

	@ResponseBody
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public int checkEmail(@RequestParam("email") String email) throws Exception {
		return service.dubEmailCheck(email);
	}

	// 닉네임 확인
	@ResponseBody
	@RequestMapping(value = "/checkNick", method = RequestMethod.POST)
	public int checkNick(@RequestParam("nickname") String nick) throws Exception{
		return service.dubNickCheck(nick);
	}

	// 이메일 인증 코드 검증
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(@RequestParam("key") String key, Model model) throws Exception {
		logger.info("verifing " + key);

		try {
			UserVO uVO = service.getUser(key.trim());
			logger.info(uVO.toString());
			if (uVO.getU_nickname() != null && uVO.getU_nickname().length() > 0) {
				service.setVerify(uVO.getU_no());
				model.addAttribute("check", true);
				model.addAttribute("nickname", uVO.getU_nickname());
			} else
				model.addAttribute("check", false);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("check", false);
		}

		return "/main/emailConfirm";
	}
	

	/**
	 * 수정사항(유저페이지)
	 * 06/22~
	 * @throws Exception 
	 * */
	//그룹원 탈퇴
	@ResponseBody
	@RequestMapping(value = "/delUser", method = RequestMethod.POST)
	public void delUser(@RequestParam("uno") int uno,HttpSession session) throws Exception {
		session.removeAttribute("login");
		session.invalidate();
		service.delUser(uno);
	}
	//비밀번호확인 페이지
	@RequestMapping(value = "/checkPwd", method = RequestMethod.POST)
	public void checkPwd(@RequestParam("uno") int uno,Model model) throws Exception {
		logger.info("check Pwd");
	}
	//비밀번호 불러와서 검사
	@ResponseBody
	@RequestMapping(value = "/getPwd", method = RequestMethod.POST)
	public String getPwd(@RequestParam("email") String email) throws Exception {
		return service.pwd(email);
	}
	
	/**
	 * 06/26~
	 * */
	//닉네임 수정
	@RequestMapping(value = "/updateNick", method = RequestMethod.POST)
	public String updateNick(UserVO uVO,RedirectAttributes rttr,HttpSession session) throws Exception {
		logger.info("updateUser page");
		logger.info(uVO.toString());
		service.updateUser(uVO);
		service.updateUpdatedate(uVO.getU_no());
		session.removeAttribute("login");
		session.setAttribute("login", uVO);
		rttr.addFlashAttribute("uno", uVO.getU_no());
		rttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/";
	}
	/**
	 * 06/22꺼에서 수정된 것들
	 * */
	@RequestMapping(value = "/userPage", method = RequestMethod.POST)
	public void userPage(@RequestParam("uno") int uno,Model model) throws Exception {
		logger.info("user page");
		model.addAttribute("userInfo", service.readUser(uno));
		model.addAttribute("updatedate", service.getUpdatedate(uno));
	}
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(UserVO uVO,RedirectAttributes rttr,HttpSession session) throws Exception {
		logger.info("updateUser page");
		logger.info(uVO.toString());
		service.updateUser(uVO);
		session.removeAttribute("login");
		session.setAttribute("login", uVO);
		rttr.addFlashAttribute("uno", uVO.getU_no());
		rttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/";
	}
}
