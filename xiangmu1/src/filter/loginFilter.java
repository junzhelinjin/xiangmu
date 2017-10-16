package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.functors.ChainedClosure;

public class loginFilter implements Filter {

	@Override
	public void destroy() {
		
		
	}
	String ex=".css,.jpg,*.woff,.png,.js,";
	String match="/admin/login.jsp,/xiangmu1/login.jsp,/userlogin/login,/admin/operator/login,";
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse) response;
		String url=req.getServletPath();
		String e=url.substring(url.length()-3)+",";
		
		if(match.indexOf(url+",")>=0||ex.indexOf(e)>=0){
			chain.doFilter(req, resp);
		}else{
			if(req.getSession().getAttribute("user")==null){
					resp.sendRedirect("/xiangmu1/admin/login.jsp");
				return;
			}else{
				chain.doFilter(req, resp);
			}
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
