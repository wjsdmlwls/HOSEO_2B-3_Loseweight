package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class logincontrol extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse resp) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest req,HttpServletResponse resp)  throws ServletException, IOException {
		super.doPost(req, resp);
	}
	public Boolean checkLogin(String email,String password) {
		//
		String sql ="select email from user where email ='"+ email+"' and password='"+password+"';";
		return true;
	}
}

