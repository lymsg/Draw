package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.project.draw.dao.MDao;
import com.project.draw.dto.DrawJoinDto;
import com.project.draw.util.Constant;

public class DrawJoinCommand implements DrawCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		String bid = request.getParameter("pid");
		String bpw = request.getParameter("ppw"); //암호화전
		String bemail = request.getParameter("pemail");
		String bname = request.getParameter("pname");
		String bpphone = request.getParameter("pphone");
		System.out.println("DrawJoinCommand커맨드 실행:" + bid + bpw + bemail + bname + bpphone);
		
		String bpw_org = bpw;
		bpw = passwordEncoder.encode(bpw_org);
		System.out.println(bpw + " size " + bpw.length());
		
		DrawJoinDto dto = new DrawJoinDto(bid,bpw,bemail,bname,bpphone,null,null);
		
		MDao mdao = Constant.mdao;
		
		String result = mdao.join(dto);
		System.out.println("DrawJoinCommand의 result: " + result);
		
		request.setAttribute("result", result);
	}

}
