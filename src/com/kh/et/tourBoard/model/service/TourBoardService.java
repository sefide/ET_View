package com.kh.et.tourBoard.model.service;

import java.sql.Connection;
import static com.kh.et.common.JDBCTemplate.*;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.et.tourBoard.model.dao.TourBoardDao;
import com.kh.et.tourBoard.model.vo.Attachment;
import com.kh.et.tourBoard.model.vo.TourBoard;

public class TourBoardService {

	public int insertTourBoard(TourBoard tb, ArrayList<Attachment> fileList) {
		
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new TourBoardDao().insertTourBoard(con, tb);
		
		if(result1 > 0) {
			int tno  = new TourBoardDao().selectCurrval(con);
			
			for(int i=0; i < fileList.size();i++) {
				fileList.get(i).setAtno(tno);;
			}
		}
		
		int result2 = new TourBoardDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectThumbnailList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new TourBoardDao().selectThumbnailList(con);
		
		close(con);
		
		
		
		return list;
	}

}
