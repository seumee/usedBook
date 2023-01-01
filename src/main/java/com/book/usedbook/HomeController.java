package com.book.usedbook;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@GetMapping(value = "/")
	public String home() {		
		return "home";
	}
	
}
