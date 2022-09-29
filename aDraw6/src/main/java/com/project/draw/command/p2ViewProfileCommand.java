package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.HeartDto;
import com.project.draw.dto.MyIBoardDto;
import com.project.draw.util.Constant;

public class p2ViewProfileCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		String iId = request.getParameter("iId");
		
		MyIBoardDto dto =  dao.p2PView(iId);
		
		model.addAttribute("p2PView", dto);

	}

}
