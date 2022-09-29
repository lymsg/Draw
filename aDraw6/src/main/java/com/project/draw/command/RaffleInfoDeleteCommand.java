package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.util.Constant;

public class RaffleInfoDeleteCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("RaffleInfoDeleteCommand 커맨드 실행");
		MDao ddao = Constant.mdao;
		String Id = request.getParameter("id");
		int id = Integer.parseInt(Id);
		
		ddao.raffleInfoDelete(id);
	}

}
