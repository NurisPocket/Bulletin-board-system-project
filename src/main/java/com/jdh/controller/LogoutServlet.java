package com.jdh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

 

@WebServlet("/logout.do")

public class LogoutServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

 

     protected void doGet(HttpServletRequest request, HttpServletResponse response)

     throws ServletException, IOException {

//main.jsp의 로그아웃 버튼

      HttpSession session = request.getSession();

//세션 데이터 삭제

     session.invalidate();

 

     RequestDispatcher rd = request.getRequestDispatcher("CRUD/login.jsp");

     rd.forward(request, response);

}

 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)

    throws ServletException, IOException {

 

    }

}

 