package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.RaffleInfoUploadDto;
import com.project.draw.util.Constant;

public class RaffleInfoUploadCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("RaffleInfoUploadCommand 커맨드 실행");
		
		MDao ddao = Constant.mdao;
		
		String ruCode = request.getParameter("ruCode");
		String logo = request.getParameter("logo");
		String store = request.getParameter("store");
		String storeUrl = request.getParameter("storeUrl");
		String startDate = request.getParameter("startDate");
		String startTime = request.getParameter("startTime");
		String endDate = request.getParameter("endDate");
		String endTime = request.getParameter("endTime");
		
		RaffleInfoUploadDto riudto = new RaffleInfoUploadDto(0, ruCode, logo, store, storeUrl, startDate, startTime, endDate, endTime);
		
		ddao.raffleInfoUpload(riudto);				
	}

} 
