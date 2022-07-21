<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
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
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int BoardID = 0;
	if ( request.getParameter("BoardID") != null){
		BoardID = Integer.parseInt(request.getParameter("boardID"));
	}
	if(BoardID==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alret('유효하지 않은 글입니다..')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}
	Board board = new BoardDAO().getBoard(BoardID);
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
						<th colspan="3" style="background-color:#eeeeee; text-align: center;">게시판 글 보기</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%;">글 제목</td>
						<td colspan="2"><%= board.getBoardTITLE() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= board.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= board.getBoardDATE().substring(0,11) + board.getBoardDATE().substring(11,13) + "시" + board.getBoardDATE().substring(14,16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<!--특스문자를 문자로 치환해줌 -->
						<td colspan="2" style="min-height:200px; text-align: left;"><%= board.getBoardCONTENT().replaceAll("", "&nbsp;").replaceAll("<", " &lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
						
					</tr>
				</tbody>
			</table>
			<a href="board.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(board.getUserID())){
			%>
				<a href="update.jsp?BoardID=<%= BoardID %>" class="btn btn-primary">수정</a>
			    <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?BoardID=<%= BoardID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>	
    </div>
 
 	<script src="https;//code.jquery.com/jquery-3.1.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>