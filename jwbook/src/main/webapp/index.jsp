<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!--          meta 선언          -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--          link 선언          -->
    <link rel="stylesheet" href="./member/style.css">
    <link rel="stylesheet" href="./member/style_login.css">

    <!--          script 선언          -->
    <script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

 <style>
 #in:hover{
 	color: red;
 }
 #wr:hover{
 	color: red;
 }
 #lo:hover{
 	color: orange;
 }
 
 #jo:hover{
 	color: orange;
 }
 
 #in{
 font-family: 굴림;
 font-weight:bolder;
}

#wr{
	 font-family:굴림;
   font-weight:bolder;
}
 
#lo{
	font-weight:bolder;
}

#jo{
	font-weight:bolder;
}
#ma{
  font-family: fantasy; 
}
 
 </style>
  
<title>index.jsp</title>
</head>
<body>
	   <header>
        <div class="header_container">
            <div class="logo_container">
                <a id="ma" href="./index.jsp">Board</a>
            </div>
            <div class="nav_container" id="nav_menu">
                <div class="menu_container">
                    <ul class="menu">
                        <li class="menu_1">
                            <a id="in" class="menu_title">페이지 소개</a>
                           
                        </li>
                        <li class="menu_2">
                            <a id="wr" class="menu_title">게시판 글쓰기</a>
                            
                        </li>
                    </ul>
                </div>
                <div class="login_container">
                    <ul class="login">
                        <li class="menu_login"><a id="lo" class="menu_title" href="login.do">로그인</a></li>
                        <li class="menu_join"><a id="jo" class="menu_title" href="join.do">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    
 <div class="a"> 
 	<div class="b">
 	
 	<div class="text_box" data-trigger>
  <span class="text"></span>
</div>	
 	</div>
 </div>
 
 <script>
 const content = "게시판에 오신 걸 환영합니다!";
 const text = document.querySelector(".text");
 let i = 0;

 function typing(){
     if (i < content.length) {
     let txt = content.charAt(i);
     text.innerHTML += txt;
     i++;
     }
 }
 setInterval(typing, 200)
 
 
 
 
 
    </script>
    
    <footer>
        <div class="footer_container">
            <div class="footA">
                xxx
            </div>
            <div class="footB">
                Copyright © xxx All Rights Reserved.
            </div>
        </div>
    </footer>
</body>
</html>