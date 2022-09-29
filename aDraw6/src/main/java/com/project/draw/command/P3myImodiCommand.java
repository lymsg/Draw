package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.MyIBoardDto;
import com.project.draw.util.Constant;

public class P3myImodiCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		String iId = request.getParameter("iId");
		String iIntroduce = request.getParameter("iIntroduce");
		String iTotalHeartString = request.getParameter("iTotalHeart");
		int iTotalHeart = Integer.parseInt(iTotalHeartString);
		
		MyIBoardDto dto = new MyIBoardDto(iId,iIntroduce,iTotalHeart);
		dao.p3myModi(dto);
		
		
	}

}
