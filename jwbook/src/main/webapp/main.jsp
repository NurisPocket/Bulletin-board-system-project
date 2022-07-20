<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty loginUser }">
	<jsp:forward page="login.do"></jsp:forward>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>

<body>
  <h3>여기는 로그인 후 화면</h3>
  <h4>회원 전용 페이지</h4>
    <form action="logout.do">
       <table>
          <tr>
            <td>안녕하세요${loginUser.name } (${loginUser.userid }) 님</td>
          </tr>
          <tr>
              <td>
                <input type="submit" value="로그아웃" /> 
                <input type="button" value="개인정보수정" onclick="location.href='memberUpdate.do?userid=${loginUser.userid}'" />
              </td>
          </tr>
       </table>
     </form>
</body>
</html>