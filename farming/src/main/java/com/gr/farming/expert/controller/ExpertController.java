package com.gr.farming.expert.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gr.farming.category.model.CategoryService;
import com.gr.farming.category.model.CategoryVO;
import com.gr.farming.common.ConstUtil;
import com.gr.farming.common.FileUploadUtil;
import com.gr.farming.expert.model.ExpertService;
import com.gr.farming.expert.model.ExpertVO;
import com.gr.farming.field.model.FieldService;
import com.gr.farming.field.model.FieldVO;
import com.gr.farming.findExp.model.ExpertInfoVO;
import com.gr.farming.findExp.model.FindExpService;
import com.gr.farming.oauth.model.OAuthService;
import com.gr.farming.resume.model.ResumeService;

@Controller
@RequestMapping("/expert")
public class ExpertController {
	
	private final ExpertService service;
	private final CategoryService c_service;
	private final OAuthService o_service;
	private final FieldService f_service;
	private final FindExpService fe_service;
	
	private final FileUploadUtil file;
	
	
	@Autowired
	private PasswordEncoder pwdEncoder;
	
	private static final Logger logger
	=LoggerFactory.getLogger(ExpertController.class);

	@Autowired
	public ExpertController(ExpertService service, CategoryService c_service, OAuthService o_service, 
      FieldService f_service, FileUploadUtil file, FindExpService fe_service) {
		this.service = service;
		this.c_service = c_service;
		this.o_service = o_service;
		this.f_service = f_service;
		this.file = file;
		this.fe_service = fe_service;
  }

	@RequestMapping("/agreement")
	public String agreement() {
		logger.info("???????????????");
		return "expert/agreement";
	}
	
	@RequestMapping("/mypage/main")
	public String main() {
		logger.info("???????????????");
		return "expert/mypage/main";
	}
	
	@RequestMapping(value="/expRegister1", method = RequestMethod.GET)
	public String memRegister_get() {
		logger.info("????????????????????? ?????????");
		return "expert/expRegister1";
	}
	
	
	@RequestMapping("/expRegister2")
	public String memRegister2(@RequestParam(value="main", required = false) String main, Model model) {
		logger.info("????????????????????? ?????????2 main = {}",main);
		
		List<CategoryVO> list = c_service.selectByMain(main);
		model.addAttribute("main", main);
		model.addAttribute("clist", list);
		return "expert/expRegister2";
	}
	
	@RequestMapping("/expRegister3")
	public String memRegister3(@RequestParam String main, String[] detail, Model model) {
		logger.info("??????????????????????????????3 main={}",main);
		
		for (String dt : detail) {
			logger.info("??????????????????????????????3 detail={}",dt);
		}
		List<String> strList = new ArrayList<String>();
		for(int i = 0; i < detail.length; i++) {
			strList.add(detail[i]);
		}
		model.addAttribute("strList", strList);
		
		return "expert/expRegister3";
	}
	
	@RequestMapping("/join")
	public String join(@ModelAttribute ExpertVO vo, @RequestParam String[] str, Model model) {
		logger.info("???????????? ?????? ???????????? vo={}",vo);
		int cnt = service.insert(vo);
		int expNo = vo.getExpertNo();
		logger.info("???????????? ?????? ?????? cnt={}",cnt);
		int[] arr = new int[str.length];
		FieldVO f_vo = new FieldVO();
		String msg = "???????????? ??????", url = "/register";
		if(cnt > 0) {
			for(int i = 0; i < arr.length; i++) {
				arr[i] = c_service.selectByDetail(str[i]);
				f_vo.setCategoryNo(arr[i]);
				f_vo.setExpertNo(expNo);
				int res = f_service.insert(f_vo);
				if(res > 0) {
					msg = "???????????? ??? ?????? ?????? ??????";
					url = "/login/expLogin";
				} else {
					msg = "?????? ?????? ??????";
					url = "/login/expLogin";
				}
			}
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/checkemail")
	public String checkEmail(@RequestParam String email, Model model) {
		logger.info("????????????????????? email={}",email);
		int result = 0;
		
		if(email != null && !email.isEmpty()) {
			result = service.duplicatedId(email);
			logger.info("???????????? ?????? result={}",result);
		}
		
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID", service.EXIST_ID);
		model.addAttribute("NON_EXIST_ID", service.NON_EXIST_ID);
		
		return "member/checkemail";
	}
	
	//
	@RequestMapping("/addExp/addInfo")
	public String addInfo1(HttpSession session) {
		logger.info("????????? ???????????? ???????????????1");
		String email = (String) session.getAttribute("email");
		String name = (String) session.getAttribute("neme");
		String img = (String) session.getAttribute("img");
		return "expert/addExp/addInfo";
	}
	
	@RequestMapping("/addExp/post")
	public String update_addExp(@ModelAttribute ExpertVO vo, HttpServletRequest request) {
		logger.info("??????, ???????????? ???????????? ??????????????? vo = {}",vo);
		
		//?????? ????????? ??????
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
					
			logger.info("?????? ????????? ??????, fileName={}", fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		vo.setFileName(fileName);
		vo.setFileSize(fileSize);
		vo.setOriginalFileName(originName);
		
		int cnt = service.updateExpert(vo);
		if(cnt > 0) {
			logger.info("???????????? ??????");
		} else {
			logger.info("??????");
		}
		return "redirect:/expert/addExp/addInfo2";
	}
	
	@RequestMapping("/addExp/addInfo2")
	public String addInfo2() {
		logger.info("????????? ???????????? ???????????????2");
		
		return "expert/addExp/addInfo2";
	}
	
	@RequestMapping("/addExp/addInfo3")
	public String addInfo3_get(@RequestParam(value="main", required = false) String main, Model model) {
		logger.info("????????? ???????????? ???????????????3 main = {}", main);
		
		List<CategoryVO> list = c_service.selectByMain(main);
		model.addAttribute("main", main);
		model.addAttribute("clist", list);
		return "expert/addExp/addInfo3";
	}
	
	@RequestMapping("addExp/post2")
	public String addInfo3_post(HttpSession session, @RequestParam String main, String[] detail, Model model) {
		int expNo = (int) session.getAttribute("userNo");
		logger.info("????????? ???????????? ???????????? ????????? expNo = {}",expNo);
		
		int[] arr = new int[detail.length];
		FieldVO f_vo = new FieldVO();
		String msg = "???????????? ????????????", url = "/expert/addExp/addInfo2";
		for(int i = 0; i < detail.length; i++) {
			logger.info("????????? ???????????? ???????????? ????????? detail={}",detail[i]);
			arr[i] = c_service.selectByDetail(detail[i]);
			
			if(arr[i] > 0) {
				f_vo.setCategoryNo(arr[i]);
				f_vo.setExpertNo(expNo);
				int res = f_service.insert(f_vo);
				if(res > 0) {
					msg = "???????????? ??????";
					url = "/index";
				} else {
					msg = "???????????? ????????????";
				}
			} else {
				msg = "?????? ????????????";				
			}
			
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
				
		return "common/message";
	}
	
//	????????? ????????? or ????????????
	@RequestMapping("expkakaojoin")
	public String kakaoJoin() {
		StringBuffer loginUrl = new StringBuffer();
        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
        loginUrl.append("56bf08692479c92a0298b16483f2071a"); 
        loginUrl.append("&redirect_uri=");
        loginUrl.append("http://localhost:9091/farming/login/expkakao"); 
        loginUrl.append("&response_type=code");
        
        System.out.println("loginUrl : "+loginUrl.toString());
        return "redirect:"+loginUrl.toString();
	}


//	???????????? ????????? or ????????????
	@RequestMapping("expfacebookjoin")
	public String facebookjoin() {
		String facebookurl = o_service.expGetAuthorizationUrl();
        System.out.println("facebookurl : "+facebookurl);
        return "redirect:"+facebookurl;
	}
	

	@RequestMapping("/change")
	public String changePwd(@RequestParam String email, String pwd, Model model) {
		logger.info("????????? ?????? ??? ???????????? ?????? ?????? ???????????? email = {}, pwd = {}",email, pwd);
		
		int cnt = service.updatePwd(email, pwd);
		String msg = "???????????? ?????? ??????", url = "/login/expfindpwd";
		if(cnt > 0) {
			msg = "?????? ??????";
			url = "/login/expLogin";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

//  ????????? ?????? ??????
	@GetMapping("/mypage/profile")
	public String edit_get(HttpSession session, Model model) {
		String email=(String) session.getAttribute("email");
		logger.info("???????????? ?????? ??????, ???????????? email={}", email);
		
		ExpertVO vo= service.selectByEmail(email);
		logger.info("???????????? - ?????? ?????? vo={}", vo);
		
		model.addAttribute("vo", vo);
		return "expert/mypage/profile";
	}
	
	@PostMapping("/mypage/profile")
	public String edit_post(@ModelAttribute ExpertVO vo, HttpSession session, HttpServletRequest request, Model model) {
		vo.setEmail((String) session.getAttribute("email"));
		vo.setName((String) session.getAttribute("name"));
		vo.setPwd(pwdEncoder.encode(vo.getPwd()));
		
		logger.info("???????????? ??????, ???????????? vo={}", vo);
		
		//?????? ????????? ??????
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
			
			logger.info("?????? ????????? ??????, fileName={}", fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		vo.setFileName(fileName);
		vo.setFileSize(fileSize);
		vo.setOriginalFileName(originName);
		
		String msg="", url="/mypage/profile";
		
		int cnt=service.updateExpert(vo);
		logger.info("???????????? ??????, cnt={}", cnt);
		
		if(cnt>0) {
			msg="?????????????????????. ?????? ????????? ????????????.";
			url="/login/logout";
		}else {
			msg="???????????? ?????? ??????!";
		}		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
			
		return "common/message";

	}
	
//  ?????? ?????? ??????
	@RequestMapping(value="/mypage/checkpwd", method=RequestMethod.GET)
	public String check_get(@RequestParam(defaultValue = "0") String email, 
			Model model) {
		
		if(email==null) {
			model.addAttribute("msg", "????????? url?????????.");
			model.addAttribute("url", "/expert/mypage/main");
			return "common/message";
		}
		
		ExpertVO vo = service.selectByEmail(email);
		
		model.addAttribute("vo",vo);
		
		return "expert/mypage/checkpwd";
	}
	
	@RequestMapping(value="/mypage/checkpwd", method=RequestMethod.POST)
	public String check_post(@ModelAttribute ExpertVO vo, Model model) {
		ExpertVO exVo=service.selectByEmail(vo.getEmail());
		boolean chk = pwdEncoder.matches(vo.getPwd(), exVo.getPwd());
		logger.info("?????? ??????, ???????????? vo={}", vo);
		
		String msg="??????????????? ??????????????????.", url="/expert/mypage/checkpwd?email="+vo.getEmail();
		if(chk) {
				msg="?????????????????????.";
				url="/expert/mypage/profile";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
			
		return "common/message";


	}
	
	// ????????? ??????
	@GetMapping("/mypage/out")
	public void out_get() {
		logger.info("????????? ?????? ??????");
	}
	
	@PostMapping("/mypage/out")
	public String out_post(@ModelAttribute ExpertVO vo, HttpSession session,
			HttpServletResponse response, Model model) {
		String pwd = (String) session.getAttribute("pwd");
		
		String msg="???????????? ?????? ??????", url="/expert/mypage/out";
		if(pwdEncoder.matches(vo.getPwd(), pwd)) {
			vo.setEmail(vo.getEmail());
			vo.setPwd(pwd);
			int cnt = service.delete(vo);
			logger.info("cnt : {}",cnt);
			if(cnt>0) {
				msg="?????????????????????.";
				url="/index";
				session.invalidate();
			}else {
				msg="???????????? ?????? ??????";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//????????? ????????? ?????? ???????????? ???????????????
	@RequestMapping("/addExp/addExp")
	public String addExp1(HttpSession session) {
		int expNo = (int) session.getAttribute("userNo");
		logger.info("??????????????????????????? expNo={}",expNo);
		
		String main = service.selectMain(expNo);
		int categoryNo = service.selectCategory(expNo);
		logger.info("main = {}, category = {}", main, categoryNo);
		
		return "expert/addExp/addExp";
	}
	
	@RequestMapping("/addExp/addExpPost")
	public String addExp2(@ModelAttribute ExpertInfoVO infoVo, Model model, HttpSession session) {
		if(infoVo.getLicense() == null && infoVo.getLicense().isEmpty()) {
			infoVo.setLicense("0");
		}
		int categoryNo = service.selectCategory(infoVo.getExpertNo());
		infoVo.setCategoryNo(categoryNo);
		logger.info("????????????????????????????????? rVo = {}",infoVo);			
		int cnt = fe_service.insertExpInfo(infoVo);
		String msg = "???????????? ?????? ??????", url = "/expert/addExp/addExp";
		if(cnt > 0) {
			msg = "???????????? ??????";
			url = "/index";
		}
		
		session.setAttribute("career", infoVo.getCareer());
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
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
