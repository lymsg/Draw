package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.IBoardDto;
import com.project.draw.util.Constant;

public class P4WriteCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao mdao = Constant.mdao;

		IBoardDto dto = (IBoardDto)request.getAttribute("idto");
		
		String result = mdao.p4WriteI(dto);
		model.addAttribute("result", result);


	}

}
