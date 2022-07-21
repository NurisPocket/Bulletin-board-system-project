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
    <link rel="stylesheet" href="css/bootstrap.css">

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
    <div class="container">
		<div class="row">
		<form method="post" action="writeAction.jsp">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align: center;">게시판 글쓰기 양식</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="boardTITLE" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea  class="form-control" placeholder="글 내용" name="boardCONTENT" maxlength="2048" style="height:350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
		</div>	
    </div>
 
 	<script src="https;//code.jquery.com/jquery-3.1.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>