package com.book.usedbook.member.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.book.usedbook.member.dto.MemberDTO;
import com.book.usedbook.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	//비밀번호 암호화용
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Autowired
	MemberMapper mapper;

	@Override
	public MemberDTO getUserSessionId(String sid) {
		return mapper.getUserSessionId(sid);
	}

	@Override
	public int userCheck(HttpServletRequest req) {
		MemberDTO dto = mapper.userCheck(req.getParameter("id"));
		if(dto != null) {
			//암호화 안된 패스워드, 암호화 된 패스워드 2가지 경우 
			if(encoder.matches(req.getParameter("pw"), dto.getPw()) || dto.getPw().equals(req.getParameter("pw"))) {
				//로그인 성공 
				return 0;
			}	
		}
		//로그인 실패
		return 1;
	}

	@Override
	public int register(MemberDTO dto) {
		dto.setPw(encoder.encode(dto.getPw()));
		try {
			return mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void getMember(Model model, String id) {
		model.addAttribute("info",mapper.userCheck(id) );
	}

	@Override
	public void keepLogin(String sessionId, Date limitDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("id", id);
		mapper.keepLogin(map);
	}

	@Override
	public int checkOvr(String id) {
		ArrayList<String> idList = mapper.getId();
		if (idList.contains(id)) {
			return 1;
		}
		return 0;
	}

	@Override
	public int lenCheck(String str, int len) {
		if (str.length() == len) {
			return 0;
		}
		return 1;
	}

	@Override
	public int delete(MemberDTO dto, String id) {
		MemberDTO dbdto = mapper.userCheck(id);	
		if(encoder.matches(dto.getPw(), dbdto.getPw()) || dbdto.getPw().equals(dto.getPw())) {
			try {
				return mapper.delete(dto.getId());			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	@Override
	public int modifyCheck(String pw, String id) {
		MemberDTO dbdto = mapper.userCheck(id);	
		if(encoder.matches(pw, dbdto.getPw()) || dbdto.getPw().equals(pw)) {
			return 1;
		}
		return 0;
	}
	
	@Override
	public void modify(MemberDTO dto) {
		MemberDTO d = mapper.userCheck(dto.getId());
		if(!d.getPw().equals(dto.getPw())) {
			dto.setPw( encoder.encode(dto.getPw()) );
		}
		mapper.modify(dto);
	}

	@Override
	public void getMyList(Model model, String id, int num) {
		int pageLetter = 10;
		int allCount = mapper.listCount(id);

		int repeat = allCount / pageLetter;
		if( allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("myList", mapper.getMyList(start, end, id));
	}	
	
}
