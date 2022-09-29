package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.BoardDto;
import com.project.draw.util.Constant;

public class BoardListCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao ddao = Constant.mdao;
		ArrayList<BoardDto> dtos = ddao.blist();
		//리턴된 jsp페이지에 dtos값 포함
		model.addAttribute("listContent", dtos);
	}

}
