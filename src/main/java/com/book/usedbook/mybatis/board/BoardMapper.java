package com.book.usedbook.mybatis.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.usedbook.board.dto.BoardDTO;

public interface BoardMapper {
	public int allListCount();
	public int curListCount();
	public List<BoardDTO> getAllList(@Param("s") int start,@Param("e") int end);
	public List<BoardDTO> getCurList(@Param("s") int start,@Param("e") int end);
}
