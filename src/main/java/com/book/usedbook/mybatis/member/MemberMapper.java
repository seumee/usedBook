package com.book.usedbook.mybatis.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.book.usedbook.board.dto.BoardDTO;
import com.book.usedbook.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO userCheck(String id);
	public int register(MemberDTO dto);
	public void keepLogin(Map<String, Object> map);
	public MemberDTO getUserSessionId(String sid);
	public ArrayList<String> getId();
	public int delete(String id);
	public void modify(MemberDTO dto);
	public List<BoardDTO> getMyList(@Param("s") int start,@Param("e") int end, @Param("id") String id);
	public int listCount(String id);
}
