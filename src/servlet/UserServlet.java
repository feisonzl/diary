package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

public class UserServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDao userDao=null;
	public UserServlet() {
		// TODO Auto-generated constructor stub
		userDao=new UserDao();
	}
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
			System.out.println("checkUser!");
		}else if("register".equals(action)) {
			System.out.println("register!");	
			
			register(req,resp);
		}
	}
	public void checkUser(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		PrintWriter pw= resp.getWriter();
		pw.print("1");
		
	}
	public void register(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String username=req.getParameter("username");
		String pwd=req.getParameter("pwd");
		String sql="INSERT INTO tb_user (username,pwd,email,question,answer,city) VALUE ('"
			+ username
			+ "','"
			+ pwd
			+ "','"+"')";
		String result = userDao.register(sql);
		
		resp.setContentType("text/html");
		PrintWriter pw= resp.getWriter();
		pw.print("register result:"+result+"!!");
		pw.flush();
		pw.close();
	}
	

}
