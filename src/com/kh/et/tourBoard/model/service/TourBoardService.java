package com.kh.et.tourBoard.model.service;

import java.sql.Connection;
import static com.kh.et.common.JDBCTemplate.*;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.et.board.model.dao.BoardDao;
import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.company.model.vo.Company;
import com.kh.et.company.model.vo.Coupon;
import com.kh.et.tourBoard.model.dao.TourBoardDao;
import com.kh.et.tourBoard.model.vo.Attachment;
import com.kh.et.tourBoard.model.vo.TourBoard;

public class TourBoardService {

	public Company insertTourBoard(TourBoard tb, ArrayList<Attachment> fileList, Company loginUser, Coupon cp) {

		Connection con = getConnection();
		int result = 0;
		int result4 = 0;

		int result1 = new TourBoardDao().insertTourBoard(con, tb, loginUser);

		if (result1 > 0) {
			int tno = new TourBoardDao().selectCurrval(con);

			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setAtno(tno);
				;
				cp.setCptno(tno);
			}
		}
		int result2 = new TourBoardDao().insertAttachment(con, fileList);
		
		int result3 = new TourBoardDao().insertUsedCoupon(con,cp,loginUser);
		
		
		if(cp.getCpType().equals("premium")) {
			result4 = new TourBoardDao().updateMemberCouponUsedPremium(con,loginUser,cp);
		}else {
			result4 = new TourBoardDao().updateMemberCouponUsedStandard(con,loginUser,cp);
		}
		
		Company loginCompany = null;
		if (result1 > 0 && result2 > 0 && result3>0 && result4>0) {
			loginCompany =new CompanyDao().selectLoginCompany(con,loginUser);
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		close(con);
		return loginCompany;
	}

	public ArrayList<HashMap<String, Object>> selectList(int currentPage, int limit, Company loginUser) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> list = new TourBoardDao().selectList(con, currentPage, limit, loginUser);

		if (list != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return list;
	}

	public int getListCount(Company loginUser) {
		Connection con = getConnection();

		int listCount = new TourBoardDao().getListCount(con, loginUser);
		if (listCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectList2(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> list = new TourBoardDao().selectList2(con, currentPage, limit);

		close(con);

		return list;
	}

	public int getListCount2() {
		Connection con = getConnection();

		int listCount = new TourBoardDao().getListCount2(con);
		close(con);

		return listCount;
	}

	// 인기 투어 select (시작페이지)
	public ArrayList<HashMap<String, Object>> selectTopTour() {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> tourList = new TourBoardDao().selectTopTour(con);

		if (tourList != null) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return tourList;
	}

	// 도시별 관련 투어 select (플랜짜기)
	public ArrayList<HashMap<String, Object>> selectCityTourList(int cityNum) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> tourList = new TourBoardDao().selectCityTourList(con, cityNum);

		if (tourList != null) {
			commit(con);
			System.out.println("헹 service 성공 ");
		} else {
			rollback(con);
		}

		close(con);
		return tourList;
	}

	public ArrayList<HashMap<String, Object>> editOne(String num) {

		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new TourBoardDao().editOne(con, num);
		int result = 0;

		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);

		return list;

	}

	public int updateTourBoard(TourBoard tb, ArrayList<Attachment> fileList, Company loginUser, String status,
			String updatePhotoId) {
		Connection con = getConnection();
		int result = 0;

		int result1 = new TourBoardDao().updatetTourBoard(con, tb, loginUser);
		int result2 = 0;
		if (status.equalsIgnoreCase("Y")) {
			if (result1 > 0) {
			}

			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setAtno(Integer.parseInt(updatePhotoId));
			}

			result2 = new TourBoardDao().updateAttachment(con, fileList);
		} else {
			System.out.println("service Result2"+result2);
			result2 = 1;
		}

		if (result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int getPreCouponCount(Company loginUser) {
			Connection con = getConnection();
			
			int CouponCount = new TourBoardDao().getPreCouponCount(con,loginUser);
			close(con);
			
			return CouponCount;
	}

	public int getStdCouponCount(Company loginUser) {
		Connection con = getConnection();
		
		int CouponCount = new TourBoardDao().getStdCouponCount(con,loginUser);
		close(con);
		
		return CouponCount;
	}


	public ArrayList<HashMap<String, Object>> seeTourList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> list = new TourBoardDao().seeTourList(con, currentPage, limit);

		close(con);

		return list;
	}

	public int SeeTourgetListCount() {
		Connection con = getConnection();

		int listCount = new TourBoardDao().SeeTourgetListCount(con);
		close(con);

		return listCount;
	}

	public ArrayList<HashMap<String, Object>> seeTourDetail(int num) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> list = new TourBoardDao().seeTourDetail(con, num);

		close(con);

		return list;
  }
  
	public int deleteTourBoard(TourBoard reqTour) {
		Connection con=getConnection();
		
		int result=new TourBoardDao().deleteTourBoard(con,reqTour);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		System.out.println("service"+result);
		return result;
	}

}
