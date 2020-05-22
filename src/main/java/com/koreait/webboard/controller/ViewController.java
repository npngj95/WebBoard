package com.koreait.webboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {
	
	// Home - index
	@RequestMapping("/")
	public String default_home() {
		return "index";
	}
	
	@RequestMapping("/index")
	public String home() {
		return "index";
	}
	
}
