package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.BoardDto;
import com.project.draw.util.Constant;



public class BoardContentCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao ddao = Constant.mdao;
		
		String bid = request.getParameter("bId");
		System.out.println(bid);
		
		BoardDto dto = ddao.bcontentView(bid);
		
		if(dto != null) {
			model.addAttribute("contentView", dto);
		}
	}

}
