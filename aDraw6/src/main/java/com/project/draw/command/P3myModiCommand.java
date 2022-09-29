package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.MyIBoardDto;
import com.project.draw.util.Constant;

public class P3myModiCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
	
		MyIBoardDto dto = (MyIBoardDto)request.getAttribute("mdto");
		
		
		String result = dao.p3myPModi(dto);
		model.addAttribute("result", result);
		
	}
}
