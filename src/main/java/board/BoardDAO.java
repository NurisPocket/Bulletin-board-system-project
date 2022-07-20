package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	Connection conn = null;
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return"";// 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT boardID FROM BOARD ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	
	public int write(String boardTITLE, String userID, String boardCONTENT) {
		String SQL = "INSERT INTO BOARD VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTITLE);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardCONTENT);
			pstmt.setInt(6, 1);
				return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	public ArrayList<Board> getList(int pagenumber){
		String SQL = "SELECT * FROM Board WHERE boardID < ? AND boardAVILABLE = 1 ORDER BY boardID DESC LIMIT 10";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pagenumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTITLE(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDATE(rs.getString(4));
				board.setBoardCONTENT(rs.getString(5));
				board.setBoardAVAILABLE(rs.getInt(6));
				list.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;// 
	}
	
	public boolean nextPage(int pagenumber) {
		String SQL = "SELECT * FROM Board WHERE boardID < ? AND boardAVILABLE = 1 ORDER BY boardID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pagenumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public Board getBoard(int BoardID) {
		String SQL = "SELECT * FROM Board WHERE BoardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, BoardID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTITLE(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDATE(rs.getString(4));
				board.setBoardCONTENT(rs.getString(5));
				board.setBoardAVAILABLE(rs.getInt(6));
				return board;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int BoardID, String BoardTITLE, String BoardCONTENT) {
		String SQL = "UPDATE BOARD SET BoardTITLE = ?, BoardCONTENT = ? WHERE BoardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, BoardTITLE);
			pstmt.setString(2, BoardCONTENT);
			pstmt.setInt(3, BoardID);
				return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
		public int delete(int BoardID) {
			String SQL = "UPDATE BOARD SET BoardTITLE = ?, BoardCONTENT = ? WHERE BoardID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, BoardID);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1;// 데이터베이스 오류
		}
	}

