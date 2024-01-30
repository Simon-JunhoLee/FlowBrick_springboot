package com.web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebController {

	
	// http://211.63.89.67:2222/pms/index.do	
	// http://localhost:2223/indpsjex.do
	@RequestMapping("index.do")
	public String index() {
		return "index";
	}


}
