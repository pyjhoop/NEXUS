package com.team.nexus.repository.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RepositoryController {

	@RequestMapping("repository.p")
	public String repositoyPage() {
		return "repository/repository";
	}
}
