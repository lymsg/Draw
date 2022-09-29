package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.RaffleReplyDto;
import com.project.draw.util.Constant;

public class RaffleReplyPageListCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		MDao ddao = Constant.mdao;
		String pageNo = request.getParameter("pageNo");
		String rCode = request.getParameter("rCode");		
		
		ArrayList<RaffleReplyDto> dtos = ddao.pagelist(pageNo, rCode);
		
		System.out.println(dtos);
		
		model.addAttribute("pagelist", dtos);

	}

}
