package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.HeartDto;
import com.project.draw.util.Constant;

public class P2hDownCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao dao = Constant.mdao;
		
		HeartDto hdto = (HeartDto) request.getAttribute("p2hUp");
		
		
		HeartDto dto = dao.p2hCheck(hdto);
		model.addAttribute("p2h", dto);
		
		
		int hiBoardNum = dto.gethiBoardNum();
		System.out.println("다운iBoardNum: " + hiBoardNum);

		int hNum = dto.gethNum();
		System.out.println("다운hNum: " + hNum);

		String iId = dto.getHiId();
		System.out.println("다운iId" +iId);
		
		
		dao.p2hDown(hNum);
		dao.p2DownHeart(hiBoardNum);
		dao.p3TotalHDown(iId);
		

		
/*
		MDao dao = Constant.mdao;
		
		HeartDto hdto = (HeartDto) request.getAttribute("p2hUp");
		
		
		int hNum = hdto.gethNum();
//		String hNum = Integer.toString(hNumS);
		System.out.println("hNum: " + hNum);
		
		
		dao.p2hDown(hNum);
		
 */
		
		
		
	}

}
