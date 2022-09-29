package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.BoardDto;
import com.project.draw.util.Constant;

public class BoardDeleteCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao ddao = Constant.mdao;
		String bid = request.getParameter("bId");
		int bId = Integer.parseInt(bid);
		
		ddao.bdelete(bId);
	}

}
