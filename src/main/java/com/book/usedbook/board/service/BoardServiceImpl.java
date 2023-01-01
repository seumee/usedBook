package com.book.usedbook.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.book.usedbook.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper mapper;
	//@Autowired BoardFileService bfs;

	@Override
	public void getList(Model model, int optionNum, int num) {
		int pageLetter = 10;
		int allCount = 0;
		if(optionNum == 1) {			
			allCount = mapper.curListCount();
		} else if(optionNum == 2){
			allCount = mapper.allListCount();
		}

		int repeat = allCount / pageLetter;
		if( allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);

		if(optionNum == 1) {			
			model.addAttribute("list", mapper.getCurList(start, end));
		} else if(optionNum == 2){
			model.addAttribute("list", mapper.getAllList(start, end));
		}
	}	
}
