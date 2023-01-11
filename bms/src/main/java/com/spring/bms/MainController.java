package com.spring.bms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main() {
		return "/main"; 	// jsp가 아니라 main.xml파일의 main으로 이동
	}
}
