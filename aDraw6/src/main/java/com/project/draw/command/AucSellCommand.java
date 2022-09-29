package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.ContentDto;
import com.project.draw.util.Constant;



public class AucSellCommand implements DrawCommand {
	
	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("ÀÌ¿µ¹Î¾¾command");
		
		MDao dao = Constant.mdao;
		ContentDto dto = (ContentDto)request.getAttribute("pdto");		
		
		System.out.println("command2");
		String result = dao.sell(dto);
		model.addAttribute("result", result);
	}
}
