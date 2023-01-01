package com.book.usedbook.member.controller;

import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.usedbook.member.dto.MemberDTO;
import com.book.usedbook.member.service.MemberService;
import com.book.usedbook.session.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession{
	@Autowired MemberService ms;
	
	@GetMapping("register_form")
	public String registerForm() {
		return "member/register";
	}
	@PostMapping("register")
	public String register(MemberDTO dto) {
		if(ms.checkOvr(dto.getId())==0) {			
			int result = ms.register(dto);
			// 1: 회원가입 성공 -> 로그인 페이지로 리다이렉트
			if(result == 1) return "redirect:login";
		}
		// 0: 실패 -> 회원가입 재시도
		return "redirect:register_form";
	}
	
	//로그인
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	//로그인 창에서 입력받은 정보 처리
	@PostMapping("user_check")
	public String userCheck(HttpServletRequest req, RedirectAttributes rs) {
		int result = ms.userCheck(req);
		if(result == 0) {
			//로그인 성공
			rs.addAttribute("id", req.getParameter("id"));
			rs.addAttribute("autoLogin", req.getParameter("autoLogin"));
			return "redirect:successLogin";
		}
		//로그인 실패 -> login페이지로 다시 이동. 로그인 재시도
		return "redirect:login";
	}
	// 로그인 성공시 쿠키/세션 관리
	@RequestMapping("successLogin")
	public String successLogin(HttpServletRequest req, HttpSession session, HttpServletResponse response) {
		/* System.out.println("autoLogin: " + req.getParameter("autoLogin")); */
		session.setAttribute(LOGIN, req.getParameter("id"));
		//autoLogin 체크 -> 쿠키 설정
		if(req.getParameter("autoLogin") != null) {
			int limitTime = 60*60*24*90;
			Cookie loginCookie = new Cookie("bookLoginCookie", session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new java.util.Date());
			cal.add(Calendar.MONTH, 3);
			
			Date limitDate = new Date(cal.getTimeInMillis());
			ms.keepLogin(session.getId(), limitDate, req.getParameter("id"));
		}
		return "home";
	}
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response, @CookieValue(value="bookLoginCookie", required=false) Cookie loginCookie) {
		if(session.getAttribute(LOGIN) != null) {
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
				ms.keepLogin("nan", new Date(System.currentTimeMillis()), (String)session.getAttribute(LOGIN));
			}
			session.invalidate();
		}
		return "redirect:/";
	}

	@GetMapping("myPage")
	public String myPage(HttpSession session, Model model) {
		ms.getMember(model, (String)session.getAttribute(LOGIN));
		return "member/mypage";
	}
	
	@GetMapping("modify_check")
	public String modifyCheck(@RequestParam String id, HttpSession session) {
		if(id.equals((String)session.getAttribute(LOGIN))) {
			return "member/modify";
		}
		return "default/notAllowed";
	}
	@PostMapping("modify_form")
	public String modifyForm(@RequestParam String id,@RequestParam String pw, Model model,
			HttpServletResponse response) throws Exception {
		int result = ms.modifyCheck(pw, id);
		if(result != 1) {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
            model.addAttribute("url","/member/myPage");
			return "default/alert";
		}
		ms.getMember(model, id);
		return "member/modify_form";
	}
	@PostMapping("modify")
	public String modify(MemberDTO dto, Model model) {
		ms.modify(dto);
		model.addAttribute("msg","수정이 완료되었습니다.");
        model.addAttribute("url","/member/myPage");
		return "default/alert";
	}
	@GetMapping("delete_form")
	public String deleteForm(@RequestParam String id, HttpSession session) {
		if(id.equals((String)session.getAttribute(LOGIN))) {
			return "member/delete";
		}
		return "default/notAllowed";
	}
	@PostMapping("delete")
	public String delete(MemberDTO dto, Model model) {
		int result = ms.delete(dto, dto.getId());
		if(result == 1) {
			return "redirect:logout";
		}
		model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
        model.addAttribute("url","/member/myPage");
		return "default/alert";
	}
	@GetMapping(value="check_ovr/{id}", produces="application/json; charset=utf-8")
	@ResponseBody
	public int checkOvr(@PathVariable String id) {
		if(ms.checkOvr(id) == 1) return 1;
		return 0;
	}
	@GetMapping(value="lenCheck/{stNum}", produces="application/json; charset=utf-8")
	@ResponseBody
	public int lenCheck(@PathVariable String stNum) {
		if(ms.lenCheck(stNum, 8) == 1) return 1;
		return 0;
	}
	@GetMapping("myList")
	public String myList(Model model, HttpSession session, @RequestParam(value="num",required=false, defaultValue ="1") int num) {
		ms.getMyList(model, (String)session.getAttribute(LOGIN), num);
		return "board/myList";
	}
}
