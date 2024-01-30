package com.web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.spring.service.WebService_login;
import com.web.spring.vo.Dept;
import com.web.spring.vo.Emp;
import com.web.spring.vo.EmpInfo;

import jakarta.servlet.http.HttpSession;

@Controller
public class WebController_login {
	@Autowired(required = false)
	private WebService_login service;

	// http://211.63.89.67:2222/pms/login.do
	// http://localhost:8088/pms/login.do
	// http://localhost:7080/pms/login.do
	@GetMapping("login.do")
	public String loginFrm() {
		return "login";
	}

	@RequestMapping("login.do")
	public String login(Emp emp, HttpSession session) {
		Emp empResult = service.login(emp);
		System.out.println("데이터 check:");
		System.out.println(empResult);
		if (empResult != null) {
			System.out.println("DB 속성:" + empResult.getEname());
			session.setAttribute("empResult", empResult);
		}
		return "login";
	}

	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.do";
	}

	@GetMapping("forgot.do")
	public String forgot() {
		return "forgot";
	}

	@GetMapping("signUp.do")
	public String signUpFrm() {
		return "signUp";
	}

	@PostMapping("signUp.do")
	public String signUp(Emp ins, Model d) {
		d.addAttribute("msg", service.signUp(ins));
		return "signUp";
	}

	@GetMapping("mypage.do")
	public String mypageFrm(HttpSession session, Model d) {
		Emp emp = (Emp) session.getAttribute("empResult");
		int empno = emp.getEmpno();
		// 회원정보 조회
		EmpInfo empInfo = service.getEmpInfo(empno);
		d.addAttribute("empInfo", empInfo);
		/* session.setAttribute("empInfo", empInfo); */
		return "mypage";
	}

	@PostMapping("mypage.do")
	public String updateEmpInfo(HttpSession session, Emp upt, Model d) {
		d.addAttribute("msg", service.updateEmpInfo(upt));
		// 다시 세션에서 로그인한 사용자 정보를 가져와 회원정보 조회
		Emp emp = (Emp) session.getAttribute("empResult");
		int empno = emp.getEmpno();
		d.addAttribute("empInfo", service.getEmpInfo(empno));
		return "mypage";
	}

	// 부서등록 페이지
	@GetMapping("deptReg.do")
	public String deptRegFrm() {
		return "deptReg";
	}

	// 부서등록
	@PostMapping("deptReg.do")
	public String deptReg(Dept ins, Model d) {
		d.addAttribute("msg", service.insertDept(ins));
		return "deptReg";
	}

}
