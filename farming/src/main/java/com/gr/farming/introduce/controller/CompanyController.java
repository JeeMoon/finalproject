package com.gr.farming.introduce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/introduce")
public class CompanyController {

	@RequestMapping("/company")
	public String qnaMain() {
		return "introduce/company";
	}
}
