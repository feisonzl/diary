package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=req.getParameter("action");
		if("checkUser".equals(action)){
			checkUser(req,resp);
		}else if("register".equals(action)) {
			register(req,resp);
		}
	}
	public void checkUser(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		PrintWriter pw= resp.getWriter();
		pw.print("1");
		
	}
	public void register(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html");
		PrintWriter pw= resp.getWriter();
		pw.print("register success!!");
	}
	

}
