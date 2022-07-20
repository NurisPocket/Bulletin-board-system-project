package com.jdh.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import com.jdh.dao.*;
import com.jdh.dto.*;
 

@WebServlet("/idCheck.do")

public class IdCheckServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

 

    protected void doGet(HttpServletRequest request, HttpServletResponse response)

     throws ServletException, IOException {

// join.jsp => 중복체크버튼 => script/member.js => idCheck() 내에서 window.open()로 요청

     String userid=request.getParameter("userid");

 

     MemberDAO dao=MemberDAO.getInstance();

     int result=dao.confirmID(userid); // 1(아이디존재) / -1 (아이디존재하지 않을 경우)

 

     request.setAttribute("userid", userid);

     request.setAttribute("result", result);

     RequestDispatcher rd=request.getRequestDispatcher("member/idcheck.jsp");

     rd.forward(request, response);

}

     protected void doPost(HttpServletRequest request, HttpServletResponse response)

     throws ServletException, IOException {

 

     }

}