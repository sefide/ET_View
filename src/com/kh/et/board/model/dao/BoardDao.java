package com.kh.et.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.et.board.model.vo.Board;
import static com.kh.et.common.JDBCTemplate.*;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao(){
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//글 작성
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		//insertBoard=INSERT INTO Board(SEQ_b_no.NEXTVAL, ?, ?, ?, SYSDATE, ‘Y’, ‘N’, 0 ,-1)
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getbWriter());
			pstmt.setString(2, b.getBtitle());
			pstmt.setString(3, b.getbContent());
					
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
