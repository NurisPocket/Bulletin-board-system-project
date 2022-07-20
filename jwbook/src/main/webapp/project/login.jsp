<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>
    <!--          meta 선언          -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--          link 선언          -->
    <link rel="stylesheet" href="../project/style.css">
    <link rel="stylesheet" href="../project/style_login.css">

    <!--          script 선언          -->
    <script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script src="../project/script.js"></script>

    <title>
        Jo's
    </title>
    <script>
    	document.addEventListener("DOMContentLoaded", function(){
    		new TypeIt("#typing",{
    			strings:"The most versatile typing utility on the planet",}).go();});
    	
  
    
    </script>
</head>

<body>
    <header>
        <div class="header_container">
            <div class="logo_container">
                <a href="../index.jsp">BLOG</a>
            </div>
            <div class="nav_container" id="nav_menu">
                <div class="menu_container">
                    <ul class="menu">
                        <li class="menu_1">
                            <a class="menu_title">메뉴 1</a>
                            <ul class="menu_1_content">
                                <li><a class="menu_index" href="#">메뉴 1 - 1</a></li>
                                <li><a class="menu_index" href="#">메뉴 1 - 2</a></li>
                                <li><a class="menu_index" href="#">메뉴 1 - 3</a></li>
                            </ul>
                        </li>
                        <li class="menu_2">
                            <a class="menu_title">메뉴 2</a>
                            <ul class="menu_2_content">
                                <li><a class="menu_index" href="#">메뉴 2 - 1</a></li>
                                <li><a class="menu_index" href="#">메뉴 2 - 2</a></li>
                                <li><a class="menu_index" href="#">메뉴 2 - 3</a></li>
                            </ul>
                        </li>
                        <li class="menu_3">
                            <a class="menu_title">메뉴 3</a>
                            <ul class="menu_3_content">
                                <li><a class="menu_index" href="#">메뉴 3 - 1</a></li>
                                <li><a class="menu_index" href="#">메뉴 3 - 2</a></li>
                                <li><a class="menu_index" href="#">메뉴 3 - 3</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="login_container">
                    <ul class="login">
                        <li class="menu_login"><a class="menu_title" href="./login.jsp">로그인</a></li>
                        <li class="menu_join"><a class="menu_title" href="./join.jsp">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <div class="login_containers">
    	<h1 id = "typing"> </h1>
       <h1 class="ml1">
  <span class="text-wrapper">
    <span class="line line1"></span>
    <span class="letters">Board</span>
    <span class="line line2"></span>
  </span>
</h1>

<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
        <form method="post" action="./login_Action.jsp">
            <h3>아이디</h3>
            <div class="loginID">
                <input type="text" class="input" placeholder="아이디" name="userID" maxlength="20">
            </div>
            <h3>비밀번호</h3>
            <div class="loginPassword">
                <input type="password" class="input" placeholder="비밀번호" name="userPassword" maxlength="20">
            </div>
            <input type="submit" class="bt_login" value="로그인">
        </form>
    </div>

    <footer>
        <div class="footer_container">
            <div class="footA">
                Jo's
            </div>
            <div class="footB">
                Copyright © Jo's All Rights Reserved.
            </div>
        </div>
    </footer>
</body>

</html>

