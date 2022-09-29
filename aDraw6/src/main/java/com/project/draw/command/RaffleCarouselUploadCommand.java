package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.RaffleCarouselImageDto;
import com.project.draw.util.Constant;

public class RaffleCarouselUploadCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("RaffleCarouselUploadCommand 커맨드 실행");
		MDao ddao = Constant.mdao;
		RaffleCarouselImageDto rcidto = (RaffleCarouselImageDto) request.getAttribute("rcidto");
		String result = ddao.raffleCarouselUpload(rcidto);
		model.addAttribute("result", result);
	}

}
