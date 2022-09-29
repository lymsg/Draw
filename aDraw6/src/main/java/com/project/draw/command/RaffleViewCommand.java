package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.RaffleUploadDto;
import com.project.draw.util.Constant;

public class RaffleViewCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("RaffleViewCommand dao ½ÇÇà");
		MDao ddao = Constant.mdao;
		ArrayList<RaffleUploadDto> dtos = ddao.raffleList();
		model.addAttribute("raffleList", dtos);
	}
}
