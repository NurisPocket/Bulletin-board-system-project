package com.jdh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.jdh.dao.*;
import com.jdh.dto.*;

@WebServlet("/join.do")

     public class JoinServlet extends HttpServlet {

     private static final long serialVersionUID = 1L;

 

     protected void doGet(HttpServletRequest request, HttpServletResponse response)

     throws ServletException, IOException {

          //login.jsp에서 회원가입을 눌렀을때

          //여기서는 회원가입 화면(member/join.jsp)만 응답처리할 것이다.

     RequestDispatcher rd = request.getRequestDispatcher("member/join.jsp");

     rd.forward(request, response);

     }

 

protected void doPost(HttpServletRequest request, HttpServletResponse response)

throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");
	
	MemberDTO dto = new MemberDTO();
	dto.setName(request.getParameter("name"));
	dto.setUserid(request.getParameter("userid"));
	dto.setPwd(request.getParameter("pwd"));
	dto.setEmail(request.getParameter("email"));
	dto.setPhone(request.getParameter("phone"));
	dto.setGender(Integer.parseInt(request.getParameter("gender")));
	
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.insertMember(dto);
	
	HttpSession session = request.getSession();
	if(result == 1) {
		//초기 로그인 화면에서 아이디를 바로 출력하기 위한 코드
		session.setAttribute("userid", dto.getUserid());
		session.setAttribute("message", "회원 가입에 성공했습니다.");
	} else {
		session.setAttribute("message", "회원 가입에 실패했습니다.");
	}
	
	RequestDispatcher rd = request.getRequestDispatcher("member/login.jsp");
	rd.forward(request, response);
}

}