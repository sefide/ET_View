package com.kh.et.manager.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.commit;
import static com.kh.et.common.JDBCTemplate.getConnection;
import static com.kh.et.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.manager.model.dao.ManagerDao;
import com.kh.et.manager.model.vo.Manager;
import com.kh.et.member.model.vo.Member;
import com.kh.et.plan.model.vo.City;


public class ManagerService {

	// 관리자 로그인 메소드
	public Manager managerLogin(Manager reqMember) {
		Connection con = getConnection();
		Manager loginManager = new ManagerDao().managerLogin(con, reqMember);

		close(con);


		return loginManager;

	}

	//전체멤버수 구하기
	public int[] selectTotal() {
		Connection con = getConnection();
		
		int[] select = new int[3];
		
		int total_member = new ManagerDao().selectTotal(con); //전체회원수
		int new_member = new ManagerDao().selectNewMember(con);
		int out_member = new ManagerDao().selectOutMember(con);
		
	/*	System.out.println("total_member : "+total_member);
		System.out.println("new_member : "+new_member);
		System.out.println("out_member : "+out_member);*/
		
		select[0] = total_member;
		select[1] = new_member;
		select[2] = out_member;
		/*System.out.println("select[0] : "+select[0]);
		System.out.println("select[1] : "+select[1]);
		System.out.println("select[2] : "+select[2]);*/
		
		close(con);
		
		return select;
	}

	//전체회원수 조회
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getListCount(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return listCount;
	}

	//회원리스트 배열에 담기
	public ArrayList<Member> selectAllList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list= new ManagerDao().selectAllList(con,currentPage,limit);
		
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);
		
		return list;
	}

	public int[] total() {
		Connection con = getConnection();
		
		int[] total = new int[3];
		
		int totalBoard = new ManagerDao().totalBoard(con); 
		int todayBoard = new ManagerDao().todayBoard(con);
		int avgBoard = new ManagerDao().avgBoard(con);
		
	
		
		total[0] = totalBoard;
		total[1] = todayBoard;
		total[2] = avgBoard;
	
		
		close(con);
		
		return total;
	}

	//최대포인트회원, 200포인트이상회원
	public int[] selectPoint() {
		Connection con = getConnection();
		
		int[] arr = new int[2];
		int max_point = new ManagerDao().selectMaxPoint(con);
		int max_count_member = new ManagerDao().selectCountMember(con);
		
		arr[0] = max_point;
		arr[1] = max_count_member;
		
		close(con);
		
		return arr;
	}

	//블랙회원 조회(정지안된 회원)
	public ArrayList<Member> selectBlackList2(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list= new ManagerDao().selectBlackList2(con,currentPage,limit);
		/*System.out.println("list의 길이 : "+list.size());*/
		
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);
		
		return list;
	}
	
	//블랙회원 조회(탈퇴안된 회원)
	public ArrayList<Member> selectBlackList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list= new ManagerDao().selectBlackList(con,currentPage,limit);
		/*System.out.println("list의 길이 : "+list.size());*/
		
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);
		
		return list;
	}	

	//정지회원조회
	public ArrayList<HashMap<String,Object>> selectStopList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list= new ManagerDao().selectStopList(con,currentPage,limit);
		
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectPlan(int currentPage, int limit) {
		
		Connection con=getConnection();
		ArrayList<HashMap<String,Object>> list=new ManagerDao().selectPlan(con,currentPage,limit);
		
		close(con);
		
		
		return list;
	}

	public int getListCount1() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getListCount1(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> boardList(int currentPage, int limit) {
		Connection con=getConnection();
		ArrayList<HashMap<String,Object>> list=null;
		
			list=new ManagerDao().boardList(con,currentPage,limit);
		
		close(con);
		
		
		return list;
	}

	public int getListCount2() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getListCount2(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		System.out.println("서비스 : " + listCount);
		return listCount;
	}

	//블랙리스트 회원조회 리스트 개수
	public int getBlackListCount() {
		Connection con = getConnection();
		int BlackListCount = new ManagerDao().getBlackListCount(con);
		
		if(BlackListCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return BlackListCount;
	}

	//정지회원 회원조회 리스트 개수
	public int getStopListCount() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getStopListCount(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return listCount;
	}

	//탈퇴회원 회원조회 리스트 개수
	public int getOutListCount() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getOutListCount(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return listCount;
	}

	//탈퇴회원 조회
	public ArrayList<Member> selectOutList(int currentPage2, int limit2) {
		Connection con = getConnection();
		
		ArrayList<Member> list= new ManagerDao().selectOutList(con,currentPage2,limit2);
		
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> tourBoardList(int currentPage, int limit) {
		Connection con=getConnection();
		ArrayList<HashMap<String,Object>> list=null;
		
		list=new ManagerDao().tourboardList(con,currentPage,limit);
		
		close(con);
		
		
		return list;
	}

	public int getListCount3() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getListCount3(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> cityList() {
		Connection con=getConnection();
		ArrayList<HashMap<String,Object>> list=null;
		
			list=new ManagerDao().cityList(con);
		
		close(con);
		
		
		return list;
	}

	public int getListCount4() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getListCount4(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return listCount;
	}

	//회원정지시키기
	public int stopMember(int index,int day) {
		Connection con = getConnection();
		
		//Member테이블 상태 update
		int result = 0; 		
		result = new ManagerDao().stopMember(con,index);
		
		//Stoplist테이블에 insert
		int result2=0;
		result2 = new ManagerDao().insertStopMember(con,index,day);
		
		int sum=0;
		sum=result+result2;
		
		if(sum!=0) {
			result=1;
			commit(con);
		}else {
			result=0;
			rollback(con);
		}
		close(con);
		
		return result;
	}

	//회원탈퇴
	public int outMember(int[] arr2) {
		Connection con = getConnection();
		
		int[] result = new int[arr2.length];
		int sum =0;
		int res=0;
		
		for(int i=0;i<arr2.length;i++) {
			result[i] = new ManagerDao().outMember(con, arr2[i]);
			
			if(result[i]==0) {
				System.out.println("탈퇴처리 실패");
			}
			else {
				sum+=result[i];
			}
			System.out.println("결과처리값 : "+result[i]);
		}
		
		if(sum/arr2.length==1) {
			res = 1;
			commit(con);
		}else {
			res=0;
			rollback(con);
		}
		close(con);
		
		return res;
	}

	//정지회원 취소
	//member에 m_stop_status 상태바꾸고, STOPLIST테이블에서 delete
	public int stopCancel(int[] arr2) {
		Connection con = getConnection();
		int[] result = new int[arr2.length];
		int[] result2 = new int[arr2.length];
		int sum =0;
		int sum2=0;
		int res=0;
		
		for(int i=0;i<arr2.length;i++) {
			//MEMBER테이블 상태 update
			result[i] = new ManagerDao().stopCancel(con, arr2[i]);
			
			//STOPLIST테이블에서 delete
			result2[i] = new ManagerDao().stopCancel2(con,arr2[i]);
			
			if(result[i]==0 || result2[i]==0) {
				System.out.println("정지취소처리 실패");
			}
			else {
				sum+=result[i];
				sum2+=result2[i];
			}
		}
		
		if(sum/arr2.length==1&&sum2/arr2.length==1) {
			res = 1;
			commit(con);
		}else {
			res=0;
			rollback(con);
		}
		close(con);
		
		return res;
	}

	//회원복구 - member테이블 상태update, stoplist테이블 탈퇴날짜 update
	public int outRestoreMember(int[] arr2) {
		Connection con = getConnection();
		
		int result1 = 0;
		int sum1=0;
		int res=0;
		
		for(int i=0;i<arr2.length;i++) {
			result1 = new ManagerDao().outRestoreMember_M(con,arr2[i]);
			
			if(result1==0) {
				System.out.println("정지취소처리 실패");
			}
			else {
				sum1+=result1;
			}
		}
		if(sum1/arr2.length==1) {
			res = 1;
			commit(con);
		}else {
			res=0;
			rollback(con);
		}
		close(con);
		
		
		return res;
	}

	//플랜삭제
	public int planDelete(int[] arr2) {
		Connection con = getConnection();
		
		int[] result1 = new int[arr2.length];
		int sum1=0;
		int res=0;
		
		for(int i=0;i<arr2.length;i++) {
			result1[i] = new ManagerDao().planDelete(con,arr2[i]);
			
			if(result1[i]==0) {
				System.out.println("플랜삭제 실패");
			}
			else {
				sum1+=result1[i];
			}
		}
		
		if(sum1/arr2.length==1) {
			res = 1;
			commit(con);
		}else {
			res=0;
			rollback(con);
		}
		close(con);
		
		
		return res;
	}

	public City updateOne(String[] testChk) {
		Connection con=getConnection();
		City ct=null;
		for(String item : testChk) {
			System.out.println("service"+item);
			ct=new ManagerDao().updateOne(con,item);
	
		}		
		close(con);
		return ct;
	}

	public ArrayList<City> cityList2(int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<City> list2= new ManagerDao().cityList2(con,currentPage,limit);
		
		if(list2!=null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return list2;
	}


	
	public int deleteBoards(List<Integer> list) {
		int result=0;
		for(Integer num : list) {
			Connection con=getConnection();
			result=new ManagerDao().deleteBoard(con,num);
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			
		}
		System.out.println("서비스 "+result);
		return result;
	}

	public int updatetc(City reqCity) {
		Connection con=getConnection();
		int result=new ManagerDao().updatetc(con,reqCity);
		if(result>0) {
			commit(con);

		} else {
			rollback(con);
		}
		return result;
	}

	public int deleteTravel(ArrayList<Integer> list) {
		int result=0;
		for(Integer num : list) {
			Connection con=getConnection();
			result=new ManagerDao().deleteTravel(con,num);
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			
		}
		System.out.println("서비스 "+result);
		return result;
	}

	public int deleteTourBoards(List<Integer> list) {
		int result=0;
		for(Integer num : list) {
			Connection con=getConnection();
			result=new ManagerDao().deleteTourBoards(con,num);
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			
		}
		System.out.println("서비스 "+result);
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectEval() {
		Connection con=getConnection();
		ArrayList<HashMap<String,Object>> list=null;
		
			list=new ManagerDao().selectEval(con);
		
		close(con);
		
		
		return list;
	}

	




}
