package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.HeartDto;
import com.project.draw.dto.MyIBoardDto;
import com.project.draw.util.Constant;


public class P3ViewCommand implements DrawCommand {
	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		MDao mdao = Constant.mdao;
		
		String iId = request.getParameter("iId");
		MyIBoardDto dto = mdao.p3View(iId);
		model.addAttribute("p3View",dto);
		
		
		
		/*좀 봐야함
		int num = mdao.p3TotalHeart(iId);
		System.out.println("커맨드num: " + num);
		model.addAttribute("p3TotalHeart", num);
*/
	}
}

