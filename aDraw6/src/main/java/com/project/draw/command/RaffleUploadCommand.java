package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.RaffleUploadDto;
import com.project.draw.util.Constant;

public class RaffleUploadCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		MDao ddao = Constant.mdao;
		RaffleUploadDto rudto = (RaffleUploadDto) request.getAttribute("rudto");
		String result = ddao.raffleUpload(rudto);
		model.addAttribute("result", result);		
	}

}
