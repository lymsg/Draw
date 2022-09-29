package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.IBoardDto;
import com.project.draw.util.Constant;

public class P4modifyViewCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao mdao = Constant.mdao;
		
		String iBoardNumString = request.getParameter("iBoardNum");
		int iBoardNum = Integer.parseInt(iBoardNumString);
		
		IBoardDto dto = mdao.p4modifyView(iBoardNum);
		
		if(dto != null) {
			model.addAttribute("p4modifyView", dto);
		}

	}

}
