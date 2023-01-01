package com.book.usedbook.board.service;

import org.springframework.ui.Model;

public interface BoardService {

	public void getList(Model model, int option, int num);	// 판매글
}
