package user.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import user.entity.User;
import user.service.UserService;
import user.service.imp.UserServiceImp;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService=new UserServiceImp();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String method = request.getParameter("method");
		if("login".equals(method)){
			Login(request,response);
		}else if("queryList".equals(method)){
			queryList(request,response);
		}else if("userdelete".equals(method)){
			userdelete(request,response);
		}else if("useradd".equals(method)){
			useradd(request,response);
		}else if("userupdate".equals(method)){
			userupdate(request,response);
		}else if("mohuchaxun".equals(method)){
			mohuchaxun(request,response);
		}
	
	
	}

	private void mohuchaxun(HttpServletRequest request,
			HttpServletResponse response) {
		String param = request.getParameter("values");
		System.out.println("param==>"+param);
		int indexPage = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("rows"));
		
		List<User> list = userService.queryAllByUser(param, indexPage, pageSize);
		System.out.println("___***___"+list.toString());
		String users = "{\"total\":"+userService.getPage()+" , \"rows\":"+JSONArray.fromObject(list).toString()+"}";
		
		try {
			response.getWriter().write(users);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}

	private void userdelete(HttpServletRequest request,
			HttpServletResponse response) {
		try{	
			String id = request.getParameter("u_id");
			System.out.println("******"+id);
			userService.deleteByUser(id);
			String str = "{\"status\":\"ok\",\"message\":\"用户保存操作成功!\"}";
			response.getWriter().write(str);
		} catch (Exception e) {
			// TODO: handle exception
			String str = "{\"status\":\"fail\",\"message\":\"用户保存操作失败!\"}";
			try {
				response.getWriter().write(str);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
			
	}

	private void userupdate(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String u_id = request.getParameter("u_id");
			
			String username = request.getParameter("u_username");
			String password = request.getParameter("u_password");
			int age = Integer.parseInt(request.getParameter("u_age"));
			int sexsex = Integer.parseInt(request.getParameter("u_sex"));
			String sex =null;
			if(sexsex==1){
				sex="男";
				
			}else if(sexsex==0){
				sex="女";
			}
			String address = request.getParameter("u_address");
			
			userService.updateByUser(new User(0,u_id,username,password,age,sex,address));
			String str = "{\"status\":\"ok\",\"message\":\"用户修改操作成功!\"}";
			response.getWriter().write(str);
		} catch (Exception e) {
			// TODO: handle exception
			String str = "{\"status\":\"fail\",\"message\":\"用户修改操作失败!\"}";
			try {
				response.getWriter().write(str);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
	}

	private void useradd(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String u_id = request.getParameter("u_id");
			String username = request.getParameter("u_username");
			String password = request.getParameter("u_password");
			int age = Integer.parseInt(request.getParameter("u_age"));
			String sex = request.getParameter("u_sex");
			String address = request.getParameter("u_address");
			
			userService.addByUser(new User(0,u_id,username,password,age,sex,address));
			String str = "{\"status\":\"ok\",\"message\":\"用户保存操作成功!\"}";
			response.getWriter().write(str);
		} catch (Exception e) {
			// TODO: handle exception
			String str = "{\"status\":\"fail\",\"message\":\"用户保存操作失败!\"}";
			try {
				response.getWriter().write(str);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
		
	

	private void Login(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("u_username");
		String password = request.getParameter("u_password");
		User loginByUser = userService.loginByUser(username, password);
		try {
			if(loginByUser!=null&&!loginByUser.equals("")){
			String str = "status:ok message:登录成功";
			//String result = "{\"status\":\"ok\",\"message\":\"登录成功!\"}";
			String result = "{\"status\":\"ok\",\"message\":\"登录成功!\"}";
				response.getWriter().write(result);
			}else{
				String result = "{\"status\":\"fail\",\"message\":\"账号或密码错误登录失败，请核实重试!\"}";
				response.getWriter().write(result);
			}	
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		
		
	}

	private void queryList(HttpServletRequest request,
			HttpServletResponse response) {
		
		//List<User> list = userService.queryAllByUser();
		int indexPage = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("rows"));
		
		List<User> listByUser = userService.listByUser(indexPage, pageSize);
		System.out.println("___***___"+listByUser.toString());
		String users = "{\"total\":"+userService.getPage()+" , \"rows\":"+JSONArray.fromObject(listByUser).toString()+"}";
		
		try {
			response.getWriter().write(users);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
