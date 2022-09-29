package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.MyRaffleCalendarDto;
import com.project.draw.util.Constant;

public class MyRaffleCalendarCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		MDao ddao = Constant.mdao;
		String cId = request.getParameter("cId");
		System.out.println("MyRaffleCalendarCommand 커맨드 실행, cId: " + cId);
		ArrayList<MyRaffleCalendarDto> list = ddao.myRaffleCalendarList(cId);
		
		model.addAttribute("mrcList", list);

	}

}
