package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.ContentDto;
import com.project.draw.util.Constant;

public class AucPageListCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao ddao = Constant.mdao;
		String pageNo = request.getParameter("pageNo");
		ArrayList<ContentDto> dtos = ddao.apageList(pageNo);
		
		model.addAttribute("list",dtos);
	}

}
