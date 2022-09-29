package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.MyIBoardDto;
import com.project.draw.util.Constant;

public class P1sUserViewCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		String iId = request.getParameter("iId");
		String iProfilePath = request.getParameter("iProfilePath");
		
		ArrayList<MyIBoardDto> dtos = dao.p1sUserView();
		
		model.addAttribute("p1sUserView", dtos);
		

	}

}
