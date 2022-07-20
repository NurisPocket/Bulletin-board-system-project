package board;

public class Board {
	
	private int boardID;
	private String boardTITLE;
	private String userID;
	private String boardDATE;
	private String boardCONTENT;
	private int boardAVAILABLE;
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getBoardTITLE() {
		return boardTITLE;
	}
	public void setBoardTITLE(String boradTITLE) {
		this.boardTITLE = boradTITLE;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBoardDATE() {
		return boardDATE;
	}
	public void setBoardDATE(String boardDATE) {
		this.boardDATE = boardDATE;
	}
	public String getBoardCONTENT() {
		return boardCONTENT;
	}
	public void setBoardCONTENT(String boardCONTENT) {
		this.boardCONTENT = boardCONTENT;
	}
	public int getBoardAVAILABLE() {
		return boardAVAILABLE;
	}
	public void setBoardAVAILABLE(int boardAVAILABLE) {
		this.boardAVAILABLE = boardAVAILABLE;
	}
	
	
}
