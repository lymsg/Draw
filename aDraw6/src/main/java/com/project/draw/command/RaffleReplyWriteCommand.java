package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.util.Constant;

public class RaffleReplyWriteCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("RaffleReplyWriteCommand 커맨드 실행");
		MDao ddao = Constant.mdao;
		String rUserId = request.getParameter("rUserId");
		String rContent = request.getParameter("rContent");
		String rCode = request.getParameter("ruCode");
		
		ddao.RaffleReplyWrite(rUserId, rContent, rCode);
		

	}

}
