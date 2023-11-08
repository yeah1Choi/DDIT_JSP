package kr.or.ddit.ch12;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Filter01 해제");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 파라미터로 넘긴 이름이 존재하지 않을 때 특정 메세지를 포함하고 있는 페이지를 이턴
		// 넘겨받은 이름이 없다면, "입력된 name 값은 null 입니다. 다시 입력하세요."를 출력
		System.out.println("Filter01 수행");
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		
		if(name == null || name.equals("")) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter pw = response.getWriter();
			String msg = "<p> 입력된 name 값은 null 입니다. 다시 입력하세요.</p>" +
					"<a href='filter01.jsp'>Filter01 이동</a>";
			pw.println(msg);
			return; // 요청 URL로 넘어가지 않고 해당 필터에서 응답 페이지가 결과로 나간다.
			
			// 연속적으로 필터가 있으면 다음 필터
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Filter01 실행");
	}
	
}
