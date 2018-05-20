package com.zking.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String methodName=request.getParameter("method");
		if(methodName==null||methodName.trim().isEmpty()){
			throw new RuntimeException("��δ����method����,�޷�֪����Ҫʹ���ĸ�����");
		}
		Class c=this.getClass();
		Method method=null;
		try{
			method=c.getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);	
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException("��Ҫ�ķ���"+methodName+"������");
		}
		try{
			String result=(String) method.invoke(this, request,response);
			if(result==null||result.trim().isEmpty()){
				return;
			}else{
				request.getRequestDispatcher(result).forward(request, response);
			}
		}catch(Exception e){
			System.out.println("��Ҫ�ķ����ڲ��������쳣");
			throw new RuntimeException(e);
		}
	}
}
