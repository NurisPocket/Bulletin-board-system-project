<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="board" class="board.Board" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alret('로그인을 하세요.')");
			script.println("location.href = 'login.jsp");
			script.println("</script>");
		}
		int BoardID = 0;
		if ( request.getParameter("BoardID") != null){
			BoardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if(BoardID==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alret('유효하지 않은 글입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		Board board1 = new BoardDAO().getBoard(BoardID);
		if(!userID.equals(board1.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alret('권한이 없습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}	else {
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.delete(BoardID);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alret('글 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'board.jsp')");
					script.println("</script>");
				}
		}
	%>
</body>
</html>