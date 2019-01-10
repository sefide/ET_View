package com.kh.et.company.model.dao;

import static com.kh.et.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.et.company.model.vo.Company;
import com.kh.et.member.model.vo.Member;
import com.kh.et.tourBoard.model.vo.TourBoard;


public class CompanyDao {
	private Properties prop = new Properties();

	public CompanyDao() {
		String fileName = CompanyDao.class.getResource("/sql/company/company-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 제휴사 로그인 메소드
	public Company companyLogin(Connection con, Company reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Company loginCompany = null;

		String query = prop.getProperty("companyLogin");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getC_id());
			pstmt.setString(2, reqMember.getC_pwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginCompany = new Company();

				loginCompany.setC_no(rset.getInt("C_NO"));
				loginCompany.setC_name(rset.getString("C_NAME"));
				loginCompany.setC_biss_num(rset.getString("C_BISS_NUM"));
				loginCompany.setC_id(rset.getString("C_ID"));
				loginCompany.setC_pwd(rset.getString("C_PWD"));
				loginCompany.setC_phone(rset.getString("C_PHONE"));
				loginCompany.setC_email(rset.getString("C_EMAIL"));
				loginCompany.setC_category(rset.getString("C_CATEGORY"));
				loginCompany.setC_biss_address(rset.getString("C_BISS_ADDRESS"));
				loginCompany.setC_date(rset.getDate("C_DATE"));
				loginCompany.setC_end_date(rset.getDate("C_END_DATE"));
				loginCompany.setC_status(rset.getString("C_STATUS"));
				loginCompany.setcPremium(rset.getInt("C_PREMIUM"));
				loginCompany.setcStandard(rset.getInt("C_STANDARD"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
			close(rset);
		}

		return loginCompany;
	}

	// 관리자가 제휴사 추가하는 메소드
	public int insertCompany(Connection con, Company reqCompany) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertCompany");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqCompany.getC_name());
			pstmt.setString(2, reqCompany.getC_biss_num());
			pstmt.setString(3, reqCompany.getC_id());
			pstmt.setString(4, reqCompany.getC_pwd());
			pstmt.setString(5, reqCompany.getC_phone());
			pstmt.setString(6, reqCompany.getC_email());
			pstmt.setString(7,reqCompany.getC_category());
			pstmt.setString(8, reqCompany.getC_biss_address());
			pstmt.setDate(9, reqCompany.getC_date());
			pstmt.setDate(10, reqCompany.getC_end_date());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public ArrayList<Company> selectList(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Company> list = null;
		
		String query = prop.getProperty("selectList");
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;	//한 페이지에서의 글 목록 시작 번호
			int endRow = startRow + limit - 1;	//한 페이지에서의 글 목록 끝 번호
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
	
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Company>();
			
			while(rset.next()) {
				Company c = new Company();
				c.setC_no(rset.getInt("c_no"));
				c.setC_name(rset.getString("c_name"));
				c.setC_biss_num(rset.getString("c_biss_num"));
				c.setC_phone(rset.getString("c_phone"));
				c.setC_date(rset.getDate("c_date"));
				c.setC_end_date(rset.getDate("c_end_date"));
				
				
				/*n.setStatus(rset.getString("STATUS"));*/
				
				list.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		System.out.println("DAO 얍");
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		
		return listCount;
	}

	public int updateCompany(Connection con, Company reqCompany) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCompany");
		System.out.println("dao");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqCompany.getC_name());
			pstmt.setString(2, reqCompany.getC_biss_num());
			pstmt.setString(3, reqCompany.getC_phone());
			pstmt.setString(4, reqCompany.getC_email());
			pstmt.setString(5,reqCompany.getC_category());
			pstmt.setString(6, reqCompany.getC_biss_address());
			pstmt.setDate(7, reqCompany.getC_date());
			pstmt.setDate(8, reqCompany.getC_end_date());
			pstmt.setInt(9, reqCompany.getC_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Company selectOne(Connection con, String item) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Company c=null;
		
		String query=prop.getProperty("selectOne");
		System.out.println("selectOne dao");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1,Integer.parseInt(item));
			rset=pstmt.executeQuery();
			if(rset.next()) {
				c=new Company();
				c.setC_no(rset.getInt("C_NO"));
				c.setC_name(rset.getString("C_NAME"));
				c.setC_biss_num(rset.getString("C_BISS_NUM"));
				c.setC_biss_address(rset.getString("C_BISS_ADDRESS"));
				c.setC_phone(rset.getString("C_PHONE"));
				c.setC_category(rset.getString("C_CATEGORY"));
				c.setC_email(rset.getString("C_EMAIL"));
				c.setC_date(rset.getDate("C_DATE"));
				c.setC_end_date(rset.getDate("C_END_DATE"));
				
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return c;
	}


	

	//임시비밀번호 발급 후 DB에서 바꿔주기
	public int newpass(Connection con, String randomCode, String companyId, String companyEmailPass) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("newPass");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, randomCode);
			pstmt.setString(2, companyId);
			pstmt.setString(3, companyEmailPass);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteCompany(Connection con, int arr2) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("deleteCompany");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, arr2);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int nameCheck(Connection con, String companyName) {
			
			int result=0;
			PreparedStatement pstmt=null;
			ResultSet rset=null;
			
			String query=prop.getProperty("nameCheck");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, companyName);
				
				rset=pstmt.executeQuery();
				if(rset.next()) {
					result=rset.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
			return result;
		
		}


	public ArrayList<TourBoard> selectCouponList(Connection con, int currentPage, int limit, Company loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<TourBoard> list = null;
		
		String query = prop.getProperty("selectCouponList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) * limit +1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, loginUser.getC_no());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<TourBoard>();
			
			while(rset.next()) {
				TourBoard tb = new TourBoard();
				
				tb.setTno(rset.getInt("RNUM"));
				tb.settGrade(rset.getString("T_GRADE"));
				tb.settTitle(rset.getString("T_TITLE"));
				tb.settDate(rset.getDate("T_DATE"));
				
				list.add(tb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCountCoupon(Connection con, Company loginUser) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getListCountCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,loginUser.getC_no());
			rset =pstmt.executeQuery();
			
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


	public Company selectLoginCompany(Connection con, Company loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Company resultM = null;
		
		String query = prop.getProperty("selectCompanyLoginUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getC_no());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				resultM = new Company();
				
				resultM.setC_no(rset.getInt("C_NO"));
				resultM.setC_name(rset.getString("C_NAME"));
				resultM.setC_biss_num(rset.getString("C_BISS_NUM"));
				resultM.setC_id(rset.getString("C_ID"));
				resultM.setC_pwd(rset.getString("C_PWD"));
				resultM.setC_phone(rset.getString("C_PHONE"));
				resultM.setC_email(rset.getString("C_EMAIL"));
				resultM.setC_category(rset.getString("C_CATEGORY"));
				resultM.setC_biss_address(rset.getString("C_BISS_ADDRESS"));
				resultM.setC_date(rset.getDate("C_DATE"));
				resultM.setC_end_date(rset.getDate("C_END_DATE"));
				resultM.setC_status(rset.getString("C_STATUS"));
				resultM.setcPremium(rset.getInt("C_PREMIUM"));
				resultM.setcStandard(rset.getInt("C_STANDARD"));
		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		

		return resultM;

	}
	
  public int idCheck(Connection con, String userId) {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		String query=prop.getProperty("idCheck");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				result=rset.getInt(1);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		

		return result;

}
}
