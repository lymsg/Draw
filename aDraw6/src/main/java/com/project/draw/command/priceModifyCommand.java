package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


import com.project.draw.dao.MDao;
import com.project.draw.dto.ContentDto;
import com.project.draw.util.Constant;

public class priceModifyCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
MDao dao = Constant.mdao;
		
		String pname = request.getParameter("pnameId");
		int price =  Integer.parseInt(request.getParameter("priId2"));
		String pbuyer = request.getParameter("curIdhidden");
		ContentDto dto = new ContentDto(pname,price,pbuyer);
		
		dao.modify(dto);
	}

}
