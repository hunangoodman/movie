package com.zking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zking.domain.Movie;
import com.zking.service.MovieService;

public class MovieManager extends BaseServlet {

	private MovieService ms=new MovieService();
	public void findAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setAttribute("list",ms.findByStatu(1));
		request.setAttribute("will",ms.findByStatu(0));
		request.getRequestDispatcher("pageHome.jsp").forward(request, response);
	}
	public void findByGener(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String gener=request.getParameter("gener");
		request.setAttribute("gener",gener);
		request.setAttribute("will",ms.findByGener(gener));
		request.getRequestDispatcher("gener.jsp").forward(request, response);
	}
	public void findBySearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String val=request.getParameter("movie");
		request.setAttribute("movie",ms.findBySearch(val));
		request.getRequestDispatcher("movie.jsp").forward(request, response);
	}
	public void findById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("item"));
		request.setAttribute("list",ms.findAllCaname(id));
		request.setAttribute("movie",ms.findById(id));
		request.getRequestDispatcher("movieinfo.jsp").forward(request, response);
	}
	public void findPlace(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		int mid=Integer.parseInt(request.getParameter("mid"));
		int hid=Integer.parseInt(request.getParameter("hid"));
		String sess=request.getParameter("sess");
		request.setAttribute("movie",ms.findById(mid));
		request.setAttribute("hall",ms.findHallInfo(cid,mid,hid,sess));
		request.setAttribute("place",ms.findPlace(cid,mid,hid,sess));
		request.getRequestDispatcher("place.jsp").forward(request, response);
	}
	public void createOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		int mid=Integer.parseInt(request.getParameter("mid"));
		int hid=Integer.parseInt(request.getParameter("hid"));
		String sess=request.getParameter("sess");
		
		int price=Integer.parseInt(request.getParameter("sumprice"));
		request.getSession().setAttribute("sumprice", price);
		//获得座位号，并插入座位表中
		String[] zuoNum=request.getParameter("zuo").split(",");
		ms.insertPlace(cid,hid,price,sess,zuoNum,(String)request.getSession().getAttribute("loginName"));
		queryOrder(request,response);
	}
	public void queryOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			request.setAttribute("order",ms.findOrderByUname((String)request.getSession().getAttribute("loginName")));
			System.out.println("已查询");
			request.getRequestDispatcher("order.jsp").forward(request, response);
	}
	public void deleteOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String username=(String)request.getSession().getAttribute("loginName");
		int zuo=Integer.parseInt(request.getParameter("zuo"));
		int price=Integer.parseInt(request.getParameter("price"));
		//PrintWriter out = response.getWriter();
		ms.deleteOrder(Integer.parseInt(request.getParameter("oid")),zuo,username,price);
	}
}
