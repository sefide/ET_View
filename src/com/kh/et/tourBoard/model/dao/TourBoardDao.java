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

import com.kh.et.board.model.vo.Board;
import com.kh.et.company.model.vo.Company;
import com.kh.et.company.model.vo.Coupon;
import com.kh.et.tourBoard.model.vo.Attachment;
import com.kh.et.tourBoard.model.vo.TourBoard;

public class TourBoardDao {
	
private Properties prop = new Properties();
	
	public TourBoardDao() {
		String fileName= TourBoardDao.class.getResource("/sql/tourBoard/tourBoard-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertTourBoard(Connection con, TourBoard tb, Company loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertTourBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getC_no());
			pstmt.setInt(2, tb.getTctno());
			pstmt.setString(3, tb.gettTitle());
			pstmt.setString(4, tb.gettConcept());
			pstmt.setString(5, tb.gettInfo());
			pstmt.setInt(6, tb.gettPrice());
			pstmt.setString(7, tb.gettLink());
			pstmt.setString(8, tb.gettGrade());
			
			
			
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
				
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(0).getOriginName());
				pstmt.setString(2, fileList.get(0).getChangeName());
				pstmt.setString(3, fileList.get(0).getFilePath());
				pstmt.setString(4, "투어");
				pstmt.setInt(5, fileList.get(0).getAtno());
				/*pstmt.setInt(1, fileList.get(i).getBid());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());*/
				
				result = pstmt.executeUpdate();

				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		return result;
	}


	public ArrayList<HashMap<String, Object>> selectList(Connection con, int currentPage, int limit, Company loginUser) {
		PreparedStatement pstmt = null;
		/*Statement stmt = null;*/
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1) * limit +1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, loginUser.getC_no());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();  //멤버 객체대신 hash맵사용
				
				hmap.put("tno", rset.getInt("t_no"));  //DB 대소문자 상관없음. 단, 값은 구분함
				hmap.put("tcno", rset.getInt("t_c_no"));
				hmap.put("title", rset.getString("t_Title"));
				hmap.put("concept", rset.getString("t_concept"));
				hmap.put("price", rset.getInt("t_price"));
				hmap.put("info", rset.getString("t_info"));
				hmap.put("link", rset.getString("t_link"));
				hmap.put("grade", rset.getString("t_grade"));
				hmap.put("tdate", rset.getDate("t_date"));
				hmap.put("ano", rset.getInt("a_no"));
				hmap.put("originName", rset.getString("a_origin_name"));
				hmap.put("changeName", rset.getString("a_change_name"));
				hmap.put("filePath", rset.getString("a_file_path"));
				hmap.put("uploadDate", rset.getDate("a_upload_date"));
				
				list.add(hmap);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCount(Connection con, Company loginUser) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getC_no());
			
			rset = pstmt.executeQuery();	
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return listCount;
	}


	public ArrayList<HashMap<String, Object>> selectList2(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		/*Statement stmt = null;*/
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList2");
		
		try {
		pstmt = con.prepareStatement(query);
		int startRow = (currentPage -1) * limit +1;
		int endRow = startRow + limit - 1;
		
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		
		rset = pstmt.executeQuery();
		list = new ArrayList<HashMap<String, Object>>();

		while(rset.next()) {
			hmap = new HashMap<String,Object>();  //멤버 객체대신 hash맵사용
			
			hmap.put("tno", rset.getInt("t_no"));  //DB 대소문자 상관없음. 단, 값은 구분함
			hmap.put("tcno", rset.getInt("t_c_no"));
			hmap.put("title", rset.getString("t_Title"));
			hmap.put("concept", rset.getString("t_concept"));
			hmap.put("price", rset.getInt("t_price"));
			hmap.put("info", rset.getString("t_info"));
			hmap.put("link", rset.getString("t_link"));
			hmap.put("grade", rset.getString("t_grade"));
			hmap.put("tdate", rset.getDate("t_date"));
			hmap.put("ano", rset.getInt("a_no"));
			hmap.put("originName", rset.getString("a_origin_name"));
			hmap.put("changeName", rset.getString("a_change_name"));
			hmap.put("filePath", rset.getString("a_file_path"));
			hmap.put("uploadDate", rset.getDate("a_upload_date"));
			
			list.add(hmap);
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
		close(rset);
	}

	return list;
	}
	
	public int getListCount2(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount2");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}
	
	
	// premium 투어 3개 select 
	public ArrayList<HashMap<String, Object>> selectTopTour(Connection con) {
		// ArrayList의 인덱스는 최신순 번호 (3개만) 
		// 값은 HashMap 
		// HashMap에는 투어글 한개와 해당 투어글의 attachment가 들어간다. 따라서 한 투어글에 2개의 값  
		// 총 3개의 HashMap이 list에 들어간다. 
		ArrayList<HashMap<String, Object>> tourList = null;
		HashMap<String, Object> tourMap = null;
		ResultSet rset = null;
		Statement stmt = null;
		
		String query = prop.getProperty("selectTopTour");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			tourList = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				tourMap = new HashMap<String, Object>();
				TourBoard t = new TourBoard();
				
				t.setTno(rset.getInt("T_NO"));
				t.settTitle(rset.getString("T_TITLE"));
				t.setTctno(rset.getInt("T_CT_NO"));
				t.settConcept(rset.getString("T_CONCEPT"));
				t.settPrice(rset.getInt("T_PRICE"));
				t.settInfo(rset.getString("T_INFO"));
				t.settDate(rset.getDate("T_DATE"));
				t.settEndDate(rset.getDate("T_END_DATE"));
				t.setTctName(rset.getString("CT_NAME"));
				
				Attachment a = new Attachment();
				
				a.setAno(rset.getInt("A_NO"));
				a.setOriginName(rset.getString("A_ORIGIN_NAME"));
				a.setChangeName(rset.getString("A_CHANGE_NAME"));
				a.setFilePath(rset.getString("A_FILE_PATH"));
				a.setUploadDate(rset.getDate("A_UPLOAD_DATE"));
				
				tourMap.put("t", t);
				tourMap.put("a",a);
				
				tourList.add(tourMap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return tourList;
	}

	// 도시별 관련 투어 select 
	public ArrayList<HashMap<String, Object>> selectCityTourList(Connection con, int cityNum) {
		ArrayList<HashMap<String, Object>> tourList = null;
		HashMap<String, Object> tourMap = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectCityTourList");
		System.out.println("헹dao 실행  " +cityNum );
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cityNum);
			
			rset = pstmt.executeQuery();
					
			tourList = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				System.out.println("rset	 진입 " );
				tourMap = new HashMap<String, Object>();
				TourBoard t = new TourBoard();
				
				t.setTno(rset.getInt("T_NO"));
				t.settTitle(rset.getString("T_TITLE"));
				t.setTctno(rset.getInt("T_CT_NO"));
				t.settConcept(rset.getString("T_CONCEPT"));
				t.settPrice(rset.getInt("T_PRICE"));
				t.setTctName(rset.getString("CT_NAME"));
				t.settLink(rset.getString("T_LINK"));
				
				Attachment a = new Attachment();
				
				a.setAno(rset.getInt("A_NO"));
				a.setOriginName(rset.getString("A_ORIGIN_NAME"));
				a.setChangeName(rset.getString("A_CHANGE_NAME"));
				a.setFilePath(rset.getString("A_FILE_PATH"));
				a.setUploadDate(rset.getDate("A_UPLOAD_DATE"));
				
				tourMap.put("t", t);
				tourMap.put("a",a);
				
				tourList.add(tourMap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return tourList;
	}

	public ArrayList<HashMap<String, Object>> editOne(Connection con, String num, String grade) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		TourBoard tb=null;
		ArrayList<HashMap<String,Object>> list=null;
		HashMap<String, Object> hmap=null;
		
		String query=prop.getProperty("editOne");
		list=new ArrayList<HashMap<String,Object>>();
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rset=pstmt.executeQuery();
			hmap=new HashMap<String,Object>();
			
			if(rset.next()) {
				System.out.println("rset");
				tb=new TourBoard();
				tb.setTcno(rset.getInt("T_C_NO"));
				tb.setTno(rset.getInt("T_NO"));
				tb.settTitle(rset.getString("T_TITLE"));
				tb.settConcept(rset.getString("T_CONCEPT"));
				tb.settInfo(rset.getString("T_INFO"));
				tb.settPrice(rset.getInt("T_PRICE"));
				tb.settGrade(rset.getString("T_GRADE"));
				tb.settLink(rset.getString("T_LINK"));
				
				
				Attachment a =new Attachment();
				a.setOriginName(rset.getString("A_ORIGIN_NAME"));
				
				hmap.put("tb",tb);
				hmap.put("a",a);
				
				list.add(hmap);
				System.out.println(list);
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public int updatetTourBoard(Connection con, TourBoard tb, Company loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateTourBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
		
			pstmt.setString(1, tb.gettTitle());
			pstmt.setString(2, tb.gettConcept());
			pstmt.setString(3, tb.gettInfo());
			pstmt.setInt(4, tb.gettPrice());
			pstmt.setString(5, tb.gettLink());
			pstmt.setString(6, tb.gettGrade());
			pstmt.setInt(7, tb.getTctno());
			pstmt.setInt(8, tb.getTno());
			
			//System.out.println("tno: "+ tb.getTno());
			//System.out.println("tcno" +tb.getTcno());
			//System.out.println("tctno"+tb.getTctno());
			
			//System.out.println("dao 갖고오나"+result);

			
			result = pstmt.executeUpdate();
			//System.out.println("query result"+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateAttachment(Connection con, ArrayList<Attachment> fileList) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttachment");
		
		try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(0).getOriginName());
				pstmt.setString(2, fileList.get(0).getChangeName());
				pstmt.setString(3, fileList.get(0).getFilePath());
				pstmt.setString(4, "투어");
				pstmt.setInt(5, fileList.get(0).getAtno());
				/*pstmt.setInt(1, fileList.get(i).getBid());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());*/
				
				result = pstmt.executeUpdate();

				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		return result;
	}

	public int insertUsedCoupon(Connection con, Coupon cp, Company loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertUsedCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getC_no());
			pstmt.setString(2, cp.getCpType());
			pstmt.setString(3, "사용");
			pstmt.setInt(4, cp.getCptno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMemberCouponUsedPremium(Connection con, Company loginUser, Coupon cp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMemberCouponUsedPremium");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getC_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateMemberCouponUsedStandard(Connection con, Company loginUser, Coupon cp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMemberCouponUsedStandard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getC_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int getPreCouponCount(Connection con, Company loginUser) {
		PreparedStatement pstmt = null;
		int CouponCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getPreCouponCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,loginUser.getC_no());
			rset =pstmt.executeQuery();
			
			if(rset.next()) {
				CouponCount = rset.getInt(1);
				System.out.println("쿠폰카운트"+CouponCount);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return CouponCount;
	}

	public int getStdCouponCount(Connection con, Company loginUser) {
		PreparedStatement pstmt = null;
		int CouponCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getStdCouponCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,loginUser.getC_no());
			rset =pstmt.executeQuery();
			
			if(rset.next()) {
				CouponCount = rset.getInt(1);
				System.out.println("쿠폰카운트"+CouponCount);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return CouponCount;
	}


	public ArrayList<HashMap<String, Object>> seeTourList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		/*Statement stmt = null;*/
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("AllSeeTourList");
		
		try {
		pstmt = con.prepareStatement(query);
		int startRow = (currentPage -1) * limit +1;
		int endRow = startRow + limit - 1;
		
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		
		rset = pstmt.executeQuery();
		list = new ArrayList<HashMap<String, Object>>();

		while(rset.next()) {
			hmap = new HashMap<String,Object>();  //멤버 객체대신 hash맵사용
			
			hmap.put("tno", rset.getInt("t_no"));  //DB 대소문자 상관없음. 단, 값은 구분함
			hmap.put("tcno", rset.getInt("t_c_no"));
			hmap.put("title", rset.getString("t_Title"));
			hmap.put("concept", rset.getString("t_concept"));
			hmap.put("price", rset.getInt("t_price"));
			hmap.put("info", rset.getString("t_info"));
			hmap.put("link", rset.getString("t_link"));
			hmap.put("grade", rset.getString("t_grade"));
			hmap.put("tdate", rset.getDate("t_date"));
			hmap.put("ano", rset.getInt("a_no"));
			hmap.put("originName", rset.getString("a_origin_name"));
			hmap.put("changeName", rset.getString("a_change_name"));
			hmap.put("filePath", rset.getString("a_file_path"));
			hmap.put("uploadDate", rset.getDate("a_upload_date"));
			
			list.add(hmap);
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
		close(rset);
	}

	return list;
	}

	public int SeeTourgetListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount2");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> seeTourDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		/*Statement stmt = null;*/
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("DetailSeeTour");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String, Object>>();
			if(rset.next()) {
				hmap = new HashMap<String,Object>();  //멤버 객체대신 hash맵사용
				
				hmap.put("tno", rset.getInt("t_no"));  //DB 대소문자 상관없음. 단, 값은 구분함
				hmap.put("tcno", rset.getInt("t_c_no"));
				hmap.put("title", rset.getString("t_Title"));
				hmap.put("concept", rset.getString("t_concept"));
				hmap.put("price", rset.getInt("t_price"));
				hmap.put("info", rset.getString("t_info"));
				hmap.put("link", rset.getString("t_link"));
				hmap.put("grade", rset.getString("t_grade"));
				hmap.put("tdate", rset.getDate("t_date"));
				hmap.put("tEndDate", rset.getDate("t_end_date"));
				hmap.put("ano", rset.getInt("a_no"));
				hmap.put("originName", rset.getString("a_origin_name"));
				hmap.put("changeName", rset.getString("a_change_name"));
				hmap.put("filePath", rset.getString("a_file_path"));
				hmap.put("uploadDate", rset.getDate("a_upload_date"));
				
				list.add(hmap);
			}
    }catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
		}

	public int deleteTourBoard(Connection con, TourBoard reqTour) {
		PreparedStatement pstmt=null;
		int result=0;
		System.out.println(reqTour.getTno());
		String query=prop.getProperty("deleteCompanyTourBoard");
		System.out.println("다오까지 오나");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqTour.getTno());
			
			result=pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);

		}
		

		return result;

	}
	
}
