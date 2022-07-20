<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
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
	<%
	int pagenumber =1;
	if(request.getParameter("pagenumber") != null){
		pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
	}
	%>
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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align: center;">번호</th>
						<th style="background-color:#eeeeee; text-align: center;">제목</th>
						<th style="background-color:#eeeeee; text-align: center;">작성자</th>
						<th style="background-color:#eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> list = boardDAO.getList(pagenumber);
						for(int i=0; i<list.size();i++){
							%>	
					<tr>
						<td><%= list.get(i).getBoardID() %></td>
						<td><a href="view.jsp?boardID=<%= list.get(i).getBoardID()%>"><%= list.get(i).getBoardTITLE() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBoardDATE().substring(11,13)+ list.get(i).getBoardDATE().substring(14,16) + "분"%></td>
					</tr>
							<%
						}
							%>	
				</tbody>
				</table>
				<%
					if(pagenumber != 1){
				%>
					<a href="board.jsp?pagenumber=<%=pagenumber - 1%>" class="btn btn-success btn-arraw-lfet">이전</a>
				<%
					} if(boardDAO.nextPage(pagenumber +1)) {
				%>
					<a href="board.jsp?pagenumber=<%=pagenumber + 1%>" class="btn btn-success btn-arraw-lfet">다음</a>
			<%
					}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>	
    </div>
 
 	<script src="https;//code.jquery.com/jquery-3.1.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>