package com.jdh.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

 import com.jdh.dao.*;
 import com.jdh.dto.*;

 

@WebServlet("/login.do")

public class LoginServlet extends HttpServlet {

             private static final long serialVersionUID = 1L;

 

             protected void doGet(HttpServletRequest request, HttpServletResponse response)

             throws ServletException, IOException {

          // index.jsp의 링크에 의해 요청되어 자동 호출 됨

          String url = "member/login.jsp";

 

          //세션 값 얻어내기(session 이유 : 로그인 한 후에 해당 userid를 세션에 저장시키기 위해서!!)

          //=> 저장된 세션명 : "loginUser"으로 생성 할것이다.

          HttpSession session = request.getSession();

         if(session.getAttribute("loginUser") != null) {

                //값이 저장 되어있으면 url값을 main.jsp로 변경 시킬 것이다.

                //아이디가 있기 때문에 메인페이지로 이동. 

                 url="main.jsp";

         }

             RequestDispatcher rd = request.getRequestDispatcher(url);

             rd.forward(request, response);

          }

 

             protected void doPost(HttpServletRequest request, HttpServletResponse response)

             throws ServletException, IOException {
            	 String url = "member/login.jsp";
         		
         		String userid = request.getParameter("userid");
         		String pwd = request.getParameter("pwd");
         		//이 두값을 가지고 값을 비교해야하므로
         		MemberDAO dao = MemberDAO.getInstance();
         		
         		int result = dao.userCheck(userid, pwd);
         		
         		if(result == 1) {
         			//로그인 성공
         			MemberDTO dto = dao.getMember(userid);
         			
         			HttpSession session = request.getSession();
         			session.setAttribute("loginUser", dto);
         			
         			request.setAttribute("message", "로그인 되었습니다.");
         			url = "main.jsp";
         		} 
         		else if(result == 0) {
         			//비밀번호 틀림
         			request.setAttribute("message", "비밀번호가 틀렸습니다.");
         			response.setContentType("text/html; charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert('비밀번호가 틀렸습니다'); location.href='http://localhost:8080/jwbook/login.do';</script>");
                    out.flush();
    
         	
         			
   
         		} 
         		else if(result == -1) {
         			//아이디 없음
         			request.setAttribute("message", "존재하지 않는 아이디 입니다.");
         			response.setContentType("text/html; charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert('존재하지 않는 아이디입니다'); location.href='http://localhost:8080/jwbook/login.do';</script>");
                    out.flush();
    
         	
         			
         			
         		}
         		
         		RequestDispatcher rd = request.getRequestDispatcher(url);
         		rd.forward(request, response);
         	}

}