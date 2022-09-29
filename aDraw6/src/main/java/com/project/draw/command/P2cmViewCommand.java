package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.CmBoardDto;
import com.project.draw.util.Constant;

public class P2cmViewCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		String iBoardNumString = request.getParameter("iBoardNum");
		int cmIBNum = Integer.parseInt(iBoardNumString);
		
		ArrayList<CmBoardDto> dtos = dao.p2cmView(cmIBNum);
		
		model.addAttribute("p2cmView", dtos);
		

	}

}
