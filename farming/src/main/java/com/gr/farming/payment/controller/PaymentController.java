package com.gr.farming.payment.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gr.farming.cash.model.CashService;
import com.gr.farming.cash.model.CashVO;
import com.gr.farming.category.model.CategoryService;
import com.gr.farming.category.model.CategoryVO;
import com.gr.farming.expert.model.ExpertVO;
import com.gr.farming.findExp.model.ExpertInfoVO;
import com.gr.farming.findExp.model.FindExpService;
import com.gr.farming.member.model.MemberService;
import com.gr.farming.member.model.MemberVO;
import com.gr.farming.order.model.OrderService;
import com.gr.farming.order.model.OrderVO;
import com.gr.farming.request.model.FinalRequestVO;
import com.gr.farming.request.model.RequestService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	private MemberService mservice;
	private OrderService oservice;
	private CashService cservice;
	private RequestService rservice;
	private FindExpService feservice;
	private CategoryService category;
	
	@Autowired
	public PaymentController(MemberService mservice, OrderService oservice, CashService cservice,
			RequestService rservice, FindExpService feservice, CategoryService category) {
		super();
		this.mservice = mservice;
		this.oservice = oservice;
		this.cservice = cservice;
		this.rservice = rservice;
		this.feservice = feservice;
		this.category = category;
	}

	@RequestMapping("/paymentDetail")
	public String paymentDetail(int finalRequestNo, HttpSession session, Model model) {
		
		logger.info("결제디테일 파라미터 finalRequestNo={}", finalRequestNo);
		String email = (String) session.getAttribute("email");
		
		FinalRequestVO rVo=rservice.selectFinalDetail2(finalRequestNo);
		ExpertInfoVO expInfoVo=feservice.selectExpInfo(rVo.getExpertNo());
		ExpertVO expVo=feservice.selectByExperNo(rVo.getExpertNo());
		CategoryVO categoryVo=category.selectByNo(rVo.getCategoryNo());
		logger.info("rVo={}", rVo);
		
		MemberVO mVo = mservice.selectByEmail(email);
		CashVO cVo = cservice.selectByMemNo(mVo.getMemberNo());
		
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(d);
		
		model.addAttribute("cVo",cVo);
		model.addAttribute("mVo",mVo);
		model.addAttribute("rVo",rVo);
		model.addAttribute("expInfoVo",expInfoVo);
		model.addAttribute("expVo",expVo);
		model.addAttribute("categoryVo",categoryVo);
		model.addAttribute("today",today);
		
		return "payment/paymentDetail";
	}

	@ResponseBody
	@RequestMapping("/complete")
	public int complete(@ModelAttribute OrderVO vo, @RequestParam(value = "chk") String chk, @RequestParam(value = "pay", defaultValue = "0") int pay) {
		logger.info("결제처리 vo = {}",vo);
		logger.info("chk : {}, pay : {}",chk,pay);
		
		vo.setExpertNo(0);
		vo.setExpertName("");
		vo.setServiceName("");
		vo.setServiceNo(0);
		
		CashVO cVo = cservice.selectByMemNo(vo.getMemberNo());
		cVo.setCharge(-pay);
		cVo.setMemberNo(vo.getMemberNo());
		cVo.setMerchantUid(vo.getMerchantUid());
		
		int res = oservice.insert(vo);
		if(res > 0) {
			if(chk.equals("Y")) {
				res = cservice.insert(cVo);
				if(res > 0) {
					res = cservice.plusBal(cVo.getMemberNo());
				}
			}
			logger.info("성공");
		} else {
			logger.info("실패");
		}
		return res;
	}
	
	@ResponseBody
	@RequestMapping("/checkPay")
	public boolean checkPay(@RequestParam(value = "pay", defaultValue = "0") int pay, @RequestParam(value = "memNo", defaultValue = "0") int memNo) {
		logger.info("pay : {}",pay);
		CashVO vo = cservice.selectByMemNo(memNo);
		int dbPay = vo.getBalance();
		boolean res = false;
		if(pay > dbPay) {
			res = false;
		} else if(pay < dbPay) {
			res = true;
		}
		return res;
	}
	
	@ResponseBody
	@RequestMapping("/chk")
	public boolean chk(@RequestParam(value = "pay", defaultValue = "0") int pay, @RequestParam(value = "total", defaultValue = "0") int total, @RequestParam(value = "chk") String chk) {
		logger.info("pay : {}, total : {}, chk : {}",pay,total,chk);
		boolean res = false;
		if(chk.equals("Y")) {
			res = true;
		} else {
			res = false;
		}
		return res;
	}
}
