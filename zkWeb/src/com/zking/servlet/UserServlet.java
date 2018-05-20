package com.zking.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zking.domain.User;
import com.zking.service.Userservice;

public class UserServlet extends BaseServlet {

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username=request.getParameter("username");
		String psw=request.getParameter("password1");
		String flog=request.getParameter("remenber");
		User user=new User(username,psw);
		if(request.getSession().getAttribute("loginName")==null||!request.getSession().getAttribute("loginName").equals(user.getUsername())){
			Userservice service=new Userservice();
			if(service.login(user)){
				request.getSession().setAttribute("loginName", user.getUsername());
				request.getRequestDispatcher("MovieManager?method=findAll").forward(request, response);
			}else{
				request.setAttribute("msg", "’À∫≈ªÚ√‹¬Î”–ŒÛ");
				request.getRequestDispatcher("User/login.jsp").forward(request, response);
			}	
		}else{
			request.setAttribute("msg", "ƒ˙“—æ≠µ«¬º");
			request.getRequestDispatcher("User/login.jsp").forward(request, response);
		}
			
	}
	
	public void regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Userservice service=new Userservice();
		String name=request.getParameter("username");
		String pas=request.getParameter("pas");
		User user=new User(name,pas);
		System.out.println(pas);
		service.regist(user);
		request.getSession().setAttribute("loginName", user.getUsername());
		request.getRequestDispatcher("MovieManager?method=findAll").forward(request, response);
	}
	public void checkName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Userservice service=new Userservice();
		String username=request.getParameter("username");
		if(service.check(username)){
			response.getWriter().write("0");
			response.getWriter().flush();
			response.getWriter().close();
		}
	}
	public void getKaptcha(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String kap=(String)request.getSession().
				getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		String kaptcha=request.getParameter("kaptcha");
		if(!kaptcha.equals(kap)){
			response.getWriter().write("0");
			response.getWriter().flush();
			response.getWriter().close();
		}
	}
}
