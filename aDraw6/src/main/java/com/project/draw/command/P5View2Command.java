package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.Servey2Dto;
import com.project.draw.util.Constant;

public class P5View2Command implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		ArrayList<Servey2Dto> dtos = dao.p5View2();
		
		model.addAttribute("p5View2", dtos);
		

	}

}
