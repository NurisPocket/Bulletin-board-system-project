package com.jdh.dao;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import com.jdh.dto.MemberDTO;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	final String JDBC_DRIVER = "org.h2.Driver";  //org.h2.Driver
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
	
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"jwbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static MemberDAO instance = null;

 



	private MemberDAO() {

	}

 


	public static MemberDAO getInstance() {

		if(instance == null) {

			instance = new MemberDAO();

		}


		return instance;

	}

 

	// 로그인 메소드

	public int userCheck(String userid, String pwd) {

		// (-1 = 아이디 오류, 0 = 비밀번호 오류, 1 = 로그인 성공)

		int result=-1;

 

		String query="SELECT pwd FROM member_tbl WHERE userid=?";


		try {

			Connection conn = open();

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();

 

			if(rs.next()) {

				if(rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {

					//로그인성공

					result=1;

				} else {

					//비밀번호 틀림

					result=0;

				}

			} else {

				//아이디 틀림

				result=-1;

			}

 

		} catch(SQLException e) {

			System.err.println("아이디 조회 실패 "+e.getMessage());

		} finally {

			try {

				if(rs != null) {rs.close();}

				if(pstmt != null) {pstmt.close();}

				if(conn != null) {conn.close();}

			} catch(SQLException e) {

				System.err.println("아이디 조회 자원해제 실패 "+e.getMessage());

			}

		}

 

		return result;

	}//userCheck(String userid, String pwd) END

 

 

	// 아이디로 회원 정보 가져오는 메소드

	public MemberDTO getMember(String userid) {

		MemberDTO dto=null;

		String query="SELECT * FROM member_tbl WHERE userid=?";


		try {

			Connection conn = open();

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();

 

			if(rs.next()) {

				dto = new MemberDTO();

				dto.setName(rs.getString("name"));

				dto.setUserid(rs.getString("userid"));

				dto.setPwd(rs.getString("pwd"));

				dto.setEmail(rs.getString("email"));

				dto.setPhone(rs.getString("phone"));

				dto.setGender(rs.getInt("gender"));

 

			}

 

		} catch(SQLException e) {

			System.err.println("회원정보 가져오기 실패 "+e.getMessage());

		} finally {

			try {

				if(rs!=null) {rs.close();}

				if(pstmt!=null) {pstmt.close();}

				if(conn!=null) {conn.close();}

			} catch(SQLException e){

				System.err.println("정보가져오기 자원해제 실패"+e.getMessage());

			}

		}

		return dto;

	}//getMember(String userid) END

 

 

 

	// 아이디 중복 확인 메서드

	public int confirmID(String userid) {

		//아이디 검색 결과 (아이디 존재 : 1/존재하지않으면 -1)

		int result=-1;

 

		String query="SELECT userid FROM member_tbl WHERE userid=?";

		try {

			Connection conn = open();

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();

 

			if(rs.next()) {

				result = 1;

			} else {

				result = -1;

			}

 

		} catch(SQLException e) {

			System.err.println("중복 확인 실패 "+e.getMessage());

		} finally {

			try {

				if(rs!=null) {rs.close();}

				if(pstmt!=null) {pstmt.close();}

				if(conn!=null) {conn.close();}

			} catch(SQLException e) {

				System.err.println("중복확인 자원 해제 실패"+e.getMessage());

			}

		}

 

		return result;

	}

 

 

 

 

 

	// 회원 가입 메서드

	public int insertMember(MemberDTO dto) {

		int result=-1;

 

		String query="INSERT INTO member_tbl values (member_seq.nextval,?,?,?,?,?,?)";


		try {

			Connection conn = open();

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, dto.getName());

			pstmt.setString(2, dto.getUserid());

			pstmt.setString(3, dto.getPwd());

			pstmt.setString(4, dto.getEmail());

			pstmt.setString(5, dto.getPhone());

			pstmt.setInt(6, dto.getGender());

 

			result = pstmt.executeUpdate();

 

 

		}catch(SQLException e) {

			System.err.println("회원 가입 실패 "+e.getMessage());

		} finally {

			try {

				if(pstmt!=null) {pstmt.close();}

				if(conn!=null) {conn.close();}

			}catch(SQLException e) {

				System.err.println("회원가입 자원해제 실패"+e.getMessage());

			}
			
		}

		return result;

	}//insertMember(MemberDTO dto) END

 

// 회원 정보 수정 메서드

	public int updateMember(MemberDTO dto) {

		int result=-1;

 

		String query="UPDATE member_tbl SET pwd=?,email=?,phone=?,gender=? WHERE userid=?";


		try {

			Connection conn = open();

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1,dto.getPwd());

			pstmt.setString(2,dto.getEmail());

			pstmt.setString(3,dto.getPhone());

			pstmt.setInt(4,dto.getGender());

			pstmt.setString(5,dto.getUserid());

 

			result = pstmt.executeUpdate();

 

		}catch(SQLException e) {

			System.err.println("정보수정 실패"+e.getMessage());

		} finally {

			try {

				if(pstmt!=null) {pstmt.close();}

				if(conn!=null) {conn.close();}

			}catch(SQLException e) {

				System.err.println("정보 수정 자원해제 실패"+e.getMessage());

			}

		}

		return result;

	}//updateMember(MemberDTO dto) END

	}//MemberDAO END