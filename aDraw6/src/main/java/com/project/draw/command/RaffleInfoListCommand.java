package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.RaffleInfoUploadDto;
import com.project.draw.util.Constant;

public class RaffleInfoListCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("RaffleInfoListCommand 커맨드 실행");
		MDao ddao = Constant.mdao;
		
		String ruCode = request.getParameter("ruCode");
		System.out.println("RaffleInfoListCommand 커맨드의 ruCode: " + ruCode);
		ArrayList<RaffleInfoUploadDto> riudto = ddao.RaffleInfoList(ruCode);
		System.out.println(riudto);
		model.addAttribute("riList", riudto);

	}

}
