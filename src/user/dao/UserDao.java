package user.dao;

import java.util.List;

import user.entity.User;

public interface UserDao {
	
	//用户登录
	public User loginByUser(String u_username,String u_password);
	
	//模糊查询全部用户信息
	public List<User> queryAllByUser(String value,int indexPage, int pageSize);
	
	//分页查询
	public List<User> listByUser(int indexPage,int pageSize) ;
	public int getPage();
	
	//用户添加
	public boolean addByUser(User u);
	
	//用户修改
	public boolean updateByUser(User u);
	
	//用户删除
	public boolean deleteByUser(String id);
	
	
}
