package com.team.nexus.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@RequestMapping("selectCal.ih")
	public String selectList() {
		
		return "calendar/calendar";
	}
}
