package kr.or.ddit.ch12;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {

	private FilterConfig filterConfig = null; // FilterConfig를 전역변수로 설정
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Filter02 해제!");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("Filter02 실행!");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String msg = "";
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(id.equals(param1) && pw.equals(param2)) {
			// 로그인 처리 성공 시, filter02_process.jsp 페이지로 msg정보를 담아 넘긴다 (scope는 request로)
			msg = "로그인 성공";
			request.setAttribute("msg", msg);
		} else {
			// 로그인 처리 실패 시, filter02_process.jsp로 넘어가지 않고 응답으로 아래 메시지를 출력
			msg = "로그인 실패";
			msg += "<a href='filter02.jsp'>filter02 이동</a>";
			writer.println(msg);
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Filter02 초기화!");
		System.out.println("web.xml에 설정한 param을 담고 있는 filterConfig을 전역변수에 먼저 셋팅한다.");
		System.out.println("filterConfig.parameter 1 : "+filterConfig.getInitParameter("param1"));
		System.out.println("filterConfig.parameter 2 : "+filterConfig.getInitParameter("param2"));
		this.filterConfig = filterConfig;

	}

}
