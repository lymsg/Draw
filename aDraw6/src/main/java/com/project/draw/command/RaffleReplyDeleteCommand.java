package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.util.Constant;

public class RaffleReplyDeleteCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		System.out.println("RaffleReplyDeleteCommand 커맨드 실행");
		MDao ddao = Constant.mdao;
		String rId = request.getParameter("rId");
		int rid = Integer.parseInt(rId);
		
		
		
		String user_id = request.getParameter("user_id");
		String rUserId = request.getParameter("rUserId");
		System.out.println("RaffleReplyDeleteCommand 커맨드의 user_id: " + user_id + ", rUserId: " + rUserId);
		
		String result = null;
		if(user_id.equals(rUserId)) {			
			ddao.raffleReplyDelete(rid);
			System.out.println("userId가 일치합니다. RaffleReplyDeleteCommand 커맨드 실행, rid: " + rid);
			result = "댓글이 삭제되었습니다.";
		}
		else {
			System.out.println("userId 불일치입니다.");
			result = "권한이 없습니다.";
		}		
		
		request.setAttribute("result", result);
	}

}
