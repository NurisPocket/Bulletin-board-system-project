<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입화면</title>
<script type="text/javascript" src="script/member.js" ></script>

<style>

<style>
	@charset "utf-8";

/* base - 브라우저 별로 다를 수도 있는 것을 초기화 */
*{ padding: 0; margin: 0; } /* 태그 여백 없앰 */
li{ list-style: none; } /* 기호나 번호를 제거 */
a{ text-decoration: none; } /* 링크텍스트에 밑줄없앰 */
button{ cursor: pointer; } /* 모든 버튼에 마우스손모양 처리 */

/* body설정 */
body{ background-color: #ededed; }

.loginbox{
    width: 780px; height: 650px;
    margin: 0 auto; /* 블록요소를 부모영역에서 가운데 처리 */
}
.loginbox h2{
    width: 100%; /* 부모영역을 상속 */

    /* 한줄텍스트인 경우만 height와 line-height가 같으면 세로 가운데 처리 */
    height: 100px; line-height: 100px;
    text-align: center; font-size: 20px;
    font-weight: normal;
}
.loginbox form{
    width: 100%; height: 1200px;
    background-color: #fff;
    /* 패딩수치를 인사이드 처리 */
    padding: 60px; box-sizing: border-box;
}
.loginbox fieldset{
    border: none; /* 테두리 제거 */ 
}
.loginbox legend{
    /* 요소를 화면 밖으로 처리 */
    position: absolute; left: -999em;

    /* 웹접근성으로 스크린리더기가 읽어줘야 하므로 display: none;을 사용하지 말것 */
}
.loginbox label{
    display: block;
    font-size: 12px; color: #333;
    margin-bottom: 10px; /* 동위선택자와의 간격 조정 */
}
.loginbox input{
    display: block;
    width: 100%; height: 50px;
    margin-bottom: 25px; /* 동위선택자와의 간격 조정 */
    border: none; background-color: #ededed;
    padding: 0 20px; /* 앞상하 뒷좌우 */
    box-sizing: border-box; /* 패딩수치를 인사이드 처리 */
}

.loginbox ul{
    width: 100%;
    text-align: right; /* 글자를 오른쪽으로 처리 */
    margin-bottom: 60px;
}
.loginbox li{
    display: inline-block;
    height: 12px; line-height: 12px;
}
.loginbox li:last-child{
    border-left: 1px solid #333;
    padding-left: 10px; /* 테두리 안쪽 여백 */
    margin-left: 4px; /* 테두리 바깥쪽 여백 */
}
.loginbox a{
    /* 글자관련은 보통 최종태그에 줘야 적용 */
    color: #333; font-size: 12px;

    /* 현재 위치에서 상대적 이동 */
    position: relative; top: -2px;
}
.loginbox button{
    display: block;
    width: 220px; height: 50px;
    margin: 0 auto; /* 블록요소가 부모 영역에서 가운데 오기 */
    border: none;
    background-color: #1673ea;
    color: #fff; font-size: 14px; font-weight: bold;
}

#ch{
    width: 40%; height: 50px;
    margin: 0 auto;
    background-color:lightgray;
    border: none;
     font-size: 14px; font-weight: bold;
}
#bob1{
   width: 40%; height: 50px;
    margin: 0 auto;
    background-color:lightgray;
    border: none;
     font-size: 14px; font-weight: bold;
}	
#bob2{
   width: 40%; height: 50px;
    margin: 0 auto;
    background-color:lightgray;
    border: none;
     font-size: 14px; font-weight: bold;
}	
#bob3{
   width: 40%; height: 50px;
    margin: 0 auto;
   background-color:lightgray;
    border: none;
     font-size: 14px; font-weight: bold;
}	


#ch:hover{
 background-color: #1673ea;
}

#bob1:hover{
 background-color: #1673ea;
}

#bob2:hover{
 background-color: #1673ea;
}

#bob3:hover{
 background-color: #1673ea;
}



</style>


</head>

<body>

    <div class="loginbox">
  <h2>게시판 회원가입</h2>
  <form action="join.do" method="post" name="frm">
    <!--작성하지 않아도 문제는 없음-->
    <fieldset>
      <legend>회원가입 구역</legend>
       <label for="loginname">이름</label>
       <input type="text" name="name" size="20" required="required" />
      <label for="loginid">아이디</label>
      <input type="text" name="userid" required="required" >
	 <input type="hidden" name="reid" size="20" />
	
	<input id="ch" type="button" value="아이디 중복확인" onclick="idCheck()" />
	
	
	
    <label for="loginpw">비밀번호</label>
	<input type="password" name="pwd" size="20" required="required" />
  	<label for="loginpwch">비밀번호 확인</label>
	<input type="password" name="pwd_check" size="20" required="required" />
 	<label for="loginemail">이메일</label>
	<input type="email" name="email" size="20" />
	<label for="logintel">전화번호</label>
	<input type="tel" name="phone" size="20" />
	<label for="logingrade">성별

	</label> <hr>
		<table>
		<tr>
		<td>남자<input id="radio1" type="radio" name="gender" value="0" checked="checked" /></td> 
		<td> &nbsp; &nbsp; &nbsp;</td>
		<td>여자<input id="radio2" type="radio" name="gender" value="1" /></td>
	    </tr>
	    
	    </table> 
	<hr>
 		<br>
   	<input id="bob1" type="submit" value="가입하기" onclick="return joinCheck()" /><br>
 	 <input id="bob2" type="reset" value="취소"  /><br>
	<input id="bob3" type="button" value="돌아가기" onclick="location.href='./index.jsp'">

</fieldset>
</form>
	
	
</body>
</html>