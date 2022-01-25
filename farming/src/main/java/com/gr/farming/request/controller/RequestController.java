package com.gr.farming.request.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.farming.category.model.CategoryService;
import com.gr.farming.category.model.CategoryVO;
import com.gr.farming.common.ConstUtil;
import com.gr.farming.common.FieldSearchVO;
import com.gr.farming.common.FileUploadUtil;
import com.gr.farming.common.PaginationInfo;
import com.gr.farming.common.SearchVO2;
import com.gr.farming.field.model.FieldDetailVO;
import com.gr.farming.findExp.model.ExpertInfoVO;
import com.gr.farming.findExp.model.FindExpService;
import com.gr.farming.member.model.MemberService;
import com.gr.farming.request.model.FinalRequestVO;
import com.gr.farming.request.model.RequestDesignVO;
import com.gr.farming.request.model.RequestDevelopVO;
import com.gr.farming.request.model.RequestQnaVO;
import com.gr.farming.request.model.RequestService;
import com.gr.farming.request.model.RequestVO;

@Controller
@RequestMapping("/request")
public class RequestController {

	private static final Logger logger
		= LoggerFactory.getLogger(RequestController.class);
	
	private final RequestService requestService;
	private final CategoryService categoryService;
	private final FindExpService findExpService;
	private final MemberService memService;
	private final FileUploadUtil fileUploadUtil;

	@Autowired
	public RequestController(RequestService requestService, CategoryService categoryService,
			FindExpService findExpService, MemberService memService, FileUploadUtil fileUploadUtil) {
		this.requestService = requestService;
		this.categoryService = categoryService;
		this.findExpService = findExpService;
		this.memService = memService;
		this.fileUploadUtil = fileUploadUtil;
	}

	@RequestMapping("/request")
	public void request(@RequestParam int categoryNo, Model model) {
		logger.info("견적서 작성 메인화면 보여주기, 파라미터 categoryNo={}", categoryNo);

		CategoryVO categoryVo=categoryService.selectByNo(categoryNo);
		String detail=categoryVo.getDetail();
		
		model.addAttribute("categoryNo",categoryNo);
		model.addAttribute("detail", detail);
		
	}
	
	@GetMapping("/requestWrite")
	public String request_get(@RequestParam int categoryNo,
			@RequestParam(defaultValue="0") int expertNo, Model model) {
		
		logger.info("견적서 작성 메인화면 보여주기, 파라미터 categoryNo={}", categoryNo);
		CategoryVO categoryVo=categoryService.selectByNo(categoryNo);

		String main=categoryVo.getMain();
		String detail=categoryVo.getDetail();
		logger.info("detail={}",detail);
		
		List<Map<String, Object>> qList=requestService.selectQuestion(categoryNo);
		logger.info("견적서 질문 조회 결과, qList.size={}", qList.size());
		
		List<RequestQnaVO> aList=requestService.selectRequestQna(categoryNo);
		
		model.addAttribute("qList", qList);
		model.addAttribute("aList", aList);
		model.addAttribute("categoryNo",categoryNo);
		model.addAttribute("main", main);
		model.addAttribute("expertNo", expertNo);
		model.addAttribute("detail", detail);
		
		return "request/request_1";
	}
	
	@PostMapping("/requestWrite/develop")
	public String requestDevelop_post(@ModelAttribute RequestDevelopVO vo, 
			@ModelAttribute RequestVO requestVo, Model model) {
		
		logger.info("견적서 작성 내용입력 처리");
		logger.info("견적서 처리 파라미터 vo={}", vo);
		
		int cnt=requestService.insertRequestDevelop(vo);
		logger.info("견적서 처리 결과 cnt={}", cnt);
		
		requestVo.setRequestDevelopNo(vo.getRequestdevelopNo());
		cnt=requestService.insertRequest(requestVo);
		logger.info("견적서 처리 requestVo={}", requestVo);
		logger.info("견적서요청 처리 결과 cnt={}", cnt);
		
		String msg="견적서 보내기 실패", url="request/request_develop";
		if(cnt>0) {
			msg="견적서 작성이 처리되었습니다.";
			url="/request/request_success";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@PostMapping("/requestWrite/design")
	public String requestDesign_post(@ModelAttribute RequestDesignVO vo, 
			@ModelAttribute RequestVO requestVo, Model model) {
		logger.info("견적서 작성 내용입력 처리, 파라미터 vo={}", vo);
		
		int cnt=requestService.insertRequestDesign(vo);
		logger.info("견적서문답 처리 결과 cnt={}", cnt);
		
		requestVo.setRequestDesignNo(vo.getRequestDesignNo());
		cnt=requestService.insertRequest(requestVo);
		logger.info("견적서 처리 requestVo={}", requestVo);
		logger.info("견적서요청 처리 결과 cnt={}", cnt);
		
		String msg="견적서 보내기 실패", url="request/request_design";
		if(cnt>0) {
			msg="견적서 작성이 처리되었습니다.";
			url="/request/request_success";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/request_success")
	public String request_success() {
		logger.info("견적서 작성 완료 화면");
		return "request/request_success";
	}
	
	@RequestMapping("/requestByClient")
	public String requestByClient(@ModelAttribute FieldSearchVO fieldSearchVo
			, HttpSession session, Model model) {
		
		int expertNo=(int) session.getAttribute("userNo");
		ExpertInfoVO expInfoVo=findExpService.selectExpInfo(expertNo);
		if(expInfoVo==null) {
			model.addAttribute("msg", "추가정보를 먼저 입력하세요.");
			model.addAttribute("url", "/expert/addExp/addExp");
			return "common/message";
		}
		
		fieldSearchVo.setUserNo(expertNo);
		logger.info("받은 요청 페이지 - 파라미터 fieldSearchVo={}", fieldSearchVo);
		
		List<Map<String, Object>> sendList=requestService.selectFinalRequest(expertNo);
		
		String detail=fieldSearchVo.getDetail();
		if(detail==null || detail.isEmpty()) {
			fieldSearchVo.setDetail("");
		}
		
		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(fieldSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2] fieldSearchVo에 페이징에 필요한 값 세팅
		fieldSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		fieldSearchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("값 셋팅 후 fieldSearchVo={}", fieldSearchVo);
		
		ExpertInfoVO infoVo=findExpService.selectExpInfo(expertNo);
		List<FieldDetailVO> fieldList=findExpService.selectFieldDetail(expertNo);
		
		List<Map<String, Object>> list=null;
		int cNo=infoVo.getCategoryNo();
		if(cNo<15) {
			list=requestService.selectRequestList1(fieldSearchVo);
		}else if(cNo>=15) {
			list=requestService.selectRequestList2(fieldSearchVo);
		}
		
		logger.info("받은 요청 목록 조회 list={}", list);
		logger.info("받은 요청 목록 조회 detail={}, list.size={}", fieldSearchVo.getDetail(),list.size());
		
		int totalRecord=requestService.selectTotalRecord(fieldSearchVo);
		logger.info("받은 요청 목록 조회 수 - totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("sendList", sendList);
		model.addAttribute("fieldList", fieldList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "request/requestByClient";
	}
	
	@GetMapping("/finalRequest")
	public String sendFinalRequest(@RequestParam(defaultValue="0") int requestNo,
			 HttpSession session, Model model) {
		int expertNo=(int) session.getAttribute("userNo");
		
		logger.info("견적 보내기 페이지, 파라미터 requestNo={} ", requestNo);
		
		RequestVO vo=requestService.selectReceivedRequest(requestNo);
		logger.info("해당 견적정보 - vo={}", vo);
		
		int developNo=vo.getRequestDevelopNo();
		int designNo=vo.getRequestDesignNo();
		vo.setExpertNo(expertNo);
		Map<String, Object> map=null;
		if(developNo!=0) {
			map=requestService.selectRequestDetail1(vo);
		}else if(designNo!=0) {
			map=requestService.selectRequestDetail2(vo);
		}
		logger.info("해당 견적정보 출력 - map={}", map);
		List<Map<String, Object>> qList=requestService.selectQuestion(vo.getCategoryNo());
		
		model.addAttribute("developNo", developNo);
		model.addAttribute("designNo", designNo);
		model.addAttribute("map", map);
		model.addAttribute("qList", qList);
		
		return "/request/finalRequest";
		
	}
	
	@PostMapping("/finalRequest")
	public String sendFinalRequest(@ModelAttribute FinalRequestVO vo,
			HttpServletRequest request, HttpSession session,Model model) {
		
		int expertNo=(int) session.getAttribute("userNo");
		vo.setExpertNo(expertNo);
		logger.info("견적 보내기 페이지 - 최종견적 작성 파라미터, vo={}", vo);
		
		//파일 업로드 처리
		String fileName="", originName="";
		long fileSize=0;
		int pathFlag=ConstUtil.UPLOAD_REQUSET_FLAG;
		try {
			List<Map<String, Object>> fileList 
				= fileUploadUtil.fileUpload(request, pathFlag);
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
		
		//2
		vo.setFilename(fileName);
		vo.setOriginalFilename(originName);
		vo.setFilesize(fileSize);
		
		int cnt=requestService.insertFinalRequest(vo);
		String msg="최종견적보내기 실패", url="/";
		if(cnt>0) {
			msg="견적보내기에 성공하였습니다.";
			url="/request/requestByClient";
		}
		
		requestService.updateMatchA(vo.getRequestNo());
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/myRequest")
	public String myRequest(HttpSession session, Model model) {
		
		logger.info("견적요청 목록");
		
		int memberNo=(int) session.getAttribute("userNo");
		
		List<Map<String, Object>> list=requestService.selectMyRequestAll(memberNo);
		logger.info("보낸 요청 list={}", list);
		logger.info("보낸 요청 list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "request/MyRequest";
	}
	
	@RequestMapping("/requestByExpert")
	public String requestByExpert(@RequestParam(defaultValue="0") int requestNo, 
			@ModelAttribute SearchVO2 searchVo, HttpSession session, Model model) {
		
		logger.info("받은 견적 상세 목록 페이지, 파라미터 searchVo={}", searchVo);
		int memberNo=(int) session.getAttribute("userNo");
		searchVo.setMemNo(memberNo);
		
		
		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2] fieldSearchVo에 페이징에 필요한 값 세팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("값 셋팅 후 SearchVo={}", searchVo);
		
		List<Map<String, Object>> list=requestService.selectFinalDetail(requestNo);
		logger.info("전체조회 결과 list.size={}", list.size());
		
		RequestVO vo=requestService.selectReceivedRequest(requestNo);
		logger.info("해당 견적정보 - vo={}", vo);
		
		int developNo=vo.getRequestDevelopNo();
		int designNo=vo.getRequestDesignNo();
		
		Map<String, Object> myRequest=requestService.selectMyRequestDetail(requestNo);
		List<Map<String, Object>> qList=requestService.selectQuestion(vo.getCategoryNo());
		
		int totalRecord=requestService.selectTotalRecord2(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("받은 요청 목록 조회 수 - totalRecord={}", totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("qList", qList);
		model.addAttribute("map", myRequest);
		model.addAttribute("developNo", developNo);
		model.addAttribute("designNo", designNo);
		
		return "request/requestByExpert";
	}
	
	
}













