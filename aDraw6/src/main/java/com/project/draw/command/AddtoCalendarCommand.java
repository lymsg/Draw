package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.MyRaffleCalendarDto;
import com.project.draw.util.Constant;

public class AddtoCalendarCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		MDao ddao = Constant.mdao;
		System.out.println("AddtoCalendarCommand 커맨드 실행");
		MyRaffleCalendarDto dto = (MyRaffleCalendarDto)request.getAttribute("dto");
		ddao.addtoCalendar(dto);
	}

}
