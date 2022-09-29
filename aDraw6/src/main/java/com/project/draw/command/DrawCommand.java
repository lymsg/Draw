package com.project.draw.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DrawCommand {
	//추상메서드
		public void execute(HttpServletRequest request,Model model);
}
