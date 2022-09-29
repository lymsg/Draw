package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMethodMappingNamingStrategy;

import com.project.draw.dao.MDao;
import com.project.draw.dto.CmBoardDto;
import com.project.draw.util.Constant;

public class P2MentWriteCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		String cmIBNumString = request.getParameter("cmIBNum");
		System.out.println("cmIB: " +cmIBNumString);
		int cmIBNum = Integer.parseInt(cmIBNumString);
		String cmId = request.getParameter("cmId");
		String cmText = request.getParameter("cmText");
		
		System.out.println(cmIBNum + cmId + cmText);
		
		dao.p2mentWrite(cmIBNum, cmId, cmText);

	}

}
