package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.IBoardDto;
import com.project.draw.util.Constant;

public class P3IListCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao mdao = Constant.mdao;
		
		String iId = request.getParameter("iId");
		
		
		ArrayList<IBoardDto> dtos = mdao.p3IList(iId);
		model.addAttribute("p3IList", dtos);
		
		
		//MyIBoardDto dto = ddao.p3View(iId);
		//model.addAttribute("p3View",dto);

	}

}
