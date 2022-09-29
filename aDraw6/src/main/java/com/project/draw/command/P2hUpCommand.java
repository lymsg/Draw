package com.project.draw.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.HeartDto;
import com.project.draw.util.Constant;

public class P2hUpCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		HeartDto hdto = (HeartDto)request.getAttribute("p2hUp");

//		HeartDto dtos = dao.p2hUp(hdto);	
//		model.addAttribute("p2h", dtos);
		
		
		dao.p2hUp(hdto);
		dao.p2UpHeart(hdto);
		String iId = hdto.getHiId();
		System.out.println("upId: " +iId);
		dao.p3TotalHUp(iId);
		
		


	}

}
