package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.Servey1Dto;
import com.project.draw.util.Constant;

public class P5WriteCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		Servey1Dto dto = (Servey1Dto) request.getAttribute("dto");
		
//		dao.p5Write(dto);
		

	}

}
