package com.kh.et.tourBoard.model.dao;

import static com.kh.et.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.et.tourBoard.model.vo.Attachment;
import com.kh.et.tourBoard.model.vo.TourBoard;

public class TourBoardDao {
	
private Properties prop = new Properties();
	
	public TourBoardDao() {
		String fileName= TourBoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertTourBoard(Connection con, TourBoard tb) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertThumb");
		
		try {
			pstmt = con.prepareStatement(query);
			/*pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, Integer.parseInt(b.getbWriter()));*/
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}



	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int tno = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				tno = rset.getInt("CURRVAL");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		
		return tno;
	}



	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i=0; i<fileList.size();i++) {
				
				pstmt = con.prepareStatement(query);
				/*pstmt.setInt(1, fileList.get(i).getBid());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());*/
				
				result += pstmt.executeUpdate();
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectThumbnailList(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectThumbnailMap");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();  //멤버 객체대신 hash맵사용
				
				/*hmap.put("bid", rset.getInt("bid"));  //DB 대소문자 상관없음. 단, 값은 구분함
				hmap.put("bno", rset.getInt("bno"));
				hmap.put("btitle", rset.getString("bTitle"));
				hmap.put("bcontent", rset.getString("bcontent"));
				hmap.put("bwriter", rset.getString("nick_name"));
				hmap.put("bcount", rset.getInt("bcount"));
				hmap.put("bdate", rset.getDate("bdate"));
				hmap.put("fid", rset.getInt("fid"));
				hmap.put("originName", rset.getString("origin_name"));
				hmap.put("changeName", rset.getString("change_name"));
				hmap.put("filePath", rset.getString("file_path"));
				hmap.put("uploadDate", rset.getDate("upload_date"));*/
				
				list.add(hmap);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return list;
	}

}
