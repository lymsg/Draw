package com.project.draw.command;

import java.util.ArrayList;import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.HeartDto;
import com.project.draw.dto.IBoardDto;
import com.project.draw.util.Constant;

public class P2hCheckCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		HeartDto hdto = (HeartDto)request.getAttribute("p2hCheck");
		
		HeartDto res = dao.p2hCheck(hdto);
		
		System.out.println("좋아요 확인: " + res);
//		int hNum = dto.gethNum();
//		String res = Integer.toString(hNum);
		
//		System.out.println("체크의 hNum: " + hNum);
		request.setAttribute("result", res);
		
		
		
		
		
//		ArrayList<HeartDto> dto = (ArrayList)dao.p2hCheck(hdto);
//		model.addAttribute("p2hUpCheck", dto);
		
//		String result = dao.p2hCheck(hdto);
	}

}
