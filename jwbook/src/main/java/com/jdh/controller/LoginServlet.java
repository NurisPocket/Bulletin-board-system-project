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



          String url = "member/login.jsp";

 


          HttpSession session = request.getSession();

         if(session.getAttribute("loginUser") != null) {

             

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
       
         		MemberDAO dao = MemberDAO.getInstance();
         		
         		int result = dao.userCheck(userid, pwd);
         		
         		if(result == 1) {
         	
         			MemberDTO dto = dao.getMember(userid);
         			
         			HttpSession session = request.getSession();
         			session.setAttribute("loginUser", dto);
         			
         			request.setAttribute("message", "로그인 되었습니다.");
         			url = "main.jsp";
         		} 
         		else if(result == 0) {
      
         			request.setAttribute("message", "비밀번호가 틀렸습니다.");
         			response.setContentType("text/html; charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert('비밀번호가 틀렸습니다'); location.href='http://localhost:8080/jwbook/login.do';</script>");
                    out.flush();
    
         	
         			
   
         		} 
         		else if(result == -1) {
         		
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