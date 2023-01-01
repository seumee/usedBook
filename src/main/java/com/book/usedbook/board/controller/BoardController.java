package com.book.usedbook.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.usedbook.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired BoardService bs;
	
	@GetMapping(value="list/{option}")
	public String myList(Model model, @PathVariable(value="option") String option, @RequestParam(value="num",required=false, defaultValue ="1") int num) {
		//optionNum 1->현재 구매가능
		//			2->전체 거래글
		int optionNum = 1;
		if(option.equals("cur")) {
			optionNum = 1;	
		} else if(option.equals("all"))	optionNum = 2;
		bs.getList(model, optionNum, num);
		return "board/list";
	}

}
