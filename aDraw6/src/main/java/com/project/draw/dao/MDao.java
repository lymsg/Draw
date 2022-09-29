package com.project.draw.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.draw.dto.BoardDto;
import com.project.draw.dto.CmBoardDto;
import com.project.draw.dto.ContentDto;
import com.project.draw.dto.DrawJoinDto;
import com.project.draw.dto.HeartDto;
import com.project.draw.dto.IBoardDto;
import com.project.draw.dto.MyIBoardDto;
import com.project.draw.dto.MyRaffleCalendarDto;
import com.project.draw.dto.RaffleCarouselImageDto;
import com.project.draw.dto.RaffleInfoUploadDto;
import com.project.draw.dto.RaffleReplyDto;
import com.project.draw.dto.RaffleReplyPageListDto;
import com.project.draw.dto.RaffleUploadDto;
import com.project.draw.dto.Servey1Dto;
import com.project.draw.dto.Servey2Dto;

public class MDao implements IDao {
	@Autowired
	private SqlSession sqlSession;
	
	/* 회원가입 */
	@Override
	public String join(DrawJoinDto dto) {
		String result = null;
		try {
			int res = sqlSession.insert("join",dto);
			System.out.println("join dao의 res값: " + res);
			if(res > 0) {
				result = "success";
			}
			else {
				result = "failed";
			}
		}
		catch(Exception e) {
			e.getMessage();
			result = "failed";
		}
		return result;
		
	}
	
	//로그인 처리
	@Override
	public DrawJoinDto login(String pid) {
		System.out.println(pid);
		DrawJoinDto result = sqlSession.selectOne("login",pid);
		return result;
	}

	
//정지은 SNS --------------------------------------------
	
	//p1 관련상품 게시글 불러오기
		@Override
		public ArrayList<IBoardDto> p1item(String iModelName) {
			ArrayList<IBoardDto> dtos = (ArrayList)sqlSession.selectList("p1item", iModelName);
			return dtos;
		}
	//p1 신규 이미지게시글 불러오기	
		@Override
		public ArrayList<IBoardDto> iView1() {
			
			ArrayList<IBoardDto> dtos = (ArrayList)sqlSession.selectList("iView1");
			return dtos;
		}
	//p1 인기게시물 불러오기
		@Override
		public ArrayList<IBoardDto> hotIBoard() {
			ArrayList<IBoardDto> dtos = (ArrayList)sqlSession.selectList("hotIBoard");
			return dtos;
		}
	//p1 인기유저 불러오기
		@Override
		public ArrayList<MyIBoardDto> p1rUserView() {
			ArrayList<MyIBoardDto> dtos = (ArrayList)sqlSession.selectList("p1rUserView");
			return dtos;
		}
	//p1 모든유저 불러오기
		@Override
		public ArrayList<MyIBoardDto> p1sUserView() {
			ArrayList<MyIBoardDto> dtos = (ArrayList)sqlSession.selectList("p1sUserView");
			return dtos;
		}

		
	//p2 이미지 게시글 상세보기
		@Override
		public IBoardDto p2View(int iBoardNum) {
			IBoardDto dto = sqlSession.selectOne("p2View", iBoardNum);
			p2UpHit(iBoardNum);
			return dto;
		}
	//p2페이지 불러오기
		public MyIBoardDto p2PView(String iId) {
			MyIBoardDto dto = sqlSession.selectOne("p2PView", iId);
			return dto;
		}
		
		//게시글 hit수 올리기
		@Override
		public void p2UpHit(int iBoardNum) {
			sqlSession.update("p2UpHit", iBoardNum);
			System.out.println("히트수업");
		}
		
	//p2댓글불러오기
		@Override
		public ArrayList<CmBoardDto> p2cmView(int cmIBNum) {
			ArrayList<CmBoardDto> dtos = (ArrayList)sqlSession.selectList("p2cmView", cmIBNum);
			return dtos;
		}
	//p2댓글삭제하기
		@Override
		public void p2cmDelete(int cmNum) {
			int res = sqlSession.delete("p2cmDelete", cmNum);
			System.out.println("댓글을 삭제했습니다");
		}

	//p2좋아요확인
		@Override
		public HeartDto p2hCheck(HeartDto hdto) {
			HeartDto dto = sqlSession.selectOne("p2hCheck", hdto);
			return dto;
		}
	//p2좋아요클릭
		@Override
		public void p2hUp(HeartDto hdto) {
			//HeartDto dto = new HeartDto(iBoardNum,iId);
			sqlSession.insert("p2hUp", hdto);
			p2UpHeart(hdto);
			System.out.println("p2hUp좋아요등록");
		}
	//p2좋아요해제
		@Override
		public void p2hDown(int hNum) {
			sqlSession.delete("p2hDown",hNum);
			System.out.println("p2hDown좋아요해제");
		}
		@Override
		public void p2UpHeart(HeartDto hdto) {
			sqlSession.update("p2UpHeart", hdto);
			System.out.println("게시물 좋아요 +1됨");
		}
		@Override
		public void p2DownHeart(int hiBoardNum) {
			sqlSession.update("p2DownHeart", hiBoardNum);
			System.out.println("게시물 좋아요 -1됨");
		}
		@Override
		public void p3TotalHUp(String iId) {
			sqlSession.update("p3TotalHUp", iId);
			System.out.println("총하트수 +1");
		}
		@Override
		public void p3TotalHDown(String iId) {
			sqlSession.update("p3TotalHDown", iId);
			System.out.println("총하트수 -1");
		}

	//p3 개별 페이지 불러오기
		@Override
		public MyIBoardDto p3View(String iId) {
			MyIBoardDto result = sqlSession.selectOne("p3View",iId);
			return result;
//			MyIBoardDto dto = sqlSession.selectOne("p3View", iId);
//			return dto;
		}
	//p3좋아요한 게시글모음 보기
		@Override
		public ArrayList<IBoardDto> p3IHeartList(String iId) {
			ArrayList<IBoardDto> dtos = (ArrayList)sqlSession.selectList("p3IHeartList", iId);
			return dtos;
		}	
	//p3 개별 페이지 이미지리스트 불러오기
		@Override
		public ArrayList<IBoardDto> p3IList(String iId) {
			//IBoardDto dto = sqlSession.selectOne("p3IList", iId);
			ArrayList<IBoardDto> dtos = (ArrayList)sqlSession.selectList("p3IList",iId);
			return dtos;
		}	
	//p3my 프로필이미지 수정하기
		@Override
		public String p3myPModi(MyIBoardDto dto) {
			String result;
			int res = sqlSession.update("p3myPModi", dto);
			
			if(res == 1) {
				result = "success";
				System.out.println("프로필 업데이트 성공");
			}
			else {
				result = "failed";
			}
			return result;
		}	
	//p3my 프로필 자기소개 수정하기
		@Override
		public void p3myModi(MyIBoardDto dto) {
			sqlSession.update("p3myModi", dto);
		}	
	//p4 게시글 작성하기()
		@Override
		public String p4WriteI(IBoardDto dto) {
			System.out.println("p4WriteI dao메서드 요청");
			System.out.println("dto:" + dto);
			System.out.println(dto.getiBoardNum() +dto.getiId()+ dto.getiModelName()+ dto.getiImagePath());
			String result;
			int res = sqlSession.insert("p4WriteI", dto);
			
			if(res == 1) {
				result = "success";
				System.out.println("게시글 작성 성공");
			}
			else {
				result = "failed";
			}
			return result;
		}
	//p4 게시글 수정페이지 불러오기
		@Override
		public IBoardDto p4modifyView(int iBoardNum) {
			IBoardDto dto = sqlSession.selectOne("p4modifyView", iBoardNum);
			return dto;
		}

	//p4 게시글 수정하기
		@Override
		public void p4modify(IBoardDto dto) {
			sqlSession.update("p4modify", dto);
		}
	//p4 게시글 삭제하기
		@Override
		public void p4modifyDelete(int iBoardNum) {
			int res = sqlSession.delete("p4modifyDelete", iBoardNum);
		}
	//p4게시글 작성하기
		@Override
		public void p2mentWrite(int cmIBNum, String cmId, String cmText) {
			System.out.println("cmIBNum: " +cmIBNum);
		CmBoardDto dto = new CmBoardDto(cmIBNum,cmId,cmText);
		System.out.println("dto: " +dto.getCmIBNum());
		sqlSession.insert("p2mentWrite", dto);
		}
		
	//p5그래프불러오기
		@Override
		public ArrayList<Servey1Dto> p5View1() {
			System.out.println("mdao p5View1메서드");
			ArrayList<Servey1Dto> dtos = (ArrayList)sqlSession.selectList("p5View1");
			return dtos;
		}
		@Override
		public ArrayList<Servey2Dto> p5View2() {
			System.out.println("mdao p5View2메서드");
			ArrayList<Servey2Dto> dtos = (ArrayList)sqlSession.selectList("p5View2");
			return dtos;
		}
	/*p5그래프작성하기(form도 미완성)
		@Override
		public void p5Write(Servey1Dto dto) {
			System.out.println("p5Write처리");
			int res = sqlSession.insert("p5Write", dto);
		}
		//총 좋아요 수 보기 카운트 해결못함
		@Override
		public int p3TotalHeart(String iId) {
			int num = sqlSession.selectOne("p3TotalHeart", iId);
			System.out.println("daoNum" + num);
//			int num1 = sqlSession.selectOne("p3TotalHeart", iId);
//			String num = String.valueOf(num1);
//			System.out.println("String"+num1);
//			System.out.println("Int" + num);
			return num;
		}
	*/

		
		
//이영민 ------------------------------------------------------------		
	
		public SqlSession getSqlSession() {
			return sqlSession;
		}
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
		@Override
		public String sell(ContentDto dto) {
			System.out.println("sell_dao");
			String result;
			int res = sqlSession.insert("sell",dto);
			if(res == 1) {
				result = "success";
			}
			else {
				result = "failed";
			}
			
			return result;
		}	
		@Override
		public ArrayList<ContentDto> listDao(){
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("listDao");
			return result;
		}
		@Override
		public ArrayList<ContentDto> nikeList(){
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("nikeList");
			return result;
		}
		@Override
		public ArrayList<ContentDto> adidasList(){
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("adidasList");
			return result;
		}
		@Override
		public ArrayList<ContentDto> newbalList(){
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("newbalList");
			return result;
		}
		@Override
		public ArrayList<ContentDto> unarmList(){
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("unarmList");
			return result;
		}
		
		@Override
		public ArrayList<ContentDto> newsort(){
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("newsort");
			return result;
		
		}
		@Override
		public ArrayList<ContentDto> oldsort(){
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("oldsort");
			return result;
		
		}
		@Override
		public ArrayList<ContentDto> lpricesort() {
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("lpricesort");
			return result;
		}
		@Override
		public ArrayList<ContentDto> hpricesort() {
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("hpricesort");
			return result;
		}
		@Override
		public void modify(ContentDto dto) {
			sqlSession.update("modify",dto);
			
		}
		@Override
		public ArrayList<ContentDto> apageList(String pageNo) {
			System.out.println("apageList");
			int page = Integer.parseInt(pageNo);
			int startNo = (page-1) * 4 +1;
			System.out.println("startNo : " + startNo);
			ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("apageList",startNo);
			return result;
		}
		
		
// 함세윤 LAFFEL----------------------------------------
		
		
		//래플 업로드
		@Override
		public String raffleUpload(RaffleUploadDto rudto) {
			System.out.println("raffleUpload실행");
			String result;
			int res = sqlSession.insert("raffleUpload", rudto);
			if(res == 1) {
				result = "success";
			}
			else {
				result = "failed";
			}
			return result;
		}
		
		//래플 캐로셀업로드
		@Override
		public String raffleCarouselUpload(RaffleCarouselImageDto rcidto) {
			System.out.println("raffleCarouselUpload dao 실행");
			String result;
			int res = sqlSession.insert("raffleCarouselUpload", rcidto);
			if(res == 1) {
				result = "success";
			}
			else {
				result = "failed";
			}
			return result;
		}
		
		//래플리스트 보기
		@Override
		public ArrayList<RaffleUploadDto> raffleList() {
			System.out.println("raffleList 보기 실행");
			ArrayList<RaffleUploadDto> dtos = (ArrayList) sqlSession.selectList("raffleList");
			System.out.println(dtos);
			return dtos;
		}
		
		//래플리스트 삭제하기
		@Override
		public void raffleListDelete(int ruId) {
			System.out.println("raffleListDelete dao실행");
			sqlSession.delete("raffleListDelete", ruId);
		}

		//래플 일정을 My Raffle Calendar에 등록하기 
		@Override
		public void addtoCalendar(MyRaffleCalendarDto dto) {
			System.out.println("addtoCalendar dao 실행");
			sqlSession.insert("addtoCalendar", dto);
		}
		
		//래플 디테일 보기
		@Override
		public RaffleUploadDto raffleDetails(String ruCode) {
			System.out.println("raffleDetails dao 실행");
			RaffleUploadDto dto = sqlSession.selectOne("raffleDetails", ruCode);
			return dto;
		}
		
		//래플 캐로셀 디테일 보기
		@Override
		public ArrayList<RaffleCarouselImageDto> raffleCarouselDetails(String ruCode) {
			System.out.println("raffleCarouselDetails dao 실행");
			ArrayList<RaffleCarouselImageDto> rcidtos = (ArrayList) sqlSession.selectList("raffleCarouselDetails", ruCode);
			System.out.println(rcidtos);
			return rcidtos;
		}
		
		
		//래플 응모정보 업로드
		@Override
		public void raffleInfoUpload(RaffleInfoUploadDto riudto) {
			System.out.println("raffleInfoUpload dao 실행");
			sqlSession.insert("raffleInfoUpload", riudto);		
		}
		
		//래플 응모정보 보기
		@Override
		public ArrayList<RaffleInfoUploadDto> RaffleInfoList(String ruCode) {
			System.out.println("RaffleInfoList Dao 실행");
			System.out.println("RaffleInfoList Dao 의 ruCode: " + ruCode);
			ArrayList<RaffleInfoUploadDto> riudto = (ArrayList)sqlSession.selectList("raffleInfoList", ruCode);
			return riudto;
		}
		
		//래플 응모정보 삭제
		@Override
		public void raffleInfoDelete(int id) {
			System.out.println("raffleInfoDelete Dao 실행");
			sqlSession.delete("raffleInfoDelete", id);
		}	
		
		//래플 댓글 작성하기
		@Override
		public void RaffleReplyWrite(String rUserId, String rContent, String rCode) {
			System.out.println("RaffleReplyWrite dao 실행");
			RaffleReplyDto rdto = new RaffleReplyDto(rUserId, rContent, rCode);
			sqlSession.insert("RaffleReplyWrite", rdto);		
		}
		
		//래플 댓글 보기
		@Override
		public ArrayList<RaffleReplyDto> RaffleReplyList(String rCode) {
			System.out.println("RaffleReplyList dao 실행");
			System.out.println("RaffleReplyList dao의 rCode: " + rCode);
			ArrayList<RaffleReplyDto> rrdtos = (ArrayList)sqlSession.selectList("RaffleReplyList", rCode);
			return rrdtos;
		}
		
		//래플 댓글 페이지네이션
		@Override
		public ArrayList<RaffleReplyDto> pagelist(String pageNo, String rCode) {
			System.out.println("pagelist dao 실행");
			int page = Integer.parseInt(pageNo);
			int startNo = (page-1) * 10 + 1;
			System.out.println("pagelist dao의 startNo: " + startNo);
			System.out.println("pagelist dao의 rCode: " + rCode);
			
			RaffleReplyPageListDto rrpldto = new RaffleReplyPageListDto(rCode, startNo);
			
			ArrayList<RaffleReplyDto> result = (ArrayList) sqlSession.selectList("pagelist", rrpldto);
			
			System.out.println(result);
			
			return result;
		}
		
		
		//래플 댓글 삭제
		@Override
		public void raffleReplyDelete(int rid) {
			System.out.println("raffleReplyDelete dao실행");

			int res = sqlSession.delete("raffleReplyDelete", rid);
		}
		
		//래플 캘린더 보기
		@Override
		public ArrayList<MyRaffleCalendarDto> myRaffleCalendarList(String cId) {
			System.out.println("myRaffleCalendarList dao실행");
			ArrayList<MyRaffleCalendarDto> list = (ArrayList) sqlSession.selectList("myRaffleCalendarList", cId);
			return list;
		}
		
		//래플 캘린더 일정 수정
		@Override
		public void myRaffleCalendarUpdate(MyRaffleCalendarDto dto) {
			System.out.println("myRaffleCalendarUpdate dao 실행");
			sqlSession.update("myRaffleCalendarUpdate", dto);
		}
		
		//래플 캘린더 일정 추가
		@Override
		public void myRaffleCalendarInsert(MyRaffleCalendarDto dto) {
			System.out.println("myRaffleCalendarInsert dao 실행");
			sqlSession.insert("myRaffleCalendarInsert", dto);
		}
		
		//래플 캘린더 일정 삭제
		@Override
		public void myRaffleCalendarDelete(MyRaffleCalendarDto dto) {
			System.out.println("myRaffleCalendarDelete dao 실행");
			sqlSession.delete("myRaffleCalendarDelete", dto);
		}
		

// 최정민 BOARD----------------------------------------
		/*Board list*/
		@Override
		public ArrayList<BoardDto> blist() {
			ArrayList<BoardDto> dtos = (ArrayList)sqlSession.selectList("blist");		
			return dtos;
		}
		
		/*Board page list */
		@Override
		public ArrayList<BoardDto> bpageList(String pageNo) {
			System.out.println("bpageList");
			int page = Integer.parseInt(pageNo);
			int startNo = (page-1) * 10 +1;
			System.out.println("startNo : " + startNo);
			ArrayList<BoardDto> result = (ArrayList)sqlSession.selectList("bpageList",startNo);
			return result;
		}
		
		//board write */
		@Override
		public void bWrite(String name,String title,String content) {
			BoardDto dto = new BoardDto(name,title,content);
			sqlSession.insert("bWrite",dto);
		}
		
		/*게시판 내용 보기 */
		@Override
		public BoardDto bcontentView(String bid) {
			int bId = Integer.parseInt(bid);
			bupHit(bId);		
			BoardDto dto = sqlSession.selectOne("bcontentView",bId);
			return dto;
		}
		
		/*히트수 올리기 */
		@Override
		public void bupHit(int bId) {
			sqlSession.update("bupHit",bId);
		}
		
		/*게시판 수정 */
		@Override
		public void bmodify(BoardDto dto) {
			sqlSession.update("bmodify",dto);
		}
		
		/*게시판 삭제 */
		@Override
		public void bdelete(int bId) {
			int res = sqlSession.delete("bdelete",bId);
		}
		
		/*게시판 댓글 창 보여 주기 */
		@Override
		public BoardDto breplyView(int bId) {
			System.out.println("댓글창 보여주기");
			BoardDto dto = sqlSession.selectOne("breplyView",bId);
			return dto;
		}
		
		/*댓글 내용 저장 */
		@Override
		public void breply(BoardDto dto) {
			System.out.println("댓글내용 저장 하기");
			breplyShape(dto.getbGroup(), dto.getbStep());
			int res = sqlSession.insert("breply",dto);
		}
		
		/*댓글 모양 처리 */
		@Override
		public void breplyShape(int bGroup,int bStep) {
			BoardDto dto = new BoardDto(bGroup,bStep);
			int res = sqlSession.update("breplyShape",dto);
		}

}
