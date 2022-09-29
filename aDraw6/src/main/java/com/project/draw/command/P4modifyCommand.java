package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.IBoardDto;
import com.project.draw.util.Constant;

public class P4modifyCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		
		MDao mdao = Constant.mdao;
		
		String iBoardNumString = request.getParameter("iBoardNum");
		
		int iBoardNum = Integer.parseInt(iBoardNumString);
		String iId = request.getParameter("iId");
		String iText = request.getParameter("iText");
		String iModelName = request.getParameter("iModelName");
		
		IBoardDto dto = new IBoardDto(iBoardNum, iId, iText, iModelName);
		
		mdao.p4modify(dto);

	}

}

