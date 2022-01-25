package com.gr.farming.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gr.farming.common.ConstUtil;
import com.gr.farming.common.FileUploadUtil;
import com.gr.farming.member.model.MemberService;
import com.gr.farming.member.model.MemberVO;
import com.gr.farming.oauth.model.OAuthService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final MemberService service;
	private final OAuthService oservice;
	private final FileUploadUtil file;
	@Autowired
	private PasswordEncoder pwdEncoder;

	@Autowired
	public MemberController(MemberService service, OAuthService oservice, FileUploadUtil file) {
		this.service = service;
		this.oservice = oservice;
		this.file = file;
	}

	@RequestMapping("/agreement")
	public String agreement() {
		logger.info("약관페이지");
		return "member/agreement";
	}

	@RequestMapping("/memRegister")
	public String memRegister() {
		logger.info("회원가입 페이지");
		return "member/memRegister";
	}

	@RequestMapping("/mypage/main")
	public String main() {
		logger.info("마이페이지");
		return "member/mypage/main";
	}

//	회원가입처리
	@RequestMapping("/join")
	public String join(@ModelAttribute MemberVO vo, Model model) {
		logger.info("회원가입 처리 파라미터 vo={}", vo);

		int cnt = service.insert(vo);
		logger.info("회원가입 처리 결과 cnt={}", cnt);

		String msg = "회원가입 실패", url = "/register";
		if (cnt > 0) {
			msg = "회원가입 처리되었습니다";
			url = "/login/login";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

//	카카오 로그인 or 회원가입
	@RequestMapping("kakaojoin")
	public String kakaoJoin() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
		loginUrl.append("56bf08692479c92a0298b16483f2071a");
		loginUrl.append("&redirect_uri=");
		loginUrl.append("http://localhost:9091/farming/login/kakao");
		loginUrl.append("&response_type=code");

		return "redirect:" + loginUrl.toString();
	}

//	페이스북 로그인 or 회원가입
	@RequestMapping("facebookjoin")
	public String facebookjoin() {
		String facebookurl = oservice.getAuthorizationUrl();
		System.out.println("facebookurl : " + facebookurl);
		return "redirect:" + facebookurl;
	}

//   회원 정보 수정
	@GetMapping("/mypage/profile")
	public String edit_get(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		logger.info("회원정보 수정 화면, 파라미터 email={}", email);

		MemberVO vo = service.selectByEmail(email);
		logger.info("회원수정 - 조회 결과 vo={}", vo);

		model.addAttribute("vo", vo);
		return "member/mypage/profile";
	}

	@PostMapping("/mypage/profile")
	public String edit_post(@ModelAttribute MemberVO vo, HttpSession session, HttpServletRequest request, Model model) {
		vo.setEmail((String) session.getAttribute("email"));
		vo.setName((String) session.getAttribute("name"));
		vo.setPwd(pwdEncoder.encode(vo.getPwd()));
		logger.info("회원수정 처리, 파라미터 vo={}", vo);
		
		//파일 업로드 처리
		String fileName="", originName="";
		long fileSize=0;
		int pathFlag=ConstUtil.UPLOAD_IMAGE_FLAG;
		try {
			List<Map<String, Object>> fileList = file.fileUpload(request, pathFlag);
			for(int i=0;i<fileList.size();i++) {
				 Map<String, Object> map=fileList.get(i);
				 
				 fileName=(String) map.get("fileName");
				 originName=(String) map.get("originalFileName");
				 fileSize=(long) map.get("fileSize");				 
			}
			
			logger.info("파일 업로드 성공, fileName={}", fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		vo.setFileName(fileName);
		vo.setFileSize(fileSize);
		vo.setOriginalFileName(originName);
				
		String msg = "", url = "/mypage/profile";

		int cnt = service.updateMember(vo);
		logger.info("회원수정 결과, cnt={}", cnt);

		if (cnt > 0) {
			msg = "수정되었습니다. 다시 로그인 해주세요.";
			url = "/login/logout";
		} else {
			msg = "회원정보 수정 실패!";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

//  회원 비번 확인
	@RequestMapping(value = "/mypage/checkpwd", method = RequestMethod.GET)
	public String check_get(@RequestParam(defaultValue = "0") String email, Model model) {

		if (email == null) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/member/mypage/main");
			return "common/message";
		}

		MemberVO vo = service.selectByEmail(email);

		model.addAttribute("vo", vo);

		return "member/mypage/checkpwd";
	}

	@RequestMapping(value = "/mypage/checkpwd", method = RequestMethod.POST)
	public String check_post(@ModelAttribute MemberVO vo, Model model) {
		MemberVO memVo = service.selectByEmail(vo.getEmail());
		boolean chk = pwdEncoder.matches(vo.getPwd(), memVo.getPwd());
		logger.info("비번 확인, 파라미터 vo={}", vo);

		String msg = "비밀번호를 확인해주세요.", url = "/member/mypage/checkpwd?email=" + vo.getEmail();
		if (chk) {
			msg = "확인되었습니다.";
			url = "/member/mypage/profile";

		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	/*
	 * @RequestMapping(value="/mypage/checkpwd", method=RequestMethod.POST) public
	 * String check_post(@ModelAttribute MemberVO vo, Model model) {
	 * logger.info("비번 확인, 파라미터 vo={}", vo);
	 * 
	 * String msg="실패", url="/member/mypage/checkpwd"; if(service.checkPwd(vo)) {
	 * msg="확인되었습니다."; url="/member/mypage/profile";
	 * 
	 * }else { msg="비밀번호가 일치하지 않습니다.";
	 * url="/member/mypage/checkpwd?email="+vo.getEmail(); }
	 * model.addAttribute("msg", msg); model.addAttribute("url", url);
	 * 
	 * return "common/message";
	 * 
	 * }
	 */

// 회원 탈퇴
	@GetMapping("/mypage/out")
	public void out_get() {
		logger.info("회원탈퇴 화면");
	}
	
	@PostMapping("/mypage/out")
	public String out_post(@ModelAttribute MemberVO vo, HttpSession session,
			HttpServletResponse response, Model model) {
		String pwd = (String) session.getAttribute("pwd");
		
		String msg="비밀번호 체크 실패", url="/member/mypage/out";
		if(pwdEncoder.matches(vo.getPwd(), pwd)) {
			vo.setEmail(vo.getEmail());
			vo.setPwd(pwd);
			int cnt = service.delete(vo);
			logger.info("cnt : {}",cnt);
			if(cnt>0) {
				msg="탈퇴되었습니다.";
				url="/index";
				session.invalidate();
			}else {
				msg="회원탈퇴 처리 실패";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	/*
	 * @PostMapping("/mypage/out") public String out_post(@ModelAttribute MemberVO
	 * vo, HttpSession session, HttpServletResponse response, Model model) {
	 * 
	 * vo.setEmail((String) session.getAttribute("email"));
	 * vo.setPwd(pwdEncoder.encode(vo.getPwd()));
	 * 
	 * MemberVO memVo=service.selectByEmail(vo.getEmail()); boolean chk =
	 * pwdEncoder.matches(vo.getPwd(), memVo.getPwd());
	 * logger.info("회원탈퇴 처리, 파라미터 vo={}", vo);
	 * 
	 * String msg="비밀번호 체크 실패", url="/mypage/out"; if(chk) { int cnt =
	 * service.delete(vo.getEmail()); if(cnt>0) { msg="확인되었습니다.";
	 * url="../../login/login"; session.invalidate();
	 * 
	 * Cookie ck = new Cookie("ck_email", vo.getEmail()); ck.setMaxAge(0);
	 * ck.setPath("/"); response.addCookie(ck);
	 * 
	 * }else { msg="회원탈퇴 처리 실패"; } }else { msg="비밀번호가 일치하지 않습니다."; }
	 * 
	 * model.addAttribute("msg", msg); model.addAttribute("url", url);
	 * 
	 * return "common/message"; }
	 */

	/*
	 * @PostMapping("/mypage/out") public String out_post(@RequestParam String pwd,
	 * HttpSession session, HttpServletResponse response, Model model) { String
	 * email=(String) session.getAttribute("email");
	 * logger.info("회원탈퇴 처리, 파라미터 email={}, pwd={}", email,pwd);
	 * 
	 * String msg="비밀번호 체크 실패", url="/mypage/out"; int result =
	 * service.loginCheck(email, pwd); if(result==service.LOGIN_OK) { int cnt =
	 * service.delete(email); if(cnt>0) { msg="확인되었습니다."; url="/index";
	 * session.invalidate();
	 * 
	 * Cookie ck = new Cookie("ck_email", email); ck.setMaxAge(0); ck.setPath("/");
	 * response.addCookie(ck); }else { msg="회원탈퇴 처리 실패"; } }else
	 * if(result==service.DISAGREE_PWD) { msg="비밀번호가 일치하지 않습니다."; }
	 * 
	 * model.addAttribute("msg", msg); model.addAttribute("url", url);
	 * 
	 * return "common/message"; }
	 */

	@RequestMapping("/checkemail")
	public String checkEmail(@RequestParam String email, Model model) {
		logger.info("중복체크페이지 email={}", email);
		int result = 0;

		if (email != null && !email.isEmpty()) {
			result = service.duplicatedId(email);
			logger.info("중복확인 결과 result={}", result);
		}

		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID", service.EXIST_ID);
		model.addAttribute("NON_EXIST_ID", service.NON_EXIST_ID);

		return "member/checkemail";
	}

	@RequestMapping("/change")
	public String changePwd(@RequestParam String email, String pwd, Model model) {
		logger.info("이메일 인증 후 비밀번호 변경 처리 파라미터 email = {}, pwd = {}", email, pwd);

		int cnt = service.updatePwd(email, pwd);
		String msg = "비밀번호 변경 실패", url = "/login/findpwd";
		if (cnt > 0) {
			msg = "변경 성공";
			url = "/login/login";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/addInfo")
	public String addInfoSNS(HttpSession session) {
		logger.info("SNS로그인 추가정보입력");
		String email = (String) session.getAttribute("email");
		String name = (String) session.getAttribute("neme");
		String img = (String) session.getAttribute("img");
		return "member/addInfo";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxChkPwd")
	public boolean ajaxChkPwd(@RequestParam String pwd, @RequestParam String pwd2) {
		boolean res = false;
		if(pwd.equals(pwd2)) {
			res = true;
		} else {
			res = false;
		}
		return res;
	}
}
